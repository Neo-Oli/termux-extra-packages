TERMUX_PKG_HOMEPAGE=http://openbox.org
TERMUX_PKG_DESCRIPTION="Script for starting a Termux Desktop"
TERMUX_PKG_DEPENDS="bash, dosbox, fltk-editor, grep, openbox, the-powder-toy, tigervnc, xterm"
TERMUX_PKG_CONFLICTS="openbox (<< 3.6.1-1), startx"
TERMUX_PKG_REPLACES="startx"
TERMUX_PKG_VERSION=1.1
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_post_make_install()
{
    ## install custom variant of scripts startup scripts
    cp -f "${TERMUX_PKG_BUILDER_DIR}/startx" "${TERMUX_PREFIX}/bin/startx"
    chmod 755 "${TERMUX_PREFIX}/bin/startx"
}
