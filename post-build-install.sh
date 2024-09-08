#!/bin/bash

# For some reason, running the install script on the RPi fails on the very last
# step where it restarts the device rules. This may well be solvable but for
# now I'm going to work-around it by doing the install every time I start the 
# container. 
# Start the container in one window and then run this script in another. After
# that, you should be good to go.

docker exec --user=root labjack ./LabJackM.run
