#!/bin/bash
xhost +

tag="indigo"
if [ "$1" = "kinetic" ]
then
  tag="kinetic"
fi

nvidia-docker run -it -d --rm\
    --net=host \
    --env="DISPLAY" \
    --env=TERM="xterm-color"\
    --env=HOME="/home/nissan"\
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$HOME:/home/nissan:rw"\
    --workdir="/home/nissan/hitGit/hit-ros/utils"\
    --name="hitachi_humandrive_container"\
    --privileged=True \
    --dns 127.0.0.53 \
    --volume="/media/alexey/4tb-linux-data:/data:rw"\
    hitachi_humandrive:$tag $SHELL


