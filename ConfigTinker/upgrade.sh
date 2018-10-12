#!/bin/bash
# Licensed under the GNU GPLv3.
#.%%...%%..%%%%%%...%%%%...%%..%%...%%%%.._.
#.%%%.%%%....%%....%%......%%.%%...%%..%%.2.
#.%%.%.%%....%%.....%%%%...%%%%....%%..%%.0.
#.%%...%%....%%........%%..%%.%%...%%..%%.8.
#.%%...%%..%%%%%%...%%%%...%%..%%...%%%%..3.
# Bash/YAD Debian Package Updater based on Linux Lite update tool
# ------- Change log ------
# Switched to YAD and adapted to Debian
# Added: a main dialog loop, log, option to purge the lists, about dialog
# Added: a check for exclusive lock
# -----------------------------------
# Note:
# -----------------------------------
# Milos Pavlovic (http://vsido.org/index.php?topic=1118.0)
#

APPNAME="Update Tool"
LOGFILE=/var/log/misko-update.log
UPDATELOG=/var/log/last-update-log.log
# dist-upgrade or upgrade, change next line
COMMAND=dist-upgrade
# Yad window icon
ic=/usr/local/bin/images/vsidoorb_80.png

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root!" 1>&2
	echo "TIP: Use gksudo or a similar tool." 1>&2
	exit 1
fi

function log(){
	message="$@"
	echo '['$(date +%D\ %H:%M:%S)'] '$message | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})*)?m//g" | fold -sw 76 >>$LOGFILE
}

function checklock () {
# Checks for exclusive lock and wait until package managers are closed
while  fuser /var/lib/dpkg/lock 2>&1 >/dev/null  ; do
	echo "# Waiting for other software managers to finish..." $"\n"
	if [ "$(pidof synaptic)" ]; then
		echo "# Waiting for other software managers to finish..." $"\nsynaptic"
	fi
	echo 1
	sleep 1
	echo 30
	sleep 1
	echo 60
	sleep 1
	if [ ! -z "$(pgrep gdebi-gtk)" ]; then
		echo "# Waiting for other software managers to finish..." $"\ngdebi-gtk"
	fi
	echo 95
	sleep 1
done | (if ! yad --progress --center --title="$APPNAME - close any open package managers" --percentage=20 --auto-close --button="Cancel:1";then killall $(basename $0); exit; fi)

}


function showlog () {
	if [[ ! -f $LOGFILE ]]; then
		yad --info --center --title="$APPNAME Info" --text="No log file."
	elif  [[  -z "$(cat $LOGFILE)"  ]]; then
		yad --info --center --title="$APPNAME Info" --text="Log is empty."
	else
		yad --text-info  --center --button="Open log in Medit:0" --button="Close:1" --title="$APPNAME log file -> $log" --height=600 --width=800 --filename="$LOGFILE"
		if [ "${PIPESTATUS[0]}" -eq "0" ]; then
			medit "$LOGFILE" &
		fi
	fi
	return
}

function about () {
	yad --info --title="About $APPNAME " --height=20 --width=300 --center --text="$APPNAME is a small update GUI, fork of Linux Lite Upgrade tool and very easy to use.\n\nLicence GPL v3.\n\n Milos Pavlovic 2016"
	return
}

