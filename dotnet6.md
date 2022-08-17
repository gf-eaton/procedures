# How to install .NET 6 for debian 11

### Step 1 installation

[official page download](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-6.0.400-linux-x64-binaries)
```
sudo wget --no-check-certificate https://download.visualstudio.microsoft.com/download/pr/cd0d0a4d-2a6a-4d0d-b42e-dfd3b880e222/008a93f83aba6d1acf75ded3d2cfba24/dotnet-sdk-6.0.400-linux-x64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-6.0.400-linux-x64.tar.gz -C $HOME/dotnet
cd
sudo echo 'export PATH=$PATH:$HOME/dotnet' >> .bashrc
sudo echo 'export DOTNET_ROOT=$HOME/dotnet' >> .bashrc
source .bashrc

dotnet --list-sdks
```

---
## samples below this point are not woring ...................

[.NET 6](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)

### Step 1 - download and initiate
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
