#!/bin/bash
xhost +
nvidia-docker run -it --rm\
    --net=host \
    --env="DISPLAY" \
    --env=TERM="xterm-color"\
    --env=HOME="/home/user"\
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$HOME:/home/user:rw"\
    --workdir="/home/user/dev/px4"\
    --name="px4_container"\
    --privileged=True \
    --dns 127.0.0.53 \
    px4io/px4-dev-demo $SHELL


#docker run -it px4io/px4-dev-ros2-dashing
