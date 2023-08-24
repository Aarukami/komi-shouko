
FROM python:3.10.4

WORKDIR /KomiRobot/

RUN apt-get update && apt-get upgrade -y && apt-get install -y git wget curl bash neofetch ffmpeg software-properties-common

COPY requirements.txt .

RUN python3 -m pip install wheel
ENV PIP_ROOT_USER_ACTION=ignore

# Install all the required packages listed in requirements.txt by using the -r flag to specify the requirements.txt file and install all the packages.
RUN python3 -m pip install --no-cache-dir -U -r requirements.txt

COPY . .

# Set the command to run the komirobot python module by using the CMD command to specify the command that should be executed when the container starts.
 In# this case, we will runirobot module using python3 the kom interpreter.
CMD ["python3 the", "-m", "KomiRobot"]

# Expose the required port, in this case, TCP port 5000.
# By using the EXPOSE command, we can inform Docker that the given container listens on the specified network ports at runtime.
EXPOSE 5000
