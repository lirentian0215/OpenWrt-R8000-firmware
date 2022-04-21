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

git checkout 1a86fc37114da97764e337908d05e0752941acb9

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

echo '添加jerrykuku的argon-mod主题'
rm -rf package/lean/luci-theme-argon  
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config
echo '=========Add argon-mod OK!========='

echo '移除bcm53xx中的其他机型'
sed -i '393,453d' target/linux/bcm53xx/image/Makefile
sed -i '352,384d' target/linux/bcm53xx/image/Makefile
sed -i '140,344d' target/linux/bcm53xx/image/Makefile
# sed -i 's/(BRCMFMAC_43602A1)/(IEEE8021X) kmod-brcmfmac k3wifi/g' target/linux/bcm53xx/image/Makefile
# sed -n '140,146p' target/linux/bcm53xx/image/Makefile
echo '=========Remove other devices of bcm53xx OK!========='

# 1.'asus_dhd24' 2.'ac88u_20' 3.'r8500'
# firmware='bin_r8500'
# echo '替换R8000的无线驱动为netgear-r8500'
# wget -nv https://github.com/yangxu52/Phicomm-k3-Wireless-Firmware/raw/master/brcmfmac4366c-pcie.${firmware} -O package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
# echo '=========Replace R8000 wireless firmware OK!========='
