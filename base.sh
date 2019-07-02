#!/bin/bash

loadkeys sv-latin1 &&
timedatectl set-ntp true &&

wipefs -a /dev/sda &&
parted /dev/sda mklabel gpt &&
parted /dev/sda mkpart ext4 1MiB 3MiB &&
parted /dev/sda mkpart ext4 3MiB 100% &&
parted /dev/sda set 1 bios_grub on &&
mkfs.ext4 /dev/sda2 &&

mount /dev/sda2 /mnt &&
pacstrap /mnt base base-devel &&

genfstab -U /mnt >> /mnt/etc/fstab &&
arch-chroot /mnt &&
ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime &&
hwclock --systohc &&

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen &&
locale-gen &&
echo LANG=en_US.UTF-8 > /etc/locale.conf &&
echo KEYMAP=sv-latin1 > /etc/vconsole.conf &&
echo arch > /etc/hosts &&
echo 127.0.0.1  localhost >> /etc/hosts &&
echo ::1        localhost >> /etc/hosts &&
echo 127.0.1.1  arch.localdomain arch >> /etc/hosts
