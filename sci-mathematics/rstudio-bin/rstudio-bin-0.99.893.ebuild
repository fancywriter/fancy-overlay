# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils fdo-mime

PN_PRETTY="RStudio"
MY_PN="rstudio"
DESCRIPTION="IDE for the R language"
HOMEPAGE="https://www.rstudio.com/"
LICENSE="AGPLv3"
SRC_URI="https://download1.rstudio.org/${MY_PN}-${PV}-amd64-debian.tar.gz"

RESTRICT="mirror strip"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${MY_PN}-${PV}"

RDEPEND="dev-lang/R
!sci-mathematics/rstudio"

src_install() {
	local install_dir="/opt/${MY_PN}"
	local bin="/usr/bin/${MY_PN}"

	insinto "$install_dir"
	doins -r .

	fperms +x "${install_dir}/bin/${MY_PN}"
	fperms +x "${install_dir}/bin/${MY_PN}-backtrace.sh"
	fperms +x "${install_dir}/bin/r-ldpath"
	fperms +x "${install_dir}/bin/rpostback"
	fperms +x "${install_dir}/bin/rsession"
	fperms +x "${install_dir}/bin/pandoc/pandoc"
	fperms +x "${install_dir}/bin/pandoc/pandoc-citeproc"
	dosym "${install_dir}/bin/${MY_PN}" "$bin"

	newicon -s 256 "rstudio.png" "${MY_PN}.png"

	make_desktop_entry_args=(
		"${bin} %U"							# exec
		"$PN_PRETTY"						# name
		"$MY_PN"							# icon
		"Development"						# categories
	)
	make_desktop_entry_extras=(
	    "MimeType=text/x-r-source;"       # MUST end with semicolon
	)
	make_desktop_entry \
		"${make_desktop_entry_args[@]}" \
		"$( printf '%s\n' "${make_desktop_entry_extras[@]}" )"
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

