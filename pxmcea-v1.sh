#!/bin/bash
#
# 2022-08-02 GF
# execution : wget -O - https://raw.githubusercontent.com/gf-eaton/procedures/main/pxmcea-v1.sh | bash
#
# Step 1 certificate
cd
pwd
sudo /bin/mkdir /usr/share/ca-certificates/Eaton
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

sudo mv EatonRootCA2.crt /usr/share/ca-certificates/Eaton/EatonRootCA2.crt

grep "EatonRootCA2.crt" /etc/ca-certificates.conf
if [ $? -eq 1 ] ; then
  echo "insert new certificate in conf"
  sudo echo "Eaton/EatonRootCA2.crt" >> /etc/ca-certificates.conf
  sudo update-ca-certificates
fi
echo "sleep 5" ; sleep 5
#
# Step 2 tools/lib
sudo apt update ; sudo apt upgrade -y
sudo apt install -y git cmake build-essential curl libcurl4-openssl-dev libssl-dev uuid-dev ca-certificates
sleep 5
#
# Step 3 dot NET 6
cd
sudo rm -fr /opt/dotnet
wget -nc https://download.visualstudio.microsoft.com/download/pr/901f7928-5479-4d32-a9e5-ba66162ca0e4/d00b935ec4dc79a27f5bde00712ed3d7/dotnet-sdk-6.0.400-linux-arm64.tar.gz
echo "please wait this may take a minute or two ..."
sudo mkdir -p /opt/dotnet 
sudo tar zxf dotnet-sdk-6.0.400-linux-arm64.tar.gz -C /opt/dotnet
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
#
# Step 4 Mimer SQL
wget -nc https://download.mimer.com/pub/dist/linux_arm_64/mimersqlsrv1105_11.0.5A-34699_arm64.deb
sudo dpkg -i ./mimersqlsrv1105_11.0.5A-34699_arm64.deb
cd /opt/mimer* ; cd bin
/bin/ls --color
echo "Installing database telemetry"
sudo dbinstall telemetry Security
echo "sleep 10" ; sleep 10
#
# Step 5 system cron
sudo grep "@reboot /usr/bin/mkfifo /tmp/iot.pipe" /etc/crontab
if [ $? -eq 1 ] ; then
  sudo echo "@reboot /usr/bin/mkfifo /tmp/iot.pipe /tmp/ui.pipe" >> /etc/crontab
  sudo echo "@reboot /usr/bin/sleep 1 ; /usr/bin/date >> /tmp/reboot.log ; /usr/bin/sleep 2 ; /usr/bin/ls -lahs /tmp/*.pipe >> /tmp/reboot.log ; echo '---------------------------' >> /tmp/reboot.log"
  sudo echo "0 1 * * 1 apt update ; apt upgrade -y"
fi
#
# Step 6 netdata
wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh && sh /tmp/netdata-kickstart.sh --no-updates --non-interactive --stable-channel
touch /etc/netdata/.opt-out-from-anonymous-statistics
systemctl restart netdata
#
# Step 7 nodeJS
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source .bashrc
nvm --version
nvm ls-remote
nvm install node
node --version
npm --version
# Step 8 systemd-nspawn
# Systemd-nspawn
apt install -y debootstrap systemd-container

### Create a container named
rm -fr /var/lib/machines/pxmcea
mkdir -p /var/lib/machines/pxmcea
debootstrap --include=systemd-container,systemd,dbus stable /var/lib/machines/pxmcea http://deb.debian.org/debian/

chroot /var/lib/machines/pxmcea
cat <<EOF >/etc/securetty
pts/0
pts/1
pts/2
pts/3
EOF

echo 'deb https://deb.debian.org/debian-security/ stable-security main' >> /etc/apt/sources.list
echo 'pxmcea' > /etc/hostname

echo 'export http_proxy="http://proxy.etn.com:8080"' > /etc/environment
echo 'export https_proxy="http://proxy.etn.com:8080"' >> /etc/environment
echo 'export no_proxy=" localhost, 127.0.0.1"' >> /etc/environment

echo 'Defaults       env_keep+="http_proxy https_proxy no_proxy"' >> /etc/sudoers

mkdir -p /usr/share/ca-certificates/Eaton
cd /usr/share/ca-certificates/Eaton
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

echo "Eaton/EatonRootCA2.crt" >> /etc/ca-certificates.conf
update-ca-certificates

exit

machinectl enable pxmcea
machinectl start pxmcea
machinectl status pxmcea
machinectl stop pxmcea
echo "systemd-nspawn -D /var/lib/machines/pxmcea -U --machine pxmcea"
echo "     then ... you can change root password with passwd root"
#
# Step 9 Webhook app for NodeJS
cd /opt/node
npm init -y
npm install express body-parser
npm install 
npm install -g nodemon
cat > webhook.js.crt <<EOF
// webhook v1 - gf 2022-09-13
//
const express = require("express")
const bodyParser = require("body-parser")
const app = express()
const PORT = 3000

const { spawn } = require('child_process');
const bash = spawn('bash');
bash.stdout.on('data', (data) => {
  console.log(`stdout: ${data}`);
});

bash.stderr.on('data', (data) => {
  console.error(`stderr: ${data}`);
});

bash.on('close', (code) => {
  console.log(`child process exited with code ${code}`);
});


// Tell express to use body-parser's JSON parsing
app.use(bodyParser.json())

app.post("/hook-html", (req, res) => {
  console.log(req.body)

  bash.stdin.write('cd /opt/pxmcea/rca-v1/\n');
  bash.stdin.write('git pull\n');
  bash.stdin.end();

  res.status(200).end() // Responding is important
})

// Start express on the defined port
app.listen(PORT, () => console.log(`Server running on port ${PORT}`))
EOF

echo 'create your first hook named rca-v1'
#
# Step 10 git config
cd
cat > .gitconfig <<EOF
[user]
        name = root
        email = guyfrancoeur@eaton.com
[http]
        proxy = http://proxy.etn.com:8080
        sslVerify = false
[https]
        proxy = http://proxy.etn.com:8080
EOF
mkdir -p /opt/pxmcea
cd /opt/pxmcea
git clone https://dev.azure.com/etn-electrical/PXMC-EA/_git/rca-v1
#
echo "Finish."
