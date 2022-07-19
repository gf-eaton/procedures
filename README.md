# wsl-debian
HOW to install and work with WSL (Debian)

## Installing WSL with distro Debian

Steps :
 1. Requirements
 2. Installing
 3. Config DNS resolution
 4. Updating OS, Install Apps
 5. Config Apps

###  in command prompt cmd (as administrator)
```
# in commandline (cmd.exe)
wsl --install -d debian
wsl --setdefault debian
```


### Verify version and state
```
wsl --verbose --list
```

### optional - To terminate an instance
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



### update and install
```
$ sudo apt update; sudo apt upgrade -y
```


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

### Test clone
```
$ git clone https://github.com/guyfrancoeur/ciclad.git
```

### Verify config of sshd
```
ss -ltmp

service ssh status

service ssh stop
service ssh start
```
