TERMUX_PKG_HOMEPAGE=http://www.gtk.org/
TERMUX_PKG_DESCRIPTION="GObject-based multi-platform GUI toolkit"
TERMUX_PKG_VERSION=3.22.26
TERMUX_PKG_REVISION=14
TERMUX_PKG_SRCURL=https://github.com/GNOME/gtk/archive/3a1a7135a276f2b6336c7566f6342da739a41d39.zip
TERMUX_PKG_SHA256=d65bc174b7bcef66aac7f66f708530fe2d2569deb734618ac818c73bb9de17e7
TERMUX_PKG_DEPENDS="adwaita-icon-theme, desktop-file-utils, gdk-pixbuf, glib, glib-bin, libatk, libcairo-x, libepoxy, libxcomposite, libxcursor, libxdamage, libxfixes, libxi, libxinerama, pangoxft, shared-mime-info, x11-proto"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-introspection --enable-xinerama --enable-xfixes --enable-xcomposite --enable-xdamage"
TERMUX_PKG_RM="share/glib-2.0/schemas/gschemas.compiled"

termux_step_pre_configure()
{
    # prevent permission denied on build scripts
    find . -type f | xargs chmod u+x
}

termux_step_create_debscripts()
{
    cp "${TERMUX_PKG_BUILDER_DIR}/postinst" ./postinst
}
