MAGISK_MODULE_HOMEPAGE=https://www.pcre.org
MAGISK_MODULE_DESCRIPTION="Perl 5 compatible regular expression library"
MAGISK_MODULE_LICENSE="BSD 3-Clause"
MAGISK_MODULE_VERSION=10.33
MAGISK_MODULE_SHA256=35514dff0ccdf02b55bd2e9fa586a1b9d01f62332c3356e379eabb75f789d8aa
MAGISK_MODULE_SRCURL=https://ftp.pcre.org/pub/pcre/pcre2-${MAGISK_MODULE_VERSION}.tar.bz2
MAGISK_MODULE_INCLUDE_IN_DEVPACKAGE="bin/pcre2-config"
MAGISK_MODULE_RM_AFTER_INSTALL="
bin/pcre2grep
bin/pcre2test
share/man/man1/pcre2*.1
lib/libpcre2-posix.so
"
MAGISK_MODULE_EXTRA_CONFIGURE_ARGS="
--enable-jit
--enable-pcre2-16
--enable-pcre2-32
"
