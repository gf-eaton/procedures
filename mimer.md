# How to install mimer SQL

### Check kernel version

type `hostnamectl`

### Install for x86_64 (amd64)

Documentation could be seen at [Miner SQL for Linux](https://developer.mimer.com/article/installing-mimer-sql-on-linux/)

```
wget --no-check-certificate https://download.mimer.com/pub/dist/linux_x86_64/mimersql1107_11.0.7A-38678_amd64-openssl1.deb
sudo dpkg -i mimersql1107_11.0.7A-38678_amd64-openssl1.deb
```

```
wget --no-check-certificate https://download.mimer.com/pub/dist/linux_x86_64/mimersql1107-11.0.7A-38678_x86_64-openssl1.tar
tar xvf mimersql1100-11.0.0A-24298_linux26_64.tar
./miminstall
```

### Instal for arm64

```
wget --no-check-certificate https://download.mimer.com/pub/dist/linux_arm_64/mimersqlsrv1105_11.0.5A-34699_arm64.deb
sudo dpkg -i mimersqlsrv1105_11.0.5A-34699_arm64.deb
cd /opt/mim*
```

### Setup a database

```
dbinstall
```

### Managing a database

The Mimer SQL documentation can be found as PDF files in the Mimer SQL
documentation directory, located in the distribution as
/opt/mimersql1107-11.0.7A/doc.
Documentation can also be found in PDF- and HTML-format at
https://developer.mimer.com/products/documentation/.

The mimadmin command can be used for administering the created
database server:

    `/opt/mimersql1107-11.0.7A/bin/mimadmin telemetry`

The bsql command can be used to access the started database server
objects, for example using the SYSADM login ident:

    `/opt/mimersql1107-11.0.7A/bin/bsql telemetry`
    
