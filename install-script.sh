#!/bin/bash

loadkeys sv-latin1 &&
timedatectl set-ntp true &&

wipefs -a /dev/sda &&
parted /dev/sda mklabel gpt &&
parted /dev/sda mkpart ext4 1MiB 3MiB && 
parted /dev/sda mkpart ext4 3MiB 100% &&
parted /dev/sda set 1 bios_grub on &&

mkfs.ext4 /dev/sda2
