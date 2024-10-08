#!/bin/bash

# Deprecated Oct 8 2024
# See the call to safe_install.sh from the Dockerfile

# For some reason, running the install script on the RPi fails on the very last
# step where it restarts the device rules. This may well be solvable but for
# now I'm going to work-around it by doing the install every time I start the 
# container. 
# Start the container in one window and then run this script in another. After
# that, you should be good to go.

docker exec -it --user=root labjack ./LabJackM.run
