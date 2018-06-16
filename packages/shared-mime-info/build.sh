TERMUX_PKG_HOMEPAGE=https://freedesktop.org/Software/shared-mime-info
TERMUX_PKG_DESCRIPTION="Freedesktop.org Shared MIME Info"
TERMUX_PKG_DEPENDS="glib, libxml2"
TERMUX_PKG_VERSION=1.9
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://freedesktop.org/~hadess/shared-mime-info-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=5c0133ec4e228e41bdf52f726d271a2d821499c2ab97afd3aa3d6cf43efcdc83
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-update-mimedb ac_cv_func_fdatasync=no"

termux_step_post_massage()
{
    ## pkgconfig directory should be located under $PREFIX/lib
    mkdir -p ${TERMUX_PKG_MASSAGEDIR}/${TERMUX_PREFIX}/lib
    mv "${TERMUX_PKG_MASSAGEDIR}/${TERMUX_PREFIX}/share/pkgconfig" "${TERMUX_PKG_MASSAGEDIR}/${TERMUX_PREFIX}/lib/"
}

termux_step_create_debscripts()
{
    cp "${TERMUX_PKG_BUILDER_DIR}/postinst" ./postinst
    cp "${TERMUX_PKG_BUILDER_DIR}/triggers" ./triggers
}
