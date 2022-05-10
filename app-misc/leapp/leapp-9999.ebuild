# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker

DESCRIPTION="Cloud credentials manager"
HOMEPAGE="www.leapp.cloud"
EGIT_REPO_URI="https://github.com/Noovolari/leapp.git"

LICENSE="MIT"
SLOT="0"
IUSE=""
S=${WORKDIR}

src_install() {
	cp -R * "$D"
	dosym /opt/Leapp/${PN} /opt/bin/${PN}
}

