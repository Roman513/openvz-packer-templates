#!/bin/sh -eux

# Remove development and kernel source packages
yum remove -y gcc cpp kernel-headers kernel-devel kernel-uek-devel
yum -y clean all

for ndev in `ls -1 /etc/sysconfig/network-scripts/ifcfg-*`; do
    if [ "`basename $ndev`" != "ifcfg-lo" ]; then
        sed -i '/^HWADDR/d' "$ndev"
        sed -i '/^UUID/d' "$ndev"
    fi
done
