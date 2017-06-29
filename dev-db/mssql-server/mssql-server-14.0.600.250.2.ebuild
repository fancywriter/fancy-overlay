# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit versionator unpacker

DESCRIPTION="Microsoft SQL Server"
HOMEPAGE="https://www.microsoft.com/en-us/sql-server"
MY_PV="$(replace_version_separator 4 '-')"
SRC_URI="https://packages.microsoft.com/ubuntu/16.04/$PN/pool/main/m/$PN/${PN}_${MY_PV}_amd64.deb"
S="$WORKDIR"

LICENSE="Microsoft EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/jemalloc sys-libs/libcxx sys-process/numactl virtual/krb5 sys-auth/sssd"
RDEPEND="${DEPEND}"

PATCHES=("$FILESDIR/$PN-python2.patch")

src_install() {
  cp -R * "$D"
}

