# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker

DESCRIPTION="YSoft SafeQ"
HOMEPAGE="https://ysoft.com"
RESTRICT="fetch"
SRC_URI="${PN}_${PV}_amd64.deb"
S="$WORKDIR"

LICENSE="YSoft"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="net-libs/libcrafter"
RDEPEND="${DEPEND}"

src_install() {
  cp -R * "$D"
  mkdir ${D}usr/libexec/cups/backend -p
  mv ${D}usr/lib/cups/backend/sqport ${D}usr/libexec/cups/backend
  rm -r ${D}usr/lib
}

