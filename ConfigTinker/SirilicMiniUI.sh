#/bin/bash
if retour=$(yad \
--form \
--center --image="/usr/share/pixmaps/SirilicMiniUI.png" \
--field="CB":CB  "^Sirilic\!Sirilot\!SirilRemote")
then
	soft=$(echo "$retour" | cut -d "|" -f1)
	exec $soft
fi
