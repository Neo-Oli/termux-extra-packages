TERMUX_PKG_HOMEPAGE=https://www.qemu.org
TERMUX_PKG_DESCRIPTION="A generic and open source machine emulator and virtualizer"
TERMUX_PKG_DEPENDS="glib, libandroid-support, libbz2, libcurl, libgnutls, liblzo, libnettle, libpixman, libpng, libsdl, libutil, ncurses, libssh2, libseccomp, libjpeg-turbo, libandroid-shmem"
TERMUX_PKG_VERSION=2.11.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://download.qemu.org/qemu-$TERMUX_PKG_VERSION.tar.xz
TERMUX_PKG_SHA256=c9d34a79024eae080ce3853aa9afe503824520eefb440190383003081ce7f437
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_RM_AFTER_INSTALL="
bin/qemu-ga
bin/qemu-nbd
share/man/man7/qemu-ga-ref.7
share/man/man8
"

termux_step_configure()
{
    ./configure --prefix="${TERMUX_PREFIX}" \
                --cross-prefix="${CC//clang}" \
                --cc="${CC}" \
                --host-cc="gcc" \
                --cxx="${CXX}" \
                --objcc="${CC}" \
                --extra-cflags="${CFLAGS}" \
                --extra-cxxflags="${CXXFLAGS}" \
                --extra-ldflags="${LDFLAGS} -llog" \
                --smbd="${TERMUX_PREFIX}/bin/smbd" \
                --enable-pie \
                --enable-curses \
                --enable-vnc \
                --enable-vnc-jpeg \
                --enable-vnc-png \
                --disable-mpath \
                --disable-xen \
                --enable-curl \
                --disable-kvm \
                --disable-hax \
                --disable-spice \
                --enable-lzo \
                --enable-bzip2 \
                --enable-seccomp \
                --enable-coroutine-pool \
                --enable-tpm \
                --enable-libssh2 \
                --target-list=aarch64-softmmu,arm-softmmu,i386-softmmu,x86_64-softmmu
}

termux_step_post_massage()
{
    (
        ## by default, alias 'qemu' will be a qemu-system-x86_64
        cd ${TERMUX_PKG_MASSAGEDIR}/${TERMUX_PREFIX}/bin || exit 1
        ln -sf qemu-system-x86_64 qemu
        cd ${TERMUX_PKG_MASSAGEDIR}/${TERMUX_PREFIX}/share/man/man1 || exit 1
        sed -i 's/qemu\\-system\\-i386/qemu\\-system\\-x86_64/g' qemu.1

        ## gzip manpages
        cd ${TERMUX_PKG_MASSAGEDIR}/${TERMUX_PREFIX}/share/man || exit 1
        gzip -9 $(find . -type f)

        ## symlink manpages
        cd ${TERMUX_PKG_MASSAGEDIR}/${TERMUX_PREFIX}/share/man/man1 || exit 1
        ln -sf qemu.1.gz qemu-system-aarch64.1.gz
        ln -sf qemu.1.gz qemu-system-arm.1.gz
        ln -sf qemu.1.gz qemu-system-i386.1.gz
        ln -sf qemu.1.gz qemu-system-x86_64.1.gz
    )
}
