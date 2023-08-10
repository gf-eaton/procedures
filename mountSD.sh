#!/bin/bash

# Copyright Guy Francoeur (c) 2023
# --init as first argument to format the SDcard otherwise default will mount the USB SDcard.

# to see the config
fdisk -l | grep sd
fuser -m /dev/sda1 /dev/sdb1 /dev/sdc1

# list uuid
lsblk -f ; blkid

arr=(sda sdb sdc)
#Something needed here to configure the right `cat /etc/passwd ; getent group` for postgres
sda= #"umask=uid=110,gid=116,fmask=0000,dmask=0000"
sdb=
sdc=

for i in "${arr[@]}"
do
 echo ">********************* $i *********************"
 VAR=`blkid -s UUID -o value /dev/${i}1`

 if [ -n "$VAR" ] ; then
  if [ "$1" == "--init" ] ; then
   mount | grep "${i}1" && umount -f /mnt/${i}
   mkfs.vfat -F 32 /dev/${i}1
   fsck /dev/${i}1
   mkdir -p /mnt/${i}
  fi
  v=`echo ${!i}`
  mount /dev/${i}1 /mnt/${i} $v
  touch /mnt/${i}/test.ok
  date >> /mnt/${i}/test.ok
  ls /mnt/${i}
  cat /mnt/${i}/test.ok
 fi
 echo " --------------------- $i ---------------------<"
done

echo "all done... enjoy"
