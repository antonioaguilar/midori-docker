#!/bin/bash
export DISPLAY=":1"

if [ -z "$1" ]
then
  URL=https://google.com
else
  URL=$1
fi

if [ -z "$2" ]
then
  RESOLUTION=1280x800
else
  RESOLUTION=$2
fi

if [ -z "$PORT" ]
then
  VNC_PORT=5901
else
  VNC_PORT=$PORT
fi

# Midori flags:
# https://gist.github.com/wesQ3/a830b865e07ec16a6ebf

# VNC server resolutions
# 320x240,480x320,482x320,560x360,576x360,640x480,640x482,648x486,720x480,720x486,720x540,720x576,
# 768x576,800x480,800x600,1024x600,1024x768,1280x720,1280x800,1280x1024,1366x768,1400x1050,1440x900,
# 1600x900,1600x1024,1600x1200,1680x1050,1920x1080,1920x1200,2048x1024,2048x1152,2048x1536,2560x1080,
# 2560x1440,2560x1600,2560x2048,3072x1536,3072x1728,3840x2160,4096x2048,4096x2304,7680x4320,8192x4096

vncserver $DISPLAY -geometry $RESOLUTION -rfbport $VNC_PORT && \
tail -f /root/.vnc/*.log & \
midori -e Navigationbar -e Statusbar $URL
