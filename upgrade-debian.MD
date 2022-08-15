# Upgrade debian 

This process is 25 minutes and will ask you to restart services.

## WHY upgrade debian : Because you want to get the newer compiler and lastest dev library and remove old unsecured stuff.

check the version you have
```
cat /etc/os-release
```
if you have version 9 upgrade to 10 first then to 11

### to debian 10
```
su -
echo "deb http://deb.debian.org/debian buster main" > /etc/apt/sources.list
echo "deb http://deb.debian.org/debian buster-updates main" >> /etc/apt/sources.list
echo "deb http://security.debian.org/debian-security/ buster/updates main" >> /etc/apt/sources.list
apt update ; apt upgrade -y ; apt autoremove
```

### to debian 11

```
su -
echo "deb http://deb.debian.org/debian bullseye main" > /etc/apt/sources.list
echo "deb http://deb.debian.org/debian bullseye-updates main >> /etc/apt/sources.list
echo "deb http://security.debian.org/debian-security bullseye-security main >> /etc/apt/sources.list
echo "deb http://ftp.debian.org/debian bullseye-backports main >> /etc/apt/sources.list
apt update ; apt upgrade -y ; apt autoremove
