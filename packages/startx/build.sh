TERMUX_PKG_HOMEPAGE=http://openbox.org
TERMUX_PKG_DESCRIPTION="This package was replaced by 'termux-desktop' and shouldn't be used anymore"
TERMUX_PKG_DEPENDS="bash, dosbox, fltk-editor, grep, openbox, the-powder-toy, tigervnc, xterm"
TERMUX_PKG_CONFLICTS="openbox (<< 3.6.1-1)"
TERMUX_PKG_RECOMMENDS="openbox"
TERMUX_PKG_VERSION=1.1
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_post_make_install()
{
    ## install custom variant of scripts startup scripts
    cp -f "${TERMUX_PKG_BUILDER_DIR}/startx" "${TERMUX_PREFIX}/bin/startx"
    chmod 755 "${TERMUX_PREFIX}/bin/startx"
}

termux_step_create_debscripts()
{
    cp "${TERMUX_PKG_BUILDER_DIR}/postinst" ./postinst
}
