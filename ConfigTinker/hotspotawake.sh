#!/bin/bash -i
if [[ -x /sbin/iwlist ]]
then
	connected=$(iw dev wlan0 station dump)
	if [[ -z  ${connected} ]]
	then
		echo $(date) > /tmp/hotspotawake.log
		s=$(sed -n "$=" /tmp/hotspot.wake)
		echo "$(date) réveil du hotspot" >> /tmp/hotspot.wake
		if [[ ${s} -gt 100 ]]
		then
			rm -rf /tmp/hotspot.wake
			echo "$(date) réveil du hotspot" >> /tmp/hotspot.wake
		fi
    	sudo iwlist scan >> /tmp/hotspotawake.log 2>&1
	fi
else
   	echo "'iwlist' is not installed (package \"wireless-tools\")." > /tmp/hotspotawake.log
fi
