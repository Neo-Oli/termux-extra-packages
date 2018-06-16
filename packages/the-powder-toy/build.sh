TERMUX_PKG_HOMEPAGE=http://powdertoy.co.uk/
TERMUX_PKG_DESCRIPTION="The Powder Toy is a free physics sandbox game"
TERMUX_PKG_DEPENDS="fftw, libbz2, liblua51, libsdl, libx11"
TERMUX_PKG_VERSION=92.5
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL=https://github.com/ThePowderToy/The-Powder-Toy/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=289ba62b48230e4d3a885362fb68c26a0ac2288b21ef9d1f2764af19438403c4
TERMUX_PKG_FOLDERNAME=The-Powder-Toy-${TERMUX_PKG_VERSION}
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make()
{
    export CFLAGS="${CFLAGS} -I${TERMUX_PREFIX}/include"
    export CXXFLAGS="${CFLAGS}"
    export LDFLAGS="-L${TERMUX_PREFIX}/lib"
    scons -j4 --lin --64bit --no-sse
}

termux_step_make_install()
{
    install -Dm755 "${TERMUX_PKG_SRCDIR}/build/powder64-legacy" "${TERMUX_PREFIX}/bin/the-powder-toy"
    ln -sfr "${TERMUX_PREFIX}/bin/the-powder-toy" "${TERMUX_PREFIX}/bin/powder"
    ${TERMUX_ELF_CLEANER} "${TERMUX_PREFIX}/bin/the-powder-toy"
}
