# wsl-debian
HOW to install and work with WSL (Debian)

## Installing WSL with distro Debian

Steps :
 1. Requirements
 2. Installing
 3. Config DNS resolution
 4. Updating OS, Install Apps
 5. Config Apps

### requirements
 - [ ] Windows 10/11 up to date
 - [ ] Command line prompt knowledge
 - [ ] 21 minutes (most of it is the download OS debian)
 - [ ] putty or MobaXterm

#### in command prompt cmd (as administrator)
```
# in commandline (cmd.exe)
wsl --install -d debian
wsl --setdefault debian
```



#### verify version and state
```
wsl --verbose --list
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
```bash
su -
echo "nameserver 151.110.50.210" > /etc/resolv.conf
echo "[network]" > /etc/wsl.conf
echo "generateResolvConf = false" >> /etc/wsl.conf
```

#### update OS
```
$ sudo apt update; sudo apt upgrade -y
```

#### install tools
```bash
$ sudo apt install -y git htop openssh-server
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

#### test git clone
```
$ git clone https://github.com/guyfrancoeur/ciclad.git
```

#### verify config of sshd
```
ss -ltmp

service ssh status

service ssh stop
service ssh start

ip addr
```

#### connect using putty on 127.0.0.1 or eth0 or windows-key "debian"

to see the network ip address use 
```
ip addr | grep eth0
```
