# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2

DESCRIPTION="My Dream Diary is a computer diary, that allows you to create and manage descriptions of dreams"
HOMEPAGE="http://sourceforge.net/projects/mydreamdiary/"
SRC_URI="http://sourceforge.net/projects/mydreamdiary/files/mydreamdiary/My%20Dream%20Diary%200.2.5/mdd-0.2.5-source.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~alpha ~amd64 ~arm ~ppc ~ppc64 -sparc ~x86 ~amd64-fbsd ~x86-fbsd"
SLOT="0"
IUSE=""

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/MyDreamDiary"

src_install() {
	dobin MyDreamDiary || die
	dohtml doc/manual.html
}