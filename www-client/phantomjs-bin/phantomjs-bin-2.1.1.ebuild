# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PP="phantomjs"

DESCRIPTION="A headless WebKit scriptable with a JavaScript API"
HOMEPAGE="http://phantomjs.org"
SRC_URI="https://bitbucket.org/ariya/phantomjs/downloads/${PP}-${PV}-linux-x86_64.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="!www-client/phantomjs"
RDEPEND="${DEPEND}"
S="${WORKDIR}"

src_install() {
	dodir "/opt/${PP}"
	cp -R "${S}"/${PP}-${PV}-linux-x86_64/* "${D}/opt/${PP}"
	dosym /opt/${PP}/bin/phantomjs /usr/bin/phantomjs
}

