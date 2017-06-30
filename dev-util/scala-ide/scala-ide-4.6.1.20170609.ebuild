# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=5

inherit java-pkg-opt-2 versionator

# scala-ide -> scalaide
S_PACK="${PN/-/}-pack"

PV1="$(get_version_component_range 1-3)"
PV2="$(get_version_component_range 4)"

# scala-ide -> scala-SDK-${PV1}
S_SDK="${PN%-*}-SDK-${PV1}"

SRC_URI="http://downloads.typesafe.com/${S_PACK}/${PV1}-vfinal-neon-212-${PV2}/${S_SDK}-vfinal-2.12-linux.gtk.x86_64.tar.gz"

DESCRIPTION="The Scala IDE"
HOMEPAGE="http://www.scala-ide.org"
KEYWORDS="~amd64"

SLOT="0"
LICENSE="BSD"

RDEPEND=">=virtual/jdk-1.8"

MY_D="/opt"

src_unpack() {
	default
	unpack ${A}
	mv "${WORKDIR}"/eclipse "${WORKDIR}"/"${P}"
}

src_prepare() {
	mv "${WORKDIR}"/"${P}"/eclipse "${WORKDIR}"/"${P}"/"${PN}"
}

src_install() {
	cd "${D}" || die
	dodir "${MY_D}" || die
	insinto "${MY_D}"
	doins -r "${WORKDIR}"/"${P}" || die
	insopts -m 0755
	insinto "${MY_D}"/"${P}"
	doins "${WORKDIR}"/"${P}"/"${PN}" || die
	dosym ${MY_D}/${P}/${PN} /usr/bin/${PN} || die
}

