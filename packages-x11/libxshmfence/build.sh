TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://xorg.freedesktop.org/
TERMUX_PKG_DESCRIPTION="A library that exposes a event API on top of Linux futexes"
TERMUX_PKG_VERSION=1.3
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://xorg.freedesktop.org/releases/individual/lib/libxshmfence-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-futex"