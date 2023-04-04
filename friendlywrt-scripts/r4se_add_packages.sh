#!/usr/bin/env bash

# {{ Add luci-app-diskman
(cd friendlywrt && {
    mkdir -p package/luci-app-diskman
    wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/applications/luci-app-diskman/Makefile -O package/luci-app-diskman/Makefile
    mkdir -p package/parted
    wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile
})
cat >> configs/rockchip/01-nanopi <<EOL
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_btrfs_progs=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_lsblk=y
CONFIG_PACKAGE_smartmontools=y
EOL
# }}

# {{ Add luci-theme-argon
(cd friendlywrt/package && {
    [ -d luci-theme-argon ] && rm -rf luci-theme-argon
    git clone https://github.com/jerrykuku/luci-theme-argon.git --depth 1 -b master
})
echo 'CONFIG_PACKAGE_luci-theme-argon=y' >> configs/rockchip/01-nanopi
sed -i -e 's/function init_theme/function old_init_theme/g' friendlywrt/target/linux/rockchip/armv8/base-files/root/setup.sh
cat > /tmp/appendtext.txt <<EOL
function init_theme() {
    if uci get luci.themes.Argon >/dev/null 2>&1; then
        uci set luci.main.mediaurlbase="/luci-static/argon"
        uci commit luci
    fi
}
EOL
sed -i -e '/boardname=/r /tmp/appendtext.txt' friendlywrt/target/linux/rockchip/armv8/base-files/root/setup.sh
# }}

# https://github.com/friendlyarm/Actions-FriendlyWrt

# {{ 探索世界
(cd friendlywrt/package && {
    [ -d helloworld ] && rm -rf helloworld
    git clone https://github.com/fw876/helloworld.git --depth 1 -b master
})
echo 'CONFIG_PACKAGE_luci-app-ssr-plus=y' >> configs/rockchip/01-nanopi
# }}

# {{ licsber
echo 'CONFIG_PACKAGE_luci-app-mwan3=y' >> configs/rockchip/01-nanopi
echo 'CONFIG_PACKAGE_luci-app-syncdial=y' >> configs/rockchip/01-nanopi

echo 'CONFIG_PACKAGE_luci-app-openvpn-server=y' >> configs/rockchip/01-nanopi
echo 'CONFIG_PACKAGE_luci-app-wireguard=y' >> configs/rockchip/01-nanopi

echo 'CONFIG_PACKAGE_ddns-scripts-cloudflare=y' >> configs/rockchip/01-nanopi

echo 'CONFIG_PACKAGE_docker-compose=y' >> configs/rockchip/01-nanopi
# }}
