#!/bin/bash
#
# 2022-08-02 GF
# required : Debian OS latest (fresh install)
# must be ran as : root
# execution : wget -O - https://raw.githubusercontent.com/gf-eaton/procedures/main/pxmcea-v2.sh | bash
#---------------------------------------------------------------------------------------------------------
SKIP_OPTIONAL=1 #skip optional
SKIP_DATABASE=1 #skip optional database creation see initDB.sh
SKIP_DOTNET6=1
SKIP_DOTNET7=1
#---------------------------------------------------------------------------------------------------------
# Step 0 networking
echo "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.d/disable-ipv6.conf
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo 'export http_proxy="http://proxy.etn.com:8080"' >> /etc/environment
echo 'export https_proxy="http://proxy.etn.com:8080"' >> /etc/environment
echo 'export no_proxy=" localhost, 127.0.0.1"' >> /etc/environment
echo 'Defaults       env_keep+="http_proxy https_proxy no_proxy"' >> /etc/sudoers
visudo -s -c
#---------------------------------------------------------------------------------------------------------
# Step 1 certificate
cd
pwd
/bin/mkdir /usr/share/ca-certificates/Eaton
cat > EatonRootCA2.crt <<EOF
-----BEGIN CERTIFICATE-----
MIIFSjCCAzKgAwIBAgIQPpyid3XgppdPmbQ2Wkh4iDANBgkqhkiG9w0BAQsFADA2
MRowGAYDVQQKExFFYXRvbiBDb3Jwb3JhdGlvbjEYMBYGA1UEAxMPRWF0b24gUm9v
dCBDQSAyMB4XDTE1MDYwNTE1MTcwNVoXDTQwMDYwNTE1MTcwNVowNjEaMBgGA1UE
ChMRRWF0b24gQ29ycG9yYXRpb24xGDAWBgNVBAMTD0VhdG9uIFJvb3QgQ0EgMjCC
AiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAKTGkkzSsnRjsssnuV9Ve+Kr
QM3ekf2Xg8cYvnIJ4838r/Lxn+OydrBU+2N+fSEoOldP46fnhdNohV5f2BJOUh/9
3mh0ie1+qUFZsEGYMSzsyooSWyXOYowWWpvFiAuRhv0raWZ6cHOgsqmPsk276d8g
V4L0ha0I0sMryGehnc3XH/CH1MkG49kSlw+ma+4/2utyk3YxtkEK4AeCYWXps3af
vhicWlE3vex2KvYvaWYCcBiFI9qKcmkuLjHxEerskxIKd14AP39YgVLaCm9nR4zi
ITDkoZ+ma1EhSlVQfClN1cvPAyw//72kLkSB13JzwSv+GBVvrUnGIrkIGMCbhpwW
hv4svSqQYWpwQf7zItF4sQ8sO0B3wi286Upxz0QT0DXpbyFu1bFPAWGL9gbIoSBO
kxEtvR8l+mNIKFpJwLY1En2fkuZ0B0p7qEgvjLJWqehHqlP7NvRCFNXWbfyjKCoK
sos2CeYqd0nripYFcpewRSg+sOyJrAsbUdjwkp/uPT/apLhn5s9V8FmApKZ1OOEC
3zGvPoB9aKExsKrA81XYwF9ku05svg4VY4q20idFtcaV558KuwdHCTdRvzpwRMf4
s8s8agI09ua7FBHhCYemwz5LDEepyMODwHCCV3NHizAHYx6zBO8Xw5wDYTfaQ6a9
UyGwHUaamGxfXV87r197AgMBAAGjVDBSMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
Af8EBTADAQH/MB0GA1UdDgQWBBTKF7CwumwcvYocJ+4P6Olgm6aTBDAQBgkrBgEE
AYI3FQEEAwIBADANBgkqhkiG9w0BAQsFAAOCAgEAhThpf2hZKtfxlnqQX95BuFBb
4scXchGkmAGhMv1OVAc4cZVHLCQ6GfihA4+wILlTGJTDiGzfIFbGGpiAlbS4btE4
lDX1fnp2UOZcat8FdIoFAd/uUS7XeNPTlN/p18y6cJWY7tJXIR0rgxbTNcmkWV7H
wt4WQ2FLDfj4Cfu7eHZNi5f8r8RsHiXIJvFmE4H+RHqa2LfbqDdmtUknshtMTmxs
6F9UJZbmW2cNnQDZAkoNAykhNG3wZCbujwhmILgt9L3UIuylkx2PgJrUdvFDC9Ak
l6Bo4TLFg62E4OCZAacrkAAsLQJ+eQx5DMlArDQUxa1Dps/QyoNMes6blwj2x2w8
heT4r7YSejnv3vMUgQFChM2gyMI3PrKJDWAs1HDRBtk/LRuh0xB3VETGOX9cRmrq
OpPV95DAP5Hs7IWaXjiq7OoQX9yIdL7Z7gjjffQ36doIFtQ0LT2zCa2yiLGbNQIt
cMFOrnYJYiw+xk6NMKlsI5h4kFelNT3kQkj4WgmWBoJJ3RLPMzyw4Kj2+HiJXUk3
bJ4tGDuPB9KbsRWJ+zqFNmI1dWbP1udD6D/w5FyVxfJ82cxOGOcEQvblwVdlqgth
fX/EmfBj5VNmjMPp7Y5G649GcZt4dnFr59EjxseJCDiZ0Lp8KijWYLghAI/p6JSh
RGcJghQfeOb8EGnja9k=
-----END CERTIFICATE-----
EOF

mv EatonRootCA2.crt /usr/share/ca-certificates/Eaton/EatonRootCA2.crt

grep "EatonRootCA2.crt" /etc/ca-certificates.conf
if [ $? -eq 1 ] ; then
  echo "insert new certificate in conf"
  echo "Eaton/EatonRootCA2.crt" >> /etc/ca-certificates.conf
  update-ca-certificates
fi
echo "sleep 5" ; sleep 5
#---------------------------------------------------------------------------------------------------------
# Step 2 update and tools/lib
apt update ; apt upgrade -y
apt install -y git cmake build-essential curl libcurl4-openssl-dev libssl-dev uuid-dev ca-certificates screen
apt install -y python-is-python3
apt remove -y python2.7 python2.7-minimal
apt autoremove -y
apt install -y ntp ntpdate
cat > /etc/ntp.conf <<EOF
server ca.pool.ntp.org prefer iburst
EOF
systemctl restart ntp
ntpq -p
echo "sleep 5" ; sleep 5
#---------------------------------------------------------------------------------------------------------
# Step 3a dot NET 6 multi architecture/CPU
if [ SKIP_DOTNET6 -eq 0 ] ; then
apt update ; apt upgrade -y ; apt install -y fuse3
cd
rm -fr /opt/dotnet
CPU=`uname -p`
if [ $CPU == "x86_64" ] ; then
  wget -O dotnet-sdk-6.tar.gz -nc https://download.visualstudio.microsoft.com/download/pr/868b2f38-62ca-4fd8-93ea-e640cf4d2c5b/1e615b6044c0cf99806b8f6e19c97e03/dotnet-sdk-6.0.407-linux-x64.tar.gz
else
  wget -O dotnet-sdk-6.tar.gz -nc https://download.visualstudio.microsoft.com/download/pr/72d1f83c-ad2c-4c9b-88b1-15196f411b9d/a0b863cabea9ac0fe7b92dc70c8d4ef0/dotnet-sdk-6.0.407-linux-arm64.tar.gz
fi
echo "please wait this may take a minute or two ..."
mkdir -p /opt/dotnet 
tar zxf dotnet-sdk-6.tar.gz -C /opt/dotnet
cd
grep "export PATH=$PATH:/opt/dotnet" .bashrc
if [ $? -eq 1 ] ; then
  echo 'export PATH=$PATH:/opt/dotnet' >> .bashrc
  echo 'export DOTNET_ROOT=/opt/dotnet' >> .bashrc
fi
source .bashrc

dotnet --info
dotnet --list-sdks

echo "sleep 10" ; sleep 10
fi
#---------------------------------------------------------------------------------------------------------
# Step 3b dot NET 7 multi architecture/CPU
if [ SKIP_DOTNET7 -eq 0 ] ; then
  cd
  apt update ; apt upgrade -y
  wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  dpkg -i packages-microsoft-prod.deb
  rm packages-microsoft-prod.deb
  apt install -y dotnet-sdk-7.0
  apt autoremove -y
fi
#---------------------------------------------------------------------------------------------------------
# Step 4 postgres 13.8+ or 15.3+ (PostgreSQL was benchmarked against MimerSQL initialy)
apt update ; apt upgrade -y ; apt autoremove
apt install -y postgresql postgresql-contrib
service postgresql status
pg_config --version ; psql --version ; ps -ef | grep postgres
echo "listen_addresses = '*'" >> /etc/postgresql/*/main/postgresql.conf && echo "sucess modifying postgresql.conf, required for remove connections ..."
cat /etc/postgresql/*/main/postgresql.conf | grep listen_address

