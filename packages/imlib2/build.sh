TERMUX_PKG_HOMEPAGE=http://sourceforge.net/projects/enlightenment/
TERMUX_PKG_DESCRIPTION="Library that does image file loading and saving as well as rendering, manipulation, arbitrary polygon support"
TERMUX_PKG_DEPENDS="freetype, giflib, libandroid-shmem, libbz2, libjpeg-turbo, libpng, libtiff, libxext, libid3tag"
TERMUX_PKG_VERSION=1.4.10
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=http://downloads.sourceforge.net/enlightenment/imlib2-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=39907c9a62814e8bff05bafe3760db6b7993bb3803832bcaad54e79b75423e5e
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="LIBS=-landroid-shmem"
