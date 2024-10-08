FROM bradmears/pydev:latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
            unzip \
            libusb-1.0-0-dev

# Dependencies required for LabJack Kipling
# Since I don't use Kipling, I leave this out to save space
#RUN apt-get update && apt-get upgrade -y
#RUN apt-get install -y \
#    libnss3 \
#    libatk1.0-0 \
#    libatk-bridge2.0-0 \
#    libcups2 \
#    libgbm1 \
#    libgtk-3-0 \
#    libasound2
#    
#RUN apt-get install -y udev

RUN mkdir /app
COPY examples /app/examples

# Unpack the Intel Linux distro . These lines are different in the raspberry-pi branch.
COPY LabJack-LJM_2024-06-10.zip /app
WORKDIR /app

# Install the LabJack SW and then immediately delete Kipling
RUN unzip *.zip && \
    ./labjack_ljm_installer.run -- --no-restart-device-rules && \
    rm /app/LabJack-LJM_*.zip && \
    pip3 install --no-cache-dir labjack-ljm==1.21.0 && \
    rm -rf /opt/labjack_kipling

WORKDIR /app/examples
CMD ["/bin/bash"]
