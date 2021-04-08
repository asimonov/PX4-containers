#! /bin/bash
xhost +

# docker hygiene

#Delete all stopped containers (including data-only containers)
#docker rm $(docker ps -a -q)

#Delete all 'untagged/dangling' (<none>) images
#docker rmi $(docker images -q -f dangling=true)

#echo "PX4_DOCKER_REPO: $PX4_DOCKER_REPO";

#PWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
#SRC_DIR=$PWD/../
SRC_DIR=$HOME/dev/px4/PX4-Autopilot

CCACHE_DIR=${HOME}/.ccache
mkdir -p "${CCACHE_DIR}"

# Run docker and open bash shell
docker run -it -d \
  --privileged \
  --dns 127.0.0.53 \
  --net=host \
  --env DISPLAY=${DISPLAY} \
  --env=TERM="xterm-color"\
  --env=HOME="/home/nissan"\
  --env="QT_X11_NO_MITSHM=1" \
  --env=LOCAL_USER_ID="$(id -u)" \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --publish 14556:14556/udp \
  --volume=${CCACHE_DIR}:${CCACHE_DIR}:rw \
  --volume=${SRC_DIR}:/src/PX4-Autopilot/:rw \
  -w /src/PX4-Autopilot/ \
  --name=px4_alexey \
  px4io/px4-dev-opengl:latest bash


#docker run -it --rm -w "${SRC_DIR}" \
#	--env=AWS_ACCESS_KEY_ID \
#	--env=AWS_SECRET_ACCESS_KEY \
#	--env=BRANCH_NAME \
#	--env=CCACHE_DIR="${CCACHE_DIR}" \
#	--env=CI \
#	--env=CODECOV_TOKEN \
#	--env=COVERALLS_REPO_TOKEN \
#	--env=LOCAL_USER_ID="$(id -u)" \
#	--env=PX4_ASAN \
#	--env=PX4_MSAN \
#	--env=PX4_TSAN \
#	--env=PX4_UBSAN \
#	--env=TRAVIS_BRANCH \
#	--env=TRAVIS_BUILD_ID \
#	--publish 14556:14556/udp \
#	--volume=${CCACHE_DIR}:${CCACHE_DIR}:rw \
#	--volume=${SRC_DIR}:${SRC_DIR}:rw \
#	${PX4_DOCKER_REPO} /bin/bash -c "$1 $2 $3"
