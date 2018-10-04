#!/bin/bash -i
(while true
do
	if [ -x /sbin/iwlist ]; then
	    iwlist chan > /tmp/log 2>&1
	else
    	echo "'iwlist' is not installed (package \"wireless-tools\")."
	fi
	sleep 5
done) &