# for connecting telemetry database from remote
echo "host    telemetry       pxmcea          0.0.0.0/0               trust" >> /etc/postgresql/*/main/pg_hba.conf && echo "success modifying pg_hba.conf"
# for pgadmin to work from remote
echo "host    postgres        postgres        0.0.0.0/0               password" >> /etc/postgresql/*/main/pg_hba.conf && echo "sucess modifying pg_hba.conf"
cat /etc/postgresql/*/main/pg_hba.conf

service postgresql restart

ss -nlt | grep 5432

if [ SKIP_DATABASE -eq 0 ] ; then
  sudo
  if [ "$?" -eq "1" ] ; then
    cd /
    sudo su - postgres -c "createuser pxmcea"
    sudo su - postgres -c "createdb telemetry"
    sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'SetNewPasswordNow!';"
    sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE telemetry TO pxmcea;"
    sudo -u postgres psql -c "ALTER DATABASE telemetry OWNER TO pxmcea;" #EXTRA security in postgres 15.3+ must be owner to be able to create table in public schema
    sudo -u postgres psql -c "ALTER USER pxmcea WITH PASSWORD 'SetNewPasswordNow!';"
    psql -d telemetry -U pxmcea -h localhost -c "DROP TABLE public.telemetry;"
    psql -d telemetry -U pxmcea -h localhost -c "CREATE TABLE IF NOT EXISTS public.telemetry (rowid SERIAL NOT NULL, iot boolean DEFAULT false, ts timestamp without time zone, att bigint, val numeric(16,6), dwrite timestamp without time zone DEFAULT timezone('utc'::text, now()));"
    psql -d telemetry -U pxmcea -h localhost -c "ALTER TABLE IF EXISTS public.telemetry SET (autovacuum_enabled = true);"
    cd
  else
    echo "sudo is not installed... we use alternative"
    su - postgres -c "createuser pxmcea"
    su - postgres -c "createdb telemetry"
    su - postgres -c 'psql -c "ALTER USER postgres WITH PASSWORD 'SetNewPasswordNow!';"'
    su - postgres -c 'psql -c "GRANT ALL PRIVILEGES ON DATABASE telemetry TO pxmcea;"' #GRANT ALL ON DATABASE mydb TO admin;
    su - postgres -c 'psql -c "ALTER DATABASE telemetry OWNER TO pxmcea;"' #EXTRA security in postgres 15.3+ must be owner to be able to create table in public schema
    su - postgres -c 'psql -c "ALTER USER pxmcea WITH PASSWORD 'SetNewPasswordNow!';"'
    psql -d telemetry -U pxmcea -h localhost -c "DROP TABLE public.telemetry;"
    psql -d telemetry -U pxmcea -h localhost -c "CREATE TABLE IF NOT EXISTS public.telemetry (rowid SERIAL NOT NULL, iot boolean DEFAULT false, ts timestamp without time zone, att bigint, val numeric(16,6), dwrite timestamp without time zone DEFAULT timezone('utc'::text, now()));"
    psql -d telemetry -U pxmcea -h localhost -c "ALTER TABLE IF EXISTS public.telemetry SET (autovacuum_enabled = true);"
  fi
fi
sleep 10
#---------------------------------------------------------------------------------------------------------
# Step 5 system cron
grep "0 1 * * 1 apt update ; apt upgrade -y ; apt autoremove -y" /etc/crontab
if [ $? -eq 1 ] ; then
  echo "0 1 * * 1 apt update ; apt upgrade -y ; apt autoremove -y" >> /tmp/crontab
  echo "0 1 * * 1 conda update -n base -c defaults conda --yes" >> /tmp/crontab
  echo "0 1 * * 1 pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U" >> /tmp/crontab
  crontab /tmp/crontab
fi
#---------------------------------------------------------------------------------------------------------
# Step 6 git config (required)
cd
git config --global user.name rootCM4
git config --global user.email pxmcea@eaton.com
git config --global http.proxy http://proxy.etn.com:8080
git config --global http.sslVerify false
git config --global https.proxy http://proxy.etn.com:8080
git config --global core.eol lf
git config --global core.autocrlf input
#---------------------------------------------------------------------------------------------------------
# Step 7 netdata (monitoring device simply - optional)
if [ SKIP_OPTIONAL -eq 0 ] ; then
  wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh && sh /tmp/netdata-kickstart.sh --no-updates --non-interactive --stable-channel
  touch /etc/netdata/.opt-out-from-anonymous-statistics
  systemctl restart netdata
fi
#---------------------------------------------------------------------------------------------------------
# Step 8 nodeJS (delivering rich application faster - optional)
if [ SKIP_OPTIONAL -eq 0 ] ; then
  cd
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
  source .bashrc
  nvm --version
  nvm ls-remote
  nvm install node
  node --version
  npm --version
fi
#
#
echo "Finish. Thanks for using this script."
