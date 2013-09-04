# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
KDE_LINGUAS="de en_GB es et fr km nds pl pt ru sv tr uk"
KDE_LINGUAS_DIR=( applet/locale containment/locale )
KDE_MINIMAL="4.11"
inherit kde4-base cmake-utils

DESCRIPTION="Smooth Tasks 2 plasmoid"
HOMEPAGE="http://kde-apps.org/content/show.php/?content=148813"
SRC_URI="http://beonis.fr/smooth-tasks-v2013-08-24.tar.gz"

SLOT="4"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
LICENSE="GPL-2"
IUSE=""

DEPEND="$(add_kdebase_dep plasma-workspace)"

RDEPEND="${DEPEND}"

S="${WORKDIR}/smooth-tasks2"

src_prepare() {
	if [[ -d build ]]
	then
	  rm -rf build
	fi
	mkdir build || die
}

src_compile() {
	cd build || die
	cmake .. \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || die
	emake -j 2 || die
}

src_install() {
	cd build
	emake DESTDIR="${D}" install || die
}