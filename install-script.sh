#!/bin/bash

loadkeys sv-latin1 &&
timedatectl set-ntp true &&

wipefs -a /dev/sda &&
parted /dev/sda mklabel gpt &&
parted /dev/sda mkpart ext4 1MiB 100%
