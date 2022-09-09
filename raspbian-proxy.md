# how to setup Raspberry pi using Raspbian with proxy

- Prerequisits : Raspbian
- Duration : 8 minutes

### Step 1 : Setup proxy info

`sudo nano /etc/environment`

add the folowing lines 

```
export http_proxy="http://proxy.etn.com:8080"
export https_proxy="http://proxy.etn.com:8080"
export no_proxy=" localhost, 127.0.0.1"
```

### Step 2 : edit sudoers

using `visudo` add, `CTRL-X` to save and exit

```
Defaults       env_keep+="http_proxy https_proxy no_proxy"
```

### reboot first then test 

```
reboot
sudo apt update ; sudo apt upgrade -y ; apt autoremove
```
---
by gf 2022 MIT (collaboration Mattéo)
