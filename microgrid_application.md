# PXMCEA Microgrid Controller Application
#### Get the platform ready via automated script

### Script the application

The goal is to have a valid minimal working set of tools to be able to run the Microgrid Application.

Application : a functionnal image (set software/tools) running inside a device.

Device : `Microgrid Controller` (in this case : Rpi CM4 or Rpi 3B or better)

Minimum required : `2GB RAM, 8GB storage (SD card)`

Before you start :
 - have a power supply 2A+ for Rpi 3B (otherwise it will crash)
 - Debian/Raspbian (bullseye) or **lastest** running
 - sshd is running
 - login/user in sudoer
 

### Script

1. Eaton Certficate
2. System tools (lib, compiler,...)
3. .NET Core 6
4. Mimer SQL
5. System cron
6. netdata
7. nodeJS
8. systemd-nspawn (paused for now, not complete, will be back to this)
9. webhook for DevOps CI/CD integration

call using `wget -O - https://raw.githubusercontent.com/gf-eaton/procedures/main/pxmcea-v1.sh | bash`

---
by GF MIT 2022