function update() {

# Temporary file for error tracking
TMPLIST=$(mktemp /tmp/repos.XXXXXX)

APTUPDATE=$(grep '^deb' -c /etc/apt/sources.list) # Total number of repositories registered, this is approximated

apt-get update 2>&1 | tee $TMPLIST | awk -v total=$APTUPDATE '/^Ign|^Get/{count++;$1=""} FNR { if (total != 0){percentage=int (100*count/total);print (percentage < 90?percentage:90),"\n#",substr($0, 0, 128) }; fflush(stdout)}' \
| yad --progress --text="Updating package lists..." --window-icon="$ic" --title="Updating Software Sources - please wait..." --percentage=0 --auto-close --width=600 --center

	if [ "${PIPESTATUS[0]}" -ne "0" ]; then
		err_msg=$(awk '/^(W:|E:)/{$1=""; print $0}' $TMPLIST | tail -n 1 )	#Get errors/warnings
		log "ERROR: $err_msg"
		unset APTUPDATE
		rm -f $TMPLIST
		unset TMPLIST
		yad --error --center \
		--title="Error" --text="$APPNAME couldn't fetch the package cache information lists.\nCheck the log for details"

		return
	fi

log "INFO: Software sources were updated."

unset APTUPDATE
rm -f $TMPLIST
unset TMPLIST

#  Temporary list of available updates
UPDATES=$(mktemp /tmp/updateslist.XXXXXX)

# Creates a list in /tmp/updateslist
apt-get --just-print $COMMAND 2>&1 | perl -ne 'if (/Inst\s([\w,\-,\d,\.,~,:,\+]+)\s\[([\w,\-,\d,\.,~,:,\+]+)\]\s\(([\w,\-,\d,\.,~,:,\+]+)\)? /i) {print "Name: $1 INSTALLED: $2 AVAILABLE: $3\n"}' | awk '{print NR,":\t"$0}' \
| tee $UPDATES  | yad --progress --window-icon="$ic" --center --pulsate --title="Calculating Updates" --text="Please wait..." --auto-close

# Check if any updates are available, if there are none, script pops up dialog box saying 'No Updates Available', removes /tmp/updateslist.XXXXXX
if [  -z "$(cat $UPDATES)"  ]; then
	log "INFO: No updates are available."
	rm -f $UPDATES
	unset UPDATES
	yad --info --center --width=400 --height=300 --window-icon=$ic --title="$APPNAME" \
	--text="No Updates Available"

	return
fi
	# Log available updates
    lst_upgrades=$(awk 'BEGIN { FS = "[ ]" } { print $3 }' $UPDATES)
    log "INFO: Updates available: $lst_upgrades"
    unset lst_upgrades

# Insert text into  /tmp/updateslist.XXXXXX
sed -i -e '1 i\List of available Updates' -e '1 i\Click Update to continue or Cancel to stop the update process\n'  $UPDATES

# Erase existing available info
sudo dpkg --clear-avail

# Call the yad dialog to show update list
yad --text-info --center --window-icon="$ic" --button="Update:0" --button="Cancel:1" --title="Available Updates" --width=780 --height=300 --filename="$UPDATES"

	# Continue script if no halt
	if [ "$?" -eq "0" ];then


		# Write log
		log "INFO: Update started."

		# Remove tmp file and unset variable
		rm -f $UPDATES
		unset UPDATES

		# Begin upgrade
		DEBIAN_FRONTEND=noninteractive apt-get  -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" $COMMAND --show-progress -y  2>&1 | tee $UPDATELOG | awk ' BEGIN { FS=" "; total=1;end_download=0} /upgraded/ {total= $1 + $3;FS="[ :]" } /^Get:[[:digit:]]+/ {printf "#Downloading %s %s %s\n",$7,$(NF-1),$NF;print int(($2 - 1) * 100 / total); fflush(stdout)} /^\(Reading / {if (end_download==0){print 100;fflush(stdout);end_download=1}} /^(Preparing|Unpacking|Selecting|Processing|Setting|Download)/ {print "#", $0; fflush(stdout)}  /^Progress/ {print  match($0, /([0-9]+)/, arr); if(arr[1] != "") print arr[1] ; fflush(stdout)}' \
		| ( yad --window-icon=$ic --progress --width=600 --text="Downloading package(s)...\nThis may take a while." --title="Downloading - please wait..." --percentage=0 --auto-close ; yad --progress --window-icon=$ic --width=600 --text="Installing and configuring packages...\nThis may take a while." --title="Installing - please wait..." --auto-close )

		if [ "${PIPESTATUS[0]}" -ne "0" ]; then
			err_msg=$(awk '/^(W:|E:)/{$1=""; print $0}' $UPDATELOG | tail -n 1)
			log "ERROR:$err_msg"
			yad --error --center \
			--title="Error" --window-icon="$ic" --text="Updates have failed.\nCheck the log for details."
			return
		fi

	# Halt updates script if user selects Cancel
	else
		log "INFO: User has canceled software upgrades."
		rm -f $UPDATES
		unset UPDATES
		return
	fi

log "INFO: Updates successfully installed."

PROCEED=$(yad --question --center --title="$APPNAME" --text="Updates have finished installing.\n\nWould you like to view the $APPNAME log?"; echo $?)

	if [ ${PROCEED} -eq 1 ]; then
		yad --info --center --title="$APPNAME" --text="Updates Complete."
		return;
	else
		yad --text-info --center --ok-label="Quit" --cancel-label="Cancel" --title="Updates Log" --width=700 --height=300 --filename="$UPDATELOG"
	fi

return
}


# Start the main loop
while (true); do
	selection=$(yad --list --center --radiolist --title="$APPNAME" --window-icon="$ic" --text="Pick a task" --height=310 --width=350 --hide-column=2 --button="Exit:1" --button="Select:0" --column="" --column="Function" --column="Choix" \
	"TRUE" "update" "Mise à jour des logiciel" "FALSE" "showlog" "Show log" "FALSE" "purgecache" "Purger le cache" "FALSE" "about" "About" --print-column=2) || exit
	selection=$(echo $selection | cut -d '|' -f 1)

	case "$selection" in
		update) checklock; update
		;;
		showlog) showlog
		;;
		purgecache) checklock; sudo rm -vfd /var/lib/apt/lists/*  || yad --error --text="Error while purging the cache\nTry doing it manualy sudo rm /var/lib/apt/lists/* -vf"
		;;
		about) about
		;;
	esac
done
