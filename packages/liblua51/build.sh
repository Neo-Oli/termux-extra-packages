TERMUX_PKG_HOMEPAGE=https://www.lua.org/
TERMUX_PKG_DESCRIPTION="Shared library for the Lua interpreter (v5.1)"
TERMUX_PKG_VERSION=5.1.5
TERMUX_PKG_REVISION=3
TERMUX_PKG_SRCURL=http://www.lua.org/ftp/lua-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=2640fc56a795f29d28ef15e13c34a47e223960b0240e8cb0a82d9b0738695333
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_BUILD_DEPENDS="readline"

termux_step_configure()
{
    sed -e 's:llua:llua5.1:' -e 's:/include:/include/lua5.1:' -i etc/lua.pc
    sed -r -e '/^LUA_(SO|A|T)=/ s/lua/lua5.1/' -e '/^LUAC_T=/ s/luac/luac5.1/' -i src/Makefile
}

termux_step_make()
{
    make -j4 MYCFLAGS="${CFLAGS}" MYLDFLAGS="${LDFLAGS}" CC="${CC}" CXX="${CXX}" linux
}

termux_step_make_install()
{
    (
        cd "${TERMUX_PKG_SRCDIR}"
        make \
            TO_BIN='lua5.1 luac5.1' \
            TO_LIB="liblua5.1.a liblua5.1.so liblua5.1.so.5.1 liblua5.1.so.${TERMUX_PKG_VERSION}" \
            INSTALL_DATA='cp -d' \
            INSTALL_TOP="${TERMUX_PREFIX}" \
            INSTALL_INC="${TERMUX_PREFIX}/include/lua5.1" \
            INSTALL_MAN="${TERMUX_PREFIX}/share/man/man1" \
            install

        ${STRIP} -s "${TERMUX_PREFIX}/bin/lua5.1"
        ${STRIP} -s "${TERMUX_PREFIX}/bin/luac5.1"
        ${STRIP} --strip-unneeded "${TERMUX_PREFIX}/lib/liblua5.1.so.${TERMUX_PKG_VERSION}"
        ${TERMUX_ELF_CLEANER} "${TERMUX_PREFIX}/bin/lua5.1"
        ${TERMUX_ELF_CLEANER} "${TERMUX_PREFIX}/bin/luac5.1"
        ${TERMUX_ELF_CLEANER} "${TERMUX_PREFIX}/lib/liblua5.1.so.${TERMUX_PKG_VERSION}"
    )
}
