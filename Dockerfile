FROM ubuntu:19.04

RUN groupadd -g 999 app_user && \
    useradd -r -u 999 -g app_user app_user

RUN apt update \
    && apt -y upgrade \
    && apt install -y python3 python3-pip --no-install-recommends \
    && pip3 install --upgrade pip \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3 10
