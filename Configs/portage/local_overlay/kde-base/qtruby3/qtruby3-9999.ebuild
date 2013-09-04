# Copyright 1999-2013 Gentoo Foundation
# Copyright 2013 Vladislav Mileshkin
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/qtruby/qtruby-4.9.5.ebuild,v 1.1 2013/01/05 20:18:36 creffett Exp $

EAPI=5

inherit cmake-utils git-2 ruby-ng

DESCRIPTION="Qt Ruby bindings. QtRuby-3.0 branch."
HOMEPAGE="https://projects.kde.org/projects/kde/kdebindings/ruby/qtruby"
LICENSE="|| ( GPL-2 LGPL-2.1 )"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
OPENGL_REQUIRED="always"

SRC_URI=""
EGIT_REPO_URI="git://anongit.kde.org/qtruby"
EGIT_BRANCH="qtruby-3.0"

IUSE="+ruby_targets_ruby19 declarative debug phonon qscintilla qwt webkit qthelp"

DEPEND="kde-base/smokeqt[declarative,opengl,debug?,phonon?,qscintilla?,qwt?,webkit?,qthelp?]
	!kde-base/qtruby"

RDEPEND="${DEPEND}"

USE_RUBY="ruby19"

pkg_setup() {
	ruby-ng_pkg_setup
}

src_unpack() {
	local S="${WORKDIR}/${P}"
	git-2_src_unpack

	cd "${WORKDIR}"
	mkdir all
	mv ${P} all/ || die "Could not move sources"
}

all_ruby_prepare() {
	local CMAKE_USE_DIR=${S}
	use qthelp && (epatch "${FILESDIR}/${PN}-${PV}-add-qthelp-module.patch" || die "QtHelp patch failed!")
}

each_ruby_configure() {
	local CMAKE_USE_DIR=${S}
	mycmakeargs=(
		-DRUBY_LIBRARY=$(ruby_get_libruby)
		-DRUBY_INCLUDE_PATH=$(ruby_get_hdrdir)
		-DRUBY_EXECUTABLE=${RUBY}
	$(cmake-utils_use_disable declarative QtDeclarative)
	$(cmake-utils_use_with phonon)
	$(cmake-utils_use_with qscintilla QScintilla)
	$(cmake-utils_use_with qwt Qwt5)
	$(cmake-utils_use_disable webkit QtWebKit)
	)
	cmake-utils_src_configure
}

each_ruby_compile() {
	local CMAKE_USE_DIR=${S}
	cmake-utils_src_compile
}

each_ruby_install() {
	local CMAKE_USE_DIR=${S}
	cmake-utils_src_install
}
