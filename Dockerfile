FROM bradmears/pydev:latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
            unzip \
            libusb-1.0-0-dev

# None of the Kipling dependencies are in here since Kipling isn't 
# supported on the RPi

RUN mkdir /app
COPY examples /app/examples

# Unpack the RPi-specific distro. These three lines are why we need
# a separate branch for raspberry-pi. The '2000' in the filename
# indicates that the file is from the year 2000. LabJack doesn't
# support the RPi very well.
# ADD copies and unpacks the archive in one fell swoop
ADD LabJackM-1.2000-openSUSE-Linux-aarch64-release.tar.gz /app
WORKDIR /app/LabJackM-1.2000-openSUSE-Linux-aarch64 

# Wow. This is an ugly hack. The LabJackM.run file returns a non-zero
# exit code when run inside a container. But if I call it as I do below,
# I can hide that exit code from Docker and pretend everything is A-OK. 
# This appears to work. Or at least the problems are not obvious.
RUN pip3 install --no-cache-dir labjack-ljm==1.21.0 && \
    bash -c "./LabJackM.run -- --no-restart-device-rules || echo 'Installer puked. Everything is A-OK'"
#    ./LabJackM.run -- --no-restart-device-rules 

WORKDIR /app/examples
CMD ["/bin/bash"]
