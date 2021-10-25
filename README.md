# Rubber Ducky Toolbox

This repo contains the rubber ducky tools I personally need, to save time from searching around everytime I need to create a bad USB.

This repo also contains the rubber ducky scripts I wrote or collected, they are located in `./scripts`, the description for each script will be in this README. If you are interested in how the code are written, please go into the scripts and read the `REM` comments. Some general info for each script is listed below.

## Scripts

- Windows Wifi Thief, send email: [code](./scripts/win-wifi-password-thief-email)
  - This script can steal a windows computer’s currently connected wifi password, and send the password via email.
  - The window size of powershell will be set to be 1x1 to stay as invisible as possible.
  - Depends on your windows setting, the plugged in USB may be open as a mass storage device (open a file explore) which might interrupt rubber ducky while it’s typing. So I added a delay of 10 sec to wait for it to open, then it will output `Ctrl+w` to try to close the top layer window, and then continue to open powershell and type the commands.
  - There are 3 payload files and a PowerShell script available, they are all the same thing with minor purposes
    - [wifi-thief.payload.ps1](./scripts/win-wifi-password-thief-email/wifi-thief.payload.ps1): plain powershell script for getting current password and send email (a draft of mine)
    - [payload.txt](./scripts/win-wifi-password-thief-email/payload.txt): a regular version, with clear comments. Commands are written line by line.
    - [oneliner-tiny-window-payload.txt](./scripts/win-wifi-password-thief-email/oneliner-tiny-window-payload.txt): attempt to be invisible (make powershell window as small as possible, 1x1), and all commands are written in 1 line (concatenated) to save space and time.
    - [fast.payload.txt](./scripts/win-wifi-password-thief-email/fast.payload.txt): the **production build**. A improved version of the previous gen. All intermediate variable names are renamed to have a 1-letter name to speed up the typing process. PowerShell window size is also set to 1x1.
