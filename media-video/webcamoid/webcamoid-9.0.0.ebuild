# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# borrowed from https://bugs.gentoo.org/833518 until it goes upstream

EAPI=7

inherit cmake qmake-utils xdg-utils

DESCRIPTION="A full featured webcam capture application"
HOMEPAGE="https://webcamoid.github.io"
SRC_URI="https://github.com/webcamoid/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

IUSE_AVKYS=( alsa coreaudio ffmpeg gstreamer jack libuvc pipewire pulseaudio v4lutils videoeffects )
IUSE="${IUSE_AVKYS[@]} debug headers v4l"

REQUIRED_USE="v4lutils? ( v4l )"

RDEPEND="
	dev-qt/qtconcurrent:5
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtopengl:5
	dev-qt/qtquickcontrols2:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	ffmpeg?	( media-video/ffmpeg:= )
	gstreamer? ( >=media-libs/gstreamer-1.6.0 )
	jack? ( virtual/jack )
	libuvc? ( media-libs/libuvc )
	pulseaudio? ( media-sound/pulseaudio )
	v4l? ( media-libs/libv4l )
"

DEPEND="${RDEPEND}
	>=sys-kernel/linux-headers-3.6
"
BDEPEND="
	dev-qt/linguist-tools:5
	virtual/pkgconfig
"

src_configure() {
	local mycmakeargs=(
		"-DGIT_BIN=OFF"
		"-DLIBDIR=/usr/$(get_libdir)"
		"-DCMAKE_INSTALL_MANDIR=/usr/share/man/man1"
		"-DNOAVFOUNDATION=ON"
		"-DNODSHOW=ON"
		"-DNOWASAPI=ON"
	)

	use v4l || mycmakeargs+=( "-DNOV4L2=ON" )

	for x in ${IUSE_AVKYS[@]}; do
		use ${x} || mycmakeargs+=( "-DNO${x^^}=ON" )
	done
	cmake_src_configure
}

