#!/bin/bash
loadkeys sv-latin1
timedatectl set-ntp true

wipefs -a /dev/sda 
parted /dev/sda mklabel gpt
parted /dev/sda mkpart ext4 1MiB 3MiB
parted /dev/sda mkpart ext4 3MiB 100%
parted /dev/sda set 1 bios_grub on
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt
pacstrap /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab
cp first.sh /mnt/root/first.sh
chmod 777 /mnt/root/first.sh
arch-chroot /mnt
echo "Chroot successful!"
