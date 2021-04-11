# TII / Indoor Project PX4 Container

Contains Dockerfiles for Docker containers to build and test Indoor Drone project.

Based on [PX4-containers](https://github.com/PX4/PX4-containers)

## Usage

```
cd docker
./0_build.sh  ###  build images from scratch. about 25 mins.
./1_run.sh    ###  start container in background
./2_attach.sh ###  attach new terminal to the running container
./3_kill.sh   ###  kill the running container
```
