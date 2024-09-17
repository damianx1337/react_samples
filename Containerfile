# syntax=docker/dockerfile:1

FROM docker.io/library/debian:bookworm-slim


ENV APP_NAME=react-app


RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y vim wget openssl
RUN apt-get install -y nodejs npm

RUN npm install -g create-react-app
RUN npm i -g npx

RUN useradd -m -d /home/noadm -s /bin/bash noadm

WORKDIR /home/noadm

USER root

COPY ./src /home/noadm

CMD ["/bin/bash"]
