TERMUX_PKG_HOMEPAGE=https://github.com/python-xlib/python-xlib
TERMUX_PKG_DESCRIPTION="A fully functional X client library for Python programs"
TERMUX_PKG_VERSION=0.20
TERMUX_PKG_REVISION=1
TERMUX_PKG_DEPENDS="python2, python2-six, libx11"
TERMUX_PKG_SRCURL=https://github.com/python-xlib/python-xlib/releases/download/${TERMUX_PKG_VERSION}/python-xlib-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=6c61c6424d7861fe50279e5ff574481f4a9a0ea9c79eb0191aa5f5b3d4471c30
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_PLATFORM_INDEPENDENT=yes

termux_step_make () {
	return
}

termux_step_make_install () {
    ## python2 setuptools needed
	export PYTHONPATH=$TERMUX_PREFIX/lib/python2.7/site-packages/
	python2.7 setup.py install --root="/" --prefix="${TERMUX_PREFIX}" --force
}

termux_step_post_massage () {
	find . -path '*/__pycache__*' -delete
    find . -path \*.pyc -delete
    find . -path \*.pyo -delete
}
