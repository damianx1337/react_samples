IMG_NAME=react-app
VTAG=$(shell date +"%y%m%d-%H")
#VTAG=$(shell date +"%y%m%d")-$(shell git branch --show-current)
CT_NAME=${IMG_NAME}_ct
MAINTAINER=$(shell whoami)
CT_FILE=Containerfile
CT_PORT=8080
HOST_PORT=8080


build:
	podman build -f ${CT_FILE} -t ${MAINTAINER}/${IMG_NAME}:${VTAG}
	podman image prune -f
	podman builder prune -f
	podman system prune -f

run:
	podman run -it --rm -p ${HOST_PORT}:${CT_PORT} --name ${CT_NAME} ${MAINTAINER}/${IMG_NAME}:${VTAG}

view-logs:
	podman logs ${CT_NAME}
