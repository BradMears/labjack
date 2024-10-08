# Instructions for building my LabJack Container

The first thing to do is go grab the appropriate LJM Installer from the LabJack website:
https://support.labjack.com/docs/ljm-software-installer-downloads-t4-t7-t8-digit

At the time this was written, that was https://files.labjack.com/installers/LJM/Linux/x64/release/LabJack-LJM_2024-06-10.zip
for x86 and https://files.labjack.com/installers/LJM/Linux/AArch64/release/LabJackM-1.2000-openSUSE-Linux-aarch64-release.tar.gz
for the Raspberry Pi. Notice how old the RPi distro is? I wish LJ would release a new one.

If LJ does release a new version of either of these files, you have to change the filename in the Dockerfile. I use the explicit
name for reference purposes rather than using wildcards.

After you have exactly one of those, you can run 'docker compose build' and then './runit.sh'
