TERMUX_PKG_HOMEPAGE=https://www.gnome.org
TERMUX_PKG_VERSION=3.26.1
TERMUX_PKG_REVISION=2
TERMUX_PKG_DESCRIPTION="Freedesktop.org Hicolor icon theme"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_DEPENDS="hicolor-icon-theme"

termux_step_make_install()
{
    install -Dm644 "${TERMUX_PKG_BUILDER_DIR}/adwaita-icon-theme.pc" "${TERMUX_PREFIX}/lib/pkgconfig/adwaita-icon-theme.pc"
    rm -rf "${TERMUX_PREFIX}/share/icons/Adwaita"
    tar xf "${TERMUX_PKG_BUILDER_DIR}/adwaita-icon-theme.tar.xz" -C "${TERMUX_PREFIX}/share/icons/"
}

termux_step_create_debscripts()
{
    cp "${TERMUX_PKG_BUILDER_DIR}/postinst" ./postinst
}
