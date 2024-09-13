# Instructions forbuilding my LabJack Container

The first thing to do is go grab the appropriate LJM Installer from the LabJack website:
https://support.labjack.com/docs/ljm-software-installer-downloads-t4-t7-t8-digit

At the time this was written, that was https://files.labjack.com/installers/LJM/Linux/x64/release/LabJack-LJM_2024-06-10.zip
for x86 and https://files.labjack.com/installers/LJM/Linux/ARMv7:ARMhf/release/LabJackM-1.1804-Raspbian-Linux-armhf-release.tar.gz
for the Raspberry Pi

After you have exactly one of those, you can run 'docker compose build' and then './runit.sh'
