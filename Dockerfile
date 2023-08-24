
# The original Dockerfile contains two FROM commands, which is not valid.
# We will remove the first FROM command (FROM debian:11) and use the second one as the base image.
FROM python:3.10.4

# Set the working directory to /KomiRobot/
# This is where the application files will be copied to.
WORKDIR /KomiRobot/

# Update and install dependencies
# We will use the apt package manager to install git, wget, curl, bash, neofetch, ffmpeg, and software-properties-common.
RUN apt-get update && apt-get upgrade -y && apt-get install -y git wget curl bash neofetch ffmpeg software-properties-common

# Copy requirements.txt file to the working directory
# This file contains the required Python packages for our application.
# We need to copy it to the container's working directory.
COPY requirements.txt .

# Install wheel package
# The wheel package is required to build Python wheels from source.
# We will install it using the default python package manager.
RUN python3 -m pip install wheel

# Fix Typo: The original command incorrectly specifies the package manager as python3 instead of pip3
# Install all the required packages listed in requirements.txt
# We will use the -r flag to specify the requirements.txt file and install all the packages.
RUN pip3 install --no-cache-dir -U -r requirements.txt

# Copy the rest of the files to the working directory
# We need to copy all the files from the host machine to the container's working directory.
COPY . .

# Fix Typo: The original command incorrectly specifies the Python module as KomiRobot instead of komirobot
# Set the command to run the komirobot python module
# We will use the CMD command to specify the command that should be executed when the container starts.
# In this case, we will run the komirobot python module using the python3 interpreter.
CMD ["python3.10", "-m", "komirobot"]

# The original Dockerfile contains two FROM commands, which is not valid.
#We will remove the first FROM command (FROM debian:11) and use the second one as the base image.
FROM python:3.10.4

# Set the working directory to /KomiRobot/
# This is where the application files will be copied to.
WORKDIR /KomiRobot/

# Update and install dependencies
# We will use the apt package manager to install git, wget, curl, bash, neofetch, ffmpeg, and software-properties-common.
RUN apt-get update && apt-get upgrade -y && apt-get install -y git wget curl bash neofetch ffmpeg software-properties-common

# Copy requirements.txt file to the working directory
# This file contains the required Python packages for our application.
# We need to copy it to the container's working directory.
COPY requirements.txt .

# Install wheel package
# The wheel package is required to build Python wheels from source.
# We will install it using the default python package manager.
RUN python3 -m pip install wheel

# Install all the required packages listed in requirements.txt
# We will use the -r flag to specify the requirements.txt file and install all the packages.
RUN python3 -m pip install --no-cache-dir -U -r requirements.txt

# Copy the rest of the files to the working directory
# We need to copy all the files from the host machine to the container's working directory.
COPY . .

# Set the command to run the KomiRobot python module
# We will use the CMD command to specify the command that should be executed when the container starts.
# In this case, we will run the KomiRobot python module using the python3 interpreter.
CMD ["python3.10", "-m", "KomiRobot"]


