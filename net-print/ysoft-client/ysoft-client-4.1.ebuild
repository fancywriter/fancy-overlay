# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit versionator unpacker

DESCRIPTION="YSoft SafeQ"
HOMEPAGE="https://ysoft.com"
RESTRICT="mirror"
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
}

