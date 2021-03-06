TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=http://www.pango.org/
TERMUX_PKG_DESCRIPTION="Library for laying out and rendering text (with X)"
TERMUX_PKG_VERSION=1.42.1
TERMUX_PKG_REVISION=2
TERMUX_PKG_SHA256=915a6756b298578ff27c7a6393f8c2e62e6e382f9411f2504d7af1a13c7bce32
TERMUX_PKG_SRCURL=https://ftp.gnome.org/pub/GNOME/sources/pango/${TERMUX_PKG_VERSION:0:4}/pango-${TERMUX_PKG_VERSION}.tar.xz

TERMUX_PKG_DEPENDS="fontconfig, fribidi, glib, harfbuzz, libcairo-x, libxft"
TERMUX_PKG_DEVPACKAGE_DEPENDS="fontconfig-dev, harfbuzz-dev, libcairo-x-dev, libpixman-dev"

TERMUX_PKG_PROVIDES="pango"
TERMUX_PKG_REPLACES="${TERMUX_PKG_PROVIDES}"
TERMUX_PKG_CONFLICTS="${TERMUX_PKG_PROVIDES}, pango-dev"
