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

###  in command prompt cmd (as administrator)
```
# in commandline (cmd.exe)
wsl --install -d debian
wsl --setdefault debian
```


### verify version and state
```
wsl --verbose --list
```

### optional - to terminate an instance (if you have many)
```
wsl -t debian
```

### config debian
```bash
# edit file
sudo nano /etc/resolv.conf
# copy and paste the following
nameserver 151.110.50.210
```

or

```bash
sudo echo "nameserver 151.110.50.210" >> /etc/resolv.conf
```



### update OS
```
$ sudo apt update; sudo apt upgrade -y
```

### install tools
```bash
$ sudo apt install -y git htop openssh-server
```

### config git
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

### test git clone
```
$ git clone https://github.com/guyfrancoeur/ciclad.git
```

### verify config of sshd
```
ss -ltmp

service ssh status

service ssh stop
service ssh start
```
