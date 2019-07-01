#!/bin/bash

# Set keyboard-layout & system clock
loadkeys sv-latin1 &&
timedatectl set-ntp true
