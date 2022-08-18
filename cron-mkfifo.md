# How to start named pipe (mkfifo) using cron

- prerequisit : Debian
- duration : 2 min

On every startup the named pipe will be created.

### edit cron to be ran as root

`sudo` command will create de crontab as root

type `sudo crontab -e` add the folowing lines

```
@reboot /usr/bin/mkfifo /var/tmp/iot.pipe
@reboot /usr/bin/mkfifo /var/tmp/telemetry.pipe
```

---
by gf 2022 MIT
