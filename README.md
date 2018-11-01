# Dockerfile file for the VNC and noVNC servers

Docker images: https://hub.docker.com/r/mrakitin/novnc.

Inspired by https://github.com/AustralianSynchrotron.

## How to run:

### On the host machine
```
$ docker run -p 5901:5901 -p 6080:6080 -it --rm mrakitin/novnc bash
```

### Inside the container
Start the VNC server in the background:
```
# vncserver
xauth:  file /root/.Xauthority does not exist

New 'X' desktop is f8f1e509b3a9:1

Creating default startup script /root/.vnc/xstartup
Starting applications specified in /root/.vnc/xstartup
Log file is /root/.vnc/f8f1e509b3a9:1.log
```

Start the noVNC server:
```
# ~/noVNC/utils/launch.sh --vnc localhost:5901
Warning: could not find self.pem
No installed websockify, attempting to clone websockify...
Cloning into '/root/noVNC/utils/websockify'...
remote: Enumerating objects: 13, done.
remote: Counting objects: 100% (13/13), done.
remote: Compressing objects: 100% (11/11), done.
remote: Total 4027 (delta 3), reused 6 (delta 2), pack-reused 4014
Receiving objects: 100% (4027/4027), 4.53 MiB, done.
Resolving deltas: 100% (2658/2658), done.
Using local websockify at /root/noVNC/utils/websockify/run
Starting webserver and WebSockets proxy on port 6080
/root/noVNC/utils/websockify/websockify/websocket.py:30: UserWarning: no 'numpy' module, HyBi protocol will be slower
  warnings.warn("no 'numpy' module, HyBi protocol will be slower")
WebSocket server settings:
  - Listen on :6080
  - Web server. Web root: /root/noVNC
  - No SSL/TLS support (no cert file)
  - proxying from :6080 to localhost:5901


Navigate to this URL:

    http://f8f1e509b3a9:6080/vnc.html?host=f8f1e509b3a9&port=6080

Press Ctrl-C to exit
```

Or it can be run in the background:
```
# nohup ~/noVNC/utils/launch.sh --vnc localhost:5901 > ~/.vnc/novnc.log 2>&1 &
```

Access the server http://localhost:6080/vnc.html in a browser on your host
machine with the `vncuser` password (check the `Dockerfile` for the up-to-date
information about the password).
