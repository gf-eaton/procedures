# Prepare for Yocto in WSL2 (debian or ubuntu)

## Steps

 - [ ] update OS
 - [ ] validate requirements
 - [ ] use sample recipe --> see procedure
 - [ ] have the certificate installed (required for Eaton) --> see procedure

### update
```bash
sudo apt update ; sudo apt upgrade -y ; apt autoremove -y
```

### Validate requirements

- Your system needs to support the en_US.UTF-8 locale.
- do not run as root (it will not work)
- python 3.6+ required
- debian 10+ required

### How to install using recipe

- First sample for rpi3B
  + look at file [yocto-fw-rpi3.sh](./yocto-fw-rpi3.sh)

