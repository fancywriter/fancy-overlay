# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker

DESCRIPTION="Slack desktop app"
HOMEPAGE="slack.com"
SRC_URI="https://downloads.slack-edge.com/linux_releases/slack-desktop-${PV}-amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
S=${WORKDIR}

src_install() {
	cp -R * "$D"
}

