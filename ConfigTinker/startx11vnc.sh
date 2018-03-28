# Start x11vnc server @ login
/usr/bin/x11vnc -shared -forever -o ~/.x11vnc/x11vnc.log > /dev/null 2>&1 &
