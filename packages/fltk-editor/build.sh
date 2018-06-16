TERMUX_PKG_DESCRIPTION="Simple text editor"
TERMUX_PKG_DEPENDS="fltk"
TERMUX_PKG_VERSION=1.0-termux
TERMUX_PKG_REVISION=2

termux_step_make()
{
    "${CXX}" ${CXXFLAGS} -I"${TERMUX_PREFIX}/include" "${TERMUX_PKG_BUILDER_DIR}/fltk-editor.cxx" -o fltk-editor ${LDFLAGS} -lfltk
}

termux_step_make_install()
{
    mkdir -p "${TERMUX_PREFIX}/bin"
    cp -f fltk-editor "${TERMUX_PREFIX}/bin/fltk-editor"
}
