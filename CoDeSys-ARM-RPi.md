# install CoDeSys runtime for Linux ARM (Rpi 2/3)

[source reference](https://forge.codesys.com/trg/raspberry-pi/wiki/Home/)

Duration : ~?? minutes

```
apt-get install -y quilt;
wget --output-document=/usr/src/osadl.sh https://www.osadl.org/monitoring/showpatchscript.php?veryshorthost=r7s3s;
cd /usr/src;
chmod 755 osadl.sh;
./osadl.sh
```

Then you can simply compile the kernel, as the default configuration, used in the test rack, is already prepared:

* error at  `yes | make oldconfig` then not completed succesfully.

```
cd /usr/src/linux-*-rt*;
export KERNEL=kernel7;
yes | make oldconfig;
make zImage;
make modules_install:
```

To install it, just copy a few files to /boot.
```
release=$(cut -d" " -f3 include/generated/utsrelease.h | tr -d '"')
cp /usr/src/linux-*-rt*/arch/arm/boot/zImage /boot/zImage-$release;
cp /usr/src/linux-*-rt*/arch/arm/boot/zImage /boot/$KERNEL.img;
```

---
