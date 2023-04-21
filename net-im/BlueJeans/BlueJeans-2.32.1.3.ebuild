# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit versionator rpm

DESCRIPTION="Video Conferencing, Screen Sharing, Video Calls"
HOMEPAGE="https://www.bluejeans.com"
SRC_URI="https://swdl.bluejeans.com/desktop-app/linux/$(get_version_component_range 1-3)/${PN}_${PV}.rpm"

LICENSE="BlueJeans"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
cp -R * "$D"
fperms +x /opt/${PN}/bluejeans-v2

for res in 16 32 48 64 128 256 512 1024; do
    newicon -s ${res} usr/share/icons/hicolor/${res}x${res}/apps/bluejeans-v2.png ${PN}.png
done

dosym /opt/${PN}/${PN} /opt/bin/${PN}
dosym /opt/${PN}/${PN}-bin /opt/bin/${PN}-bin
dosym /usr/lib/libudev.so /opt/${PN}/libudev.so.0

domenu usr/share/applications/bluejeans-v2.desktop
}

