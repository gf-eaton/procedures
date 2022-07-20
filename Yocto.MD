# Prepare for Yocto in WSL2 (debian or ubuntu)

## Steps

 - [ ] update OS
 - [ ] install requirements
 - [ ] clone Poky

### update
```bash
sudo apt update ; sudo apt upgrade -y
```

### install requirements
```
sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool
```

### Clone poky
```
git clone git://git.yoctoproject.org/poky
```
or
```
git clone -b kirkstone git://git.yoctoproject.org/poky
```
