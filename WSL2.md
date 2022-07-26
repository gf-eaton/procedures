# WSL2-debian with git for native cross platform compilation from Visual Studio Pro
HOW to install and work with WSL (Debian)

Duration : 17 minutes (most of it for downloading the OS the first time only)

## Installing WSL with distro Debian

Steps :
 1. Meet requirements
 2. Installing WSL 2
 3. Config DNS resolution in Linux
 4. Updating OS, Install Apps (git)
 5. Config Apps (git)

### requirements
 - [ ] Windows 10/11 up to date
 - [ ] Command line prompt knowledge
 - [ ] putty or MobaXterm (for ssh connectivity)

#### in command prompt cmd (as administrator)
```
# in commandline (cmd.exe)
REM fastest way remove everything
wsl --unregister -d debian

REM Fresh install lastest
wsl --install -d debian
wsl --setdefault debian
wsl --update
wsl --shutdown
```

#### verify version and state
```
wsl --status
wsl --list --verbose
```

##### optional - to terminate an instance
```
wsl -t debian
```
##### optional - to start an instance
```
wsl -d debian
```

#### config debian

##### optional : change root password (required for su - command)
```
sudo passwd root
```

##### important fixes in /etc/resolv.conf and /etc/wsl.conf

You need the second nameserver when you work from outside the LAN.
```bash
su -
rm /etc/resolv.conf
echo "nameserver 151.110.50.210" > /etc/resolv.conf
echo "nameserver 149.112.121.10" >> /etc/resolv.conf #Cira public DNS or 8.8.8.8 for google
echo "[network]" > /etc/wsl.conf
echo "generateResolvConf = false" >> /etc/wsl.conf
chattr +i /etc/resolv.conf
```

#### update OS
```
sudo apt update; sudo apt upgrade -y ; sudo apt install -y git htop nano openssh-server
```

#### config git
```bash
$ nano .gitconfig
```

```
[user]
        name = gf (I put initials)
        email = youremailhere@eaton.com
[http]
        proxy = http://proxy.etn.com:8080
        sslVerify = false
[https]
        proxy = http://proxy.etn.com:8080
```

#### test git clone Yocto project (Poky)
```
git clone -b kirkstone https://git.yoctoproject.org/poky

```

#### verify config of sshd
```
ss -ltmp

service ssh status

service ssh stop
service ssh start

ip addr | grep eth0

cat /etc/os-release
```
---
by gf 2022 MIT
