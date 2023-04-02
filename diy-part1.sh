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

# git checkout 11a39777bcc1faf0b3f3598b509be6c6721ca0da

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
# git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# echo '添加jerrykuku的argon-mod主题'
# rm -rf package/lean/luci-theme-argon  
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/lean/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config
# echo '=========Add argon-mod OK!========='

echo '移除bcm53xx中的其他机型'
sed -i '393,453d' target/linux/bcm53xx/image/Makefile
sed -i '352,384d' target/linux/bcm53xx/image/Makefile
sed -i '140,344d' target/linux/bcm53xx/image/Makefile
echo '=========Remove other devices of bcm53xx OK!========='

# 添加gn 临时方案
cd package
svn co https://github.com/kenzok8/small-package/trunk/gn
