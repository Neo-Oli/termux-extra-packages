TERMUX_PKG_HOMEPAGE=http://invisible-island.net/xterm/
TERMUX_PKG_DESCRIPTION="X Terminal Emulator"
TERMUX_PKG_DEPENDS="libxaw, libxft, libxkbfile, luit, ncurses, xbitmaps, xorg-fonts-lite"
TERMUX_PKG_VERSION=330
TERMUX_PKG_REVISION=3
TERMUX_PKG_SRCURL=ftp://ftp.invisible-island.net/xterm/xterm-${TERMUX_PKG_VERSION}.tgz
TERMUX_PKG_SHA256=7aeef9f29f6b95e09f481173c8c3053357bf5ffe162585647f690fd1707556df
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--disable-setuid
--disable-setgid
--disable-openpty
--disable-pty-handshake
--enable-luit
--enable-mini-luit
--with-app-defaults="${PREFIX}/share/X11/app-defaults/"
--with-x
--enable-ansi-color
--enable-88-color
--enable-256-color
--enable-broken-osc
--enable-broken-st
--enable-load-vt-fonts
--enable-wide-chars
--enable-doublechars
--enable-tcap-query
--enable-logging
--enable-dabbrev
--enable-freetype
--enable-narrowproto
--enable-exec-xterm
--enable-sixel-graphics
--enable-regis-graphics
--disable-imake
ac_cv_func_grantpt=yes
ac_cv_header_pty_h=no
cf_cv_have_utmp=no
ac_cv_path_LUIT=/data/data/com.termux/files/usr/bin/luit
"

TERMUX_PKG_RM_AFTER_INSTALL="
bin/resize
share/man/man1/resize.1
"

termux_step_pre_configure()
{
    CFLAGS+=" -DUSE_POSIX_TERMIOS=1 -DCANT_OPEN_DEV_TTY -DUSE_USG_PTYS -DHAVE_GRANTPT_PTY_ISATTY"
}

termux_step_create_debscripts () {
    ## POST INSTALL:
    echo "#!$TERMUX_PREFIX/bin/sh" > postinst
    echo "$TERMUX_PREFIX/bin/fc-cache" >> postinst
}
