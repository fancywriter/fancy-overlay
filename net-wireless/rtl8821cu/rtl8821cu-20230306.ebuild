# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit linux-mod

COMMIT="69c903b75bde36293c66b25c051916a74dbadf58"
DESCRIPTION="Linux Driver for USB WiFi Adapters that are based on the RTL8811CU, RTL8821CU, RTL8821CUH and RTL8731AU Chipsets"
HOMEPAGE="https://github.com/morrownr/8821cu-20210916"
SRC_URI="https://github.com/morrownr/8821cu-20210916/archive/${COMMIT}.tar.gz -> ${P}-${COMMIT}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64"

DEPEND="virtual/linux-sources"

S="${WORKDIR}/8821cu-20210916-${COMMIT}"

MODULE_NAMES="8821cu(net/wireless)"
BUILD_TARGETS="all"
BUILD_TARGET_ARCH="${ARCH}"

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="KERN_DIR=${KV_DIR} ARCH=x86_64 KSRC=${KV_DIR} KERN_VER=${KV_FULL} O=${KV_OUT_DIR} V=1 KBUILD_VERBOSE=1"
}

src_compile(){
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
}
