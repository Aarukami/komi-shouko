FROM debian:11
FROM python:3.9


# Set the working directory to /KomiRobot/
WORKDIR /KomiRobot/

# Update and install dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install git
RUN python3.9 -m pip install -U pip
RUN apt-get install -y wget python3-pip curl bash neofetch ffmpeg software-properties-common

# Copy requirements.txt file to the working directory
COPY requirements.txt .

# Install wheel package
RUN python3.9 -m pip install wheel

# Install all the required packages listed in requirements.txt
RUN python3.9 -m pip install --no-cache-dir -U -r requirements.txt

# Copy the rest of the files to the working directory
COPY . .

# Set the command to run the KomiRobot python module
CMD ["python3.9", "-m", "KomiRobot"]

