TERMUX_PKG_HOMEPAGE=http://openbox.org
TERMUX_PKG_DESCRIPTION="Fonts for X server (only basic)"
TERMUX_PKG_DEPENDS="fontconfig-utils"
TERMUX_PKG_VERSION=1.0-termux
TERMUX_PKG_REVISION=3
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_post_make_install()
{
    (
        mkdir -p "${TERMUX_PREFIX}/share/fonts"
        cd "${TERMUX_PREFIX}/share/fonts"
        tar xvf "${TERMUX_PKG_BUILDER_DIR}/fonts.tar.xz"
    )
}

termux_step_create_debscripts() {
    ## POST INSTALL:
    echo "#!${TERMUX_PREFIX}/bin/sh" > postinst
    echo "${TERMUX_PREFIX}/bin/fc-cache" >> postinst
}
