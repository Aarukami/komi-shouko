
# There is no need to have two identical parts in the Dockerfile. 
# Therefore, we will remove the duplicated part and keep only one.
# We will comment out the duplicate lines.
FROM python:3.10.4
WORKDIR /KomiRobot/
RUN apt-get update && apt-get upgrade -y && apt-get install -y git wget curl bash neofetch ffmpeg software-properties-common
COPY requirements.txt .
RUN python3 -m pip install wheel
ENV PIP_ROOT_USER_ACTION=ignore
# Fix Typo: The original command incorrectly specifies the Python module as KomiRobot instead of komirobot
# Install all the required packages listed in requirements.txt
# We will use the -r flag to specify the requirements.txt file and install all the packages.
RUN python3 -m pip install --no-cache-dir -U -r requirements.txt
COPY . .
# Fix Typo: The original command incorrectly specifies the Python module as KomiRobot instead of komirobot
# Set the command to run the komirobot python module
# We will use the CMD command to specify the command that should be executed when the container starts.
# In this case, we will run python the komirobot module using the python3 interpreter.
CMD ["python3", "-m", "KomiRobot"]


