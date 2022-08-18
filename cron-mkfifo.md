# How to start named pipe (mkfifo) using cron

- prerequisit :
  - Debian
  - cron running
- duration : 2 min

On every linux startup the named pipe will be created.

### check if cron service is running

```
sudo service cron status
```

if not running

```
sudo service cron start
```

### edit cron to be ran as root

`sudo` command will create de crontab as root

type `sudo crontab -e` add the folowing lines

```
@reboot /usr/bin/mkfifo /var/tmp/iot.pipe
@reboot /usr/bin/mkfifo /var/tmp/telemetry.pipe
```

reboot your linux

### verify if named pipes are there

```
ls -lahs /var/tmp/
```

---
by gf 2022 MIT
