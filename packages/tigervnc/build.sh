TERMUX_PKG_HOMEPAGE="http://www.tigervnc.org"
TERMUX_PKG_VERSION=1.8.0
TERMUX_PKG_REVISION=4
TERMUX_PKG_DESCRIPTION="Suite of VNC servers. Based on the VNC 4 branch of TightVNC."
TERMUX_PKG_DEPENDS="gettext, libandroid-shmem, libgcrypt, libgnutls, libjpeg-turbo, perl, libpixman, libx11, libxfont2, x11-proto, xorg-server, xorg-xauth, xtrans, xorg-util-macros, libxinerama, libxdamage, libxshmfence"
TERMUX_PKG_SRCURL=https://github.com/TigerVNC/tigervnc/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=9951dab0e10f8de03996ec94bec0d938da9f36d48dca8c954e8bbc95c16338f8
TERMUX_PKG_FOLDERNAME=tigervnc-$TERMUX_PKG_VERSION
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DBUILD_VIEWER=OFF -DENABLE_NLS=OFF -DENABLE_PAM=OFF -DENABLE_GNUTLS=ON"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure () {
	mkdir -p $TERMUX_PKG_BUILDDIR/unix/xserver
	cd $TERMUX_PKG_BUILDDIR/unix/xserver

	cp -R $TERMUX_TOPDIR/xorg-server/src/* $TERMUX_PKG_BUILDDIR/unix/xserver/

	patch -p1 -i $TERMUX_PKG_SRCDIR/unix/xserver119.patch

	export ACLOCAL="aclocal -I ${TERMUX_PREFIX}/share/aclocal"
	autoreconf -fi

	CFLAGS="$CFLAGS -DFNDELAY=O_NDELAY -DINITARGS=void"
	LDFLAGS="$LDFLAGS -llog"

	./configure \
		--host="$TERMUX_HOST_PLATFORM" \
		--prefix="$TERMUX_PREFIX" \
		--disable-static \
		--disable-nls \
		--enable-debug \
		`TERMUX_PREFIX=$TERMUX_PREFIX bash $TERMUX_SCRIPTDIR/packages/xorg-server/build.sh xorg_server_flags`

	LDFLAGS="$LDFLAGS -landroid-shmem"
}

termux_step_post_make_install () {
	cd $TERMUX_PKG_BUILDDIR/unix/xserver
	make -j $TERMUX_MAKE_PROCESSES

	cd $TERMUX_PKG_BUILDDIR/unix/xserver/hw/vnc
	make install

    ## use custom variant of vncserver script
    cp -f "${TERMUX_PKG_BUILDER_DIR}/vncserver" "${TERMUX_PREFIX}/bin/vncserver"
}
