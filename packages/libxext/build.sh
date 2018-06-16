TERMUX_PKG_HOMEPAGE=https://xorg.freedesktop.org/
TERMUX_PKG_DESCRIPTION="X11 miscellaneous extensions library"
TERMUX_PKG_DEPENDS="x11-proto, libx11, xorg-util-macros"
TERMUX_PKG_VERSION=1.3.3
TERMUX_PKG_SRCURL=https://xorg.freedesktop.org/releases/individual/lib/libXext-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=b518d4d332231f313371fdefac59e3776f4f0823bcb23cf7c7305bfb57b16e35
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--enable-malloc0returnsnull"
