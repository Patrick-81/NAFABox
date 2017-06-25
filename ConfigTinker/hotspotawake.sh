#!/bin/bash
if [ -x /sbin/iwlist ]
then
	connected=$(iw dev wlan0 station dump)
	if [[ -z  $connected ]]
	then
		echo $(date) > /tmp/hotspotawake.log
    	sudo iwlist scan >> /tmp/hotspotawake.log 2>&1
	fi
else
   	echo "'iwlist' is not installed (package \"wireless-tools\")." > /tmp/hotspotawake.log
fi
