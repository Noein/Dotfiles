# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit subversion

DESCRIPTION="Qt based GUI for unixODBC"
HOMEPAGE="http://sourceforge.net/projects/unixodbc-gui-qt/"
ESVN_REPO_URI="svn://svn.code.sf.net/p/unixodbc-gui-qt/code/trunk"
SRC_URI=""

LICENSE="GPL-3"
KEYWORDS=""
SLOT="0"
IUSE=""

DEPEND="
	>=dev-db/unixODBC-2.3.0
	dev-qt/qtcore:4
	dev-qt/qtgui:4
"

RDEPEND="${DEPEND}"

src_unpack() {
	subversion_src_unpack
}

src_prepare() {
	epatch ${FILESDIR}/${P}-remove_qtassistantclient_from_m4_file.patch || die
	emake -f Makefile.svn || die
}

src_configure() {
	econf \
		--with-qt-dir-include=/usr/include/qt4 \
		--with-qt-dir-lib=/usr/lib/qt4 \
		--with-qt-bin=/usr/bin || die "configure failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
