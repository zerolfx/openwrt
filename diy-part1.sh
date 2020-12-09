#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# fullcone NAT patch
git clone -b master --single-branch https://github.com/LGA1150/openwrt-fullconenat package/fullconenat
# https://github.com/LGA1150/openwrt-fullconenat/issues/4
sed -i 's/SUBDIRS/M/' package/fullconenat/Makefile
# following two lines need to be added in iptables
# iptables -t nat -A POSTROUTING -o eth0 -j FULLCONENAT
# iptables -t nat -A PREROUTING -i eth0 -j FULLCONENAT
