MAGISK_MODULE_HOMEPAGE=https://libcxx.llvm.org/
MAGISK_MODULE_DESCRIPTION="C++ Standard Library"
MAGISK_MODULE_LICENSE="NCSA"
MAGISK_MODULE_VERSION=$MAGISK_NDK_VERSION
MAGISK_MODULE_ESSENTIAL=yes
MAGISK_PKG_SKIP_SRC_EXTRACT=true
magisk_step_post_make_install() {
	#ls -la "$MAGISK_STANDALONE_TOOLCHAIN/sysroot/usr/lib/${MAGISK_HOST_PLATFORM}/"
	#cp "$MAGISK_STANDALONE_TOOLCHAIN/sysroot/usr/lib/${MAGISK_HOST_PLATFORM}/libc++_shared.so" $MAGISK_PREFIX/lib
	cp "$MAGISK_STANDALONE_TOOLCHAIN/sysroot/usr/lib/${MAGISK_HOST_PLATFORM}/libc++_static.a" $MAGISK_PREFIX/lib
}
