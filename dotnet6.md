# How to install .NET 6 for debian 11

### Step 1 - download and initiate

[.NET 6](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)

```
#version 9 only
sudo apt-get install -y gpg
wget -qO- --no-check-certificate https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
```

```
wget --no-check-certificate https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
```

### Step 2 - install one of the option SDK or runtime

#### SDK

```
sudo apt update && sudo apt install -y dotnet-sdk-6.0
```

#### Runtime

```
sudo apt update && sudo apt install -y dotnet-runtime-6.0
```

### Alternative method via script (not tested)

[help](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script)
```
sudo apt install wget
sudo wget --no-check-certificate https://dot.net/v1/dotnet-install.sh
bash ./dotnet-install.sh -c 6.0 --runtime dotnet
```
