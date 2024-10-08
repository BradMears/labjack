FROM ubuntu:22.04

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

# The filename of the .zip file will change when the version updates and I 
# download a new one. So use a wildcard to grab what should be exactly one 
# matching file.
COPY LabJack-LJM_*.zip /app
COPY list_connections.py /app
WORKDIR /app
RUN unzip *.zip && \
    ./labjack_ljm_installer.run -- --no-restart-device-rules && \
    rm /app/LabJack-LJM_*.zip && \
    pip3 install --no-cache-dir labjack-ljm==1.21.0

ENV PATH="$PATH:/app/labjack_kipling/"

CMD ["/bin/bash"]
