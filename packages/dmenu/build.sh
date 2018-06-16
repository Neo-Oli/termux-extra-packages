TERMUX_PKG_HOMEPAGE=https://tools.suckless.org/dmenu/
TERMUX_PKG_DESCRIPTION="Generic menu for X"
TERMUX_PKG_DEPENDS="dash, libxinerama, libxft, freetype"
TERMUX_PKG_VERSION=4.8
TERMUX_PKG_SRCURL=https://dl.suckless.org/tools/dmenu-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=fe615a5c3607061e2106700862e82ac62a9fa1e6a7ac3d616a9c76106476db61
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make()
{
    make -j ${TERMUX_MAKE_PROCESSES} CC="${CC}"
}
