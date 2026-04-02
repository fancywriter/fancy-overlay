# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit rpm
DESCRIPTION="Scanning plugin for EPSON scanners (nonfree)"
HOMEPAGE="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
PLUGIN_VERSION="1.0.0.6"
LICENSE="Copyright SEIKO EPSON CORPORATION"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="media-gfx/epsonscan2"
RESTRICT="bindist mirror strip fetch"
SRC_URI="epsonscan2-bundle-${PV}_23.x86_64.rpm.tar.gz"
S=${WORKDIR}

src_unpack() {
	default
	rpm_unpack ./epsonscan2-bundle-${PV}23.x86_64.rpm/plugins/$PN-$PLUGIN_VERSION-1.x86_64.rpm
}

src_install() {
	insinto usr/lib64
	doins -r usr/lib64/epsonscan2
	fperms 755 /usr/lib64/epsonscan2/non-free-exec/ddeplugin
	fperms 755 /usr/lib64/epsonscan2/non-free-exec/dtrplugin
	fperms 755 /usr/lib64/epsonscan2/non-free-exec/es2intif
	fperms 755 /usr/lib64/epsonscan2/non-free-exec/es2netif
	fperms 755 /usr/lib64/epsonscan2/non-free-exec/fitplugin
	doins -r usr/lib64/epsonscan2-ocr
	insinto usr/share
	doins -r usr/share/epsonscan2
	doins -r usr/share/epsonscan2-ocr
	exeinto usr/libexec/epsonscan2-ocr
	doexe usr/libexec/epsonscan2-ocr/ocr-engine-getrotate
	dodoc usr/share/doc/$PN-$PLUGIN_VERSION-1/*
}
