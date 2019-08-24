# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit versionator rpm

PV1=$(get_version_component_range 1-2)

DESCRIPTION="Video Conferencing, Screen Sharing, Video Calls"
HOMEPAGE="https://www.bluejeans.com"
SRC_URI="https://swdl.bluejeans.com/desktop/linux/${PV1}/${PV}/bluejeans-${PV}.x86_64.rpm"

LICENSE="BlueJeans"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
  cp -R * "$D"
  
  fperms +x /opt/${PN}/${PN}

  for res in 16 24 32 256; do
    newicon -s ${res} opt/${PN}/icons/hicolor/${res}x${res}/apps/${PN}.png ${PN}.png
  done
  
  dosym /opt/${PN}/${PN} /opt/bin/${PN}
  dosym /opt/${PN}/${PN}-bin /opt/bin/${PN}-bin
  dosym /usr/lib/libudev.so /opt/${PN}/libudev.so.0

  domenu opt/${PN}/${PN}.desktop
}


