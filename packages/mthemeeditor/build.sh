TERMUX_PKG_HOMEPAGE=http://azsky2.html.xdomain.jp/linux/mthemeeditor.html
TERMUX_PKG_DESCRIPTION="TODO: add description"
TERMUX_PKG_DEPENDS="libx11, libxext, libxi, freetype, fontconfig, libpng, libjpeg-turbo, libandroid-shmem"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=http://azsky2.html.xdomain.jp/linux/file/mthemeeditor-1.0.0.tar.xz
TERMUX_PKG_SHA256=2135181fa553c55f47d1dcb68dad00b9a58034482e03b75345246f667321b93f
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure()
{
    CFLAGS+=" -I${TERMUX_PREFIX}/include/freetype2"
    LIBS+=" -landroid-shmem"
}
