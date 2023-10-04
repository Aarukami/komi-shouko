
FROM debian:11
FROM python:3.10.4

WORKDIR /ShoukoRobot/

RUN apt-get update && apt-get upgrade -y && apt-get install -y git wget curl bash neofetch ffmpeg software-properties-common

COPY requirements.txt .


RUN pip install wheel



RUN pip install --no-cache-dir -U -r requirements.txt


COPY . .


CMD ["python3", "-m", "ShoukoRobot"]


