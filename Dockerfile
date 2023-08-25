
FROM debian:11
FROM python:3.10.4

WORKDIR /KomiRobot/

RUN apt-get update && apt-get upgrade -y && apt-get install -y git wget curl bash neofetch ffmpeg software-properties-common

COPY requirements.txt .


RUN pip install wheel


ENV PIP_ROOT_USER_ACTION=ignore


RUN pip install --no-cache-dir -U -r requirements.txt


COPY . .


CMD ["python3", "-m", "KomiRobot"]


