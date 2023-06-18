TERMUX_PKG_HOMEPAGE=https://github.com/folkertvanheusden/HTTPing
TERMUX_PKG_DESCRIPTION="ping-like program for http-requests"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.9
TERMUX_PKG_SRCURL=https://github.com/folkertvanheusden/HTTPing/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=37da3c89b917611d2ff81e2f6c9e9de39d160ef0ca2cb6ffec0bebcb9b45ef5d
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_DEPENDS="fftw, libandroid-support, ncurses, openssl"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-fftw3 --with-ncurses --with-openssl"
