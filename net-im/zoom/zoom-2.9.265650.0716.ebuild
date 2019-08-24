# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit unpacker

DESCRIPTION="Video Conferencing, Web Conferencing. Webinars, Screen Sharing"
HOMEPAGE="https://zoom.us"
SRC_URI="https://zoom.us/client/latest/${PN}_amd64.deb"

LICENSE="Zoom"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
  cp -R * "$D"
}

