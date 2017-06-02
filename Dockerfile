FROM alpine:latest

MAINTAINER ihanken, https://github.com/ihanken/league-bot

#Install dependencies
# RUN sudo apt-get update \
#     && sudo apt-get install software-properties-common -y \
#     && sudo add-apt-repository ppa:fkrull/deadsnakes -y \
#     && sudo add-apt-repository ppa:mc3man/trusty-media -y \
#     && sudo apt-get update -y \
#     && sudo apt-get install build-essential unzip -y \
#     && sudo apt-get install python3.5 python3.5-dev -y \
#     && sudo apt-get install ffmpeg -y \
#     && sudo apt-get install libopus-dev -y \
#     && sudo apt-get install libffi-dev -y

RUN apk update && apk upgrade

RUN apk add build-base \
    curl \
    python3 \
    python3-dev \
    ffmpeg \
    opus-dev \
    openssl-dev \
    libffi-dev \
    gcc \
    libxml2-dev \
    libxslt-dev \

# Clean APK cache
RUN rm -rf /var/cache/apk/*

#Add musicBot
ADD . /musicBot
WORKDIR /musicBot

#Install PIP dependencies
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

#Add volume for configuration
VOLUME /musicBot/config

CMD python3.5 run.py
