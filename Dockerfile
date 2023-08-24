
# From the error message, it is not clear what caused the container to exit.
# However, we can still optimize the Dockerfile to improve its functionality.
# Therefore, let's make the following changes:

# Specify the base image with the desired Python version
FROM debian:11
FROM python:3.10.4

# Set the working directory inside the container
WORKDIR /KomiRobot/

# Update the package lists and install necessary dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y git wget curl bash neofetch ffmpeg software-properties-common

# Copy the requirements.txt file into the /KomiRobot/ directory
COPY requirements.txt .

# Install the 'wheel' package
RUN pip install wheel

# Set an environment variable to ignore root user actions during package installations
ENV PIP_ROOT_USER_ACTION=ignore

# Install all the required packages listed in requirements.txt
# We will use the -r flag to specify the requirements.txt file and install all the packages.
# Fixed the typo in the comment on the previous line, 'requirements#.txt' should be 'requirements.txt'
RUN pip install --no-cache-dir -U -r requirements.txt

# Copy all files from the current directory into the /KomiRobot/ directory inside the container
COPY . .

# In this case, we will run the komirobot module using the python3 interpreter.
CMD ["python3", "-m", "KomiRobot"]


