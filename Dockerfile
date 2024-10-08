FROM ubuntu:22.04

ENV TZ=US \
    DEBIAN_FRONTEND=noninteractive

# Dependencies required for LabJack
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libgbm1 \
    libgtk-3-0 \
    libasound2
    
RUN apt-get install -y unzip python3-pip libusb-1.0-0-dev udev

RUN mkdir /app
COPY list_connections.py /app

# Unpack the RPi-specific distro. These two lines are why we need
# a separate branch for raspberry-pi. The '2000' in the filename
# indicates that the file is from the year 2000. LabJack doesn't
# support the RPi very well.
# ADD copies and unpacks the archive in one fell swoop
ADD LabJackM-1.2000-openSUSE-Linux-aarch64-release.tar.gz /app
WORKDIR /app/LabJackM-1.2000-openSUSE-Linux-aarch64 

# Trying to do the install while building the container fails when
# restarting the device rules. Rather than hunt that down, I
# use a script to do the install as root each time the container
# is started. See post-build-install.sh

#RUN  ./LabJackM.run -- --no-restart-device-rules 
RUN pip3 install --no-cache-dir labjack-ljm==1.21.0

CMD ["/bin/bash"]
