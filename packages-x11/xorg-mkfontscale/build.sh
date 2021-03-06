TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://xorg.freedesktop.org/
TERMUX_PKG_DESCRIPTION="Create an index of scalable font files for X"
TERMUX_PKG_VERSION=1.1.3
TERMUX_PKG_SRCURL=https://xorg.freedesktop.org/archive/individual/app/mkfontscale-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=1e98df69ee5f4542d711e140e1d93e2c3f2775407ccbb7849110d52b91782a6a
TERMUX_PKG_DEPENDS="freetype, libfontenc"
TERMUX_PKG_BUILD_DEPENDS="xorg-util-macros, xorgproto"
