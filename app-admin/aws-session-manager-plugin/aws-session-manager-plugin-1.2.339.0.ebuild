EAPI=8

inherit unpacker

DESCRIPTION="AWS session manager plugin"
HOMEPAGE="https://github.com/aws/session-manager-plugin/tags"
SRC_URI="https://s3.amazonaws.com/session-manager-downloads/plugin/$PV/ubuntu_64bit/session-manager-plugin.deb"

#LICENSE="Apache License 2.0"
SLOT="0"
KEYWORDS="~amd64"
S=${WORKDIR}

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	mkdir $D/opt
	cp -R usr/local/sessionmanagerplugin $D/opt/sessionmanagerplugin
	dosym ../sessionmanagerplugin/bin/session-manager-plugin opt/bin/session-manager-plugin
}

