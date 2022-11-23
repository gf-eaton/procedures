# 2022-11-20 optimized version for rpi3
# Running this on a rpi3 take days. so better use WSL2 on amd64 architecture.
#
# Your system needs to support the en_US.UTF-8 locale.
# do not run as root (it will not work)
# python 3.6+ required
# debian 10+ required
# Swap file must be 512MB+
# Raspberrypi3 must have 1Gb+ RAM The more you have the faster
#
# Running this on a 16 core Intel i7 with 64GB is very fast but take all core for some time.
#
#sudo apt install socat python3-pexpect xz-utils debianutils iputils-ping python3-git \
#                 python3-jinja2 libegl1-mesa libsdl1.2-dev pylint xterm python3-subunit mesa-common-dev

sudo apt update ; apt upgrade -y ; apt autoremove -y
sudo apt install -y wget git unzip build-essential gcc python3 libssl-dev cpio gawk diffstat texinfo chrpath python3-pip zstd liblz4-tool file

echo "alias python=python3" >> ~/.bashrc
source ~/.bashrc

cd
mkdir -p ~/rpi3/yocto
cd ~/rpi3/yocto
git clone -b kirkstone git://git.openembedded.org/meta-openembedded &
#git clone -b kirkstone git://git.yoctoproject.org/meta-raspberrypi &
git clone https://github.com/agherzan/meta-raspberrypi &
git clone -b kirkstone git://git.yoctoproject.org/poky

cd ~/rpi3
source yocto/poky/oe-init-build-env

cd ~/rpi3/build

bitbake-layers add-layer $PWD/../yocto/meta-openembedded/meta-oe
bitbake-layers add-layer $PWD/../yocto/meta-openembedded/meta-python
#bitbake-layers add-layer $PWD/../sources/meta-openembedded/meta-multimedia
bitbake-layers add-layer $PWD/../yocto/meta-openembedded/meta-networking
bitbake-layers add-layer $PWD/../yocto/meta-raspberrypi
bitbake-layers show-layers

mv conf/local.conf conf/local.conf.old

cat >conf/local.conf <<EOF

#PREFERRED_PROVIDER_virtual/kernel = "linux-raspberrypi"

# Machine Selection
MACHINE ?= "raspberrypi3-64"

# Default policy config
DISTRO ?= "poky"

# Supported from kirkstone
INIT_MANAGER = "systemd"

# UART console cable (debug) 
# learn.adafruit.com/adafruits-raspberry-pi-lesson-5-using-a-console-cable/overview
ENABLE_UART = "1"

# Install minimal package set
CORE_IMAGE_EXTRA_INSTALL = " \
inotify-tools htop iotop \
openssh curl wget"

# Add new user : pi/raspberry and change password of root
EXTRA_USERS_PARAMS = " useradd pi ; \
                       usermod -p raspberry pi ; \
                       usermod -a -G sudo pi ; \
                       usermod -p Security root"

# Package Management configuration
PACKAGE_CLASSES ?= "package_deb"

# SDK target architecture "x86_64" or "aarch64"
SDKMACHINE ?= "x86_64"

# Additional image features
USER_CLASSES ?= "buildstats"

# Interactive shell configuration
PATCHRESOLVE = "noop"

# Exclude some features (save time during build)
DISTRO_FEATURES:remove = " x11 wayland vulkan 3g opengl"

# Specify license white list
LICENSE_FLAGS_ACCEPTED = "commercial synaptics-killswitch"

# Specify version for tracking
CONF_VERSION = "2"

# Specify image filesystem types
IMAGE_FSTYPES = "tar.bz2 ext4 rpi-sdimg"

# Increase free disk space
IMAGE_ROOTFS_EXTRA_SPACE = "1048576"
IMAGE_OVERHEAD_FACTOR = "1.5"

# Use systemd for system initialization
#DISTRO_FEATURES:append = " systemd"
#DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " sysvinit"
#VIRTUAL-RUNTIME_init_manager = "systemd"
#VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
#VIRTUAL-RUNTIME_login_manager = "shadow-base"
#VIRTUAL-RUNTIME_dev_manager = "systemd"
EOF

echo 'bitbake core-image-rt\nor bitbake core-minimal-image\n or bitbake core-image-minimal-dev'

find ./ -name c*.rpi-sdimg
echo "dd if=core-image-minimal-dev-raspberrypi3-64.rpi-sdimg of=/dev/sda1 bs=4M status=progress"
echo "sync"
