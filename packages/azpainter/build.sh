TERMUX_PKG_HOMEPAGE=https://osdn.net/projects/azpainter/
TERMUX_PKG_DESCRIPTION="Full color painting software for Linux for illustration drawing."
TERMUX_PKG_DEPENDS="libx11, libxext, libxi, freetype, fontconfig, libpng, libjpeg-turbo, libandroid-shmem"
TERMUX_PKG_VERSION=2.1.1
TERMUX_PKG_REVISION=3
TERMUX_PKG_SRCURL=https://osdn.net/projects/azpainter/downloads/68339/azpainter-$TERMUX_PKG_VERSION.tar.xz
TERMUX_PKG_SHA256=f70111edbbbbd512a48954289be130ecc7f3ff39cc8ccb3cc6b9e9cfdd3c932b
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_CLANG=no

termux_step_pre_configure()
{
    CFLAGS+=" -I${TERMUX_PREFIX}/include/freetype2"
    LIBS+=" -landroid-shmem"
}
