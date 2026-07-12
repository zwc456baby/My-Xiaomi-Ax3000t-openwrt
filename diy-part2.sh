#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# 1. 强制将 luci-app-vsftpd 内部的所有 vsftpd 依赖全部替换为 vsftpd-alt
sed -i 's/PACKAGE_vsftpd/PACKAGE_vsftpd-alt/g' package/lean/luci-app-vsftpd/Makefile
sed -i 's/+vsftpd/+vsftpd-alt/g' package/lean/luci-app-vsftpd/Makefile

# 2. 顺便确保 .config 中关闭标准版，开启精简版
echo "CONFIG_PACKAGE_vsftpd-alt=y" >> .config
sed -i 's/CONFIG_PACKAGE_vsftpd=y/# CONFIG_PACKAGE_vsftpd is not set/' .config