
# The FROM command is used to specify the base image for the Dockerfile.
# We will use the python:3.9 image as our base image.
FROM debian:11
FROM python:3.10.12-slim-buster

# Set the working directory to /KomiRobot/
# This is where the application files will be copied to.
WORKKDIR /KomiRobot/

# Update and install dependencies
# We will replace the first FROM command with the debian image to install additional dependencies.
# We will use the apt package manager to install git, wget, curl, bash, neofetch, ffmpeg, and software-properties-common.
RUN apt-get update && apt-get upgrade -y && apt-get install -y git wget curl bash neofetch ffmpeg software-properties-common

# Copy requirements.txt file to the working directory
# This file contains the required Python packages for our application.
# We need to copy it to the container's working directory.
COPY requirements.txt .

# Install wheel package
# The wheel package is required to build Python wheels from source.
# We will install it using the python3.9 package manager.
RUN python3.9 -m pip install wheel

# Install all the required packages listed in requirements.txt
# We will use the -r flag to specify the requirements.txt file and install all the packages.
RUN python3.9 -m pip install --no-cache-dir -U -r requirements.txt

# Copy the rest of the files to the working directory
# We need to copy all the files from the host machine to the container's working directory.
COPY . .

# Set the command to run the KomiRobot python module
# We will use the CMD command to specify the command that should be executed when the container starts.
# In this case, we will run the KomiRobot python module using the python3.9 interpreter.
CMD ["python3.9", "-m", "KomiRobot"]

