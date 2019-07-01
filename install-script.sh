#!/bin/bash

# Set keyboard-layout & system clock
loadkeys sv-latin1 &&
timedatectl set-ntp true &&

# Partitioning
wipefs -a /dev/sda &&
parted /dev/sda mklabel gpt &&
parted /dev/sda mkpart ext4 1MiB 3MiB &&
parted /dev/sda mkpart ext4 3MiB 100% &&
parted /dev/sda set 1 bios_grub on &&

# Formatting
#mkfs.ext4 /dev/sda2 &&

# Mount
#mount /dev/sda2 /mnt &&

# Install base
#pacstrap /mnt base base-devel &&

# System configuration
#genfstab -U /mnt >> /mnt/etc/fstab &&
#arch-chroot /mnt &&
#ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime &&
#hwclock --systohc
