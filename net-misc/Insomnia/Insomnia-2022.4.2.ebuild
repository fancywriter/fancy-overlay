EAPI=8

inherit unpacker

DESCRIPTION="API client for GraphQL, REST, and gRPC"
HOMEPAGE="https://insomnia.rest"
SRC_URI="https://github.com/Kong/insomnia/releases/download/core@${PV}/${PN}.Core-${PV}.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
S=${WORKDIR}

src_install() {
	rm -rf usr/share/doc
	cp -R * "$D"
	dosym /opt/${PN}/insomnia /opt/bin/insomnia
}

