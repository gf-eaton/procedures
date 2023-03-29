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

#### Version 1

Required
 - [ ] 0. Networking
 - [ ] 1. Eaton Certficate
 - [ ] 2. System tools (lib, compiler,...)
 - [ ] 3. .NET Core 6
 - [ ] 4. Mimer SQL or PostgreSQL (faster)
 - [ ] 5. System cron (task)
 - [ ] 6. netdata
 - [ ] 7. nodeJS

Optional
 - [ ] 8. systemd-nspawn (paused for now, not complete, will be back to this)
 - [ ] 9. webhook for DevOps CI/CD integration (not so good)

call using `wget -O - https://raw.githubusercontent.com/gf-eaton/procedures/main/pxmcea-v1.sh | bash`

#### Version 2

This version is the result of 10 months testing and only mandatory components are installed.  Fully tested. Secured. Fast. Auto maintenance.

Ideal OS : Debian 11 (or latest)
Ideal HW : 4 core cpu, 4GB RAM, 16GB/32GB storage

Required
 - [ ] 0. Networking
 - [ ] 1. Eaton Certficate
 - [ ] 2. System tools (lib, compiler,...)
 - [ ] 3. .NET Core 6
 - [ ] 4. PostgreSQL 13 (faster than MySQL, Mimer, SQLite)
 - [ ] 5. System cron
 - [ ] 6. netdata
 - [ ] 7. nodeJS
 - [ ] 8. git
 - [ ] 9. PXMCEA services (systemd) --> to come

call using `wget -O - https://raw.githubusercontent.com/gf-eaton/procedures/main/pxmcea-v2.sh | bash`

---
by GF MIT 2022
