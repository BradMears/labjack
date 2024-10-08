#!/bin/bash
# Since the old, decrepti version of the LJM software that is available on
# the RPi doesn't install cleanly in a container. This script exists solely
# to prevent the error code from getting back to Docker.

echo "Calling the LabJack installer"
./LabJackM.run -- --no-restart-device-rules 
echo "Installer exited with exit code $?"
exit 0
