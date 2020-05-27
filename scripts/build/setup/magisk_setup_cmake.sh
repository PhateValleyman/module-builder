mmagisk_setup_cmake() {
	local MAGISK_CMAKE_MAJORVESION=3.17
	local MAGISK_CMAKE_MINORVERSION=5
	local MAGISK_CMAKE_VERSION=$MAGISK_CMAKE_MAJORVESION.$MAGISK_CMAKE_MINORVERSION
	local MAGISK_CMAKE_TARNAME=cmake-${MAGISK_CMAKE_VERSION}-Linux-x86_64.tar.gz
	local MAGISK_CMAKE_TARFILE=$MAGISK_MODULE_TMPDIR/$MAGISK_CMAKE_TARNAME
	local MAGISK_CMAKE_FOLDER=$MAGISK_COMMON_CACHEDIR/cmake-$MAGISK_CMAKE_VERSION
	if [ ! -d "$MAGISK_CMAKE_FOLDER" ]; then
		magisk_download https://cmake.org/files/v$MAGISK_CMAKE_MAJORVESION/$MAGISK_CMAKE_TARNAME \
				"$MAGISK_CMAKE_TARFILE" \
				757e7ddd29d11422334a60d7cd9c19b7af20349a03cb15aa3c879f1b54193c95
		rm -Rf "$MAGISK_MODULE_TMPDIR/cmake-${MAGISK_CMAKE_VERSION}-Linux-x86_64"
		tar xf "$MAGISK_CMAKE_TARFILE" -C "$MAGISK_MODULE_TMPDIR"
		mv "$MAGISK_MODULE_TMPDIR/cmake-${MAGISK_CMAKE_VERSION}-Linux-x86_64" \
		   "$MAGISK_CMAKE_FOLDER"
	fi
	export PATH=$MAGISK_CMAKE_FOLDER/bin:$PATH
	export CMAKE_INSTALL_ALWAYS=1
}

magisk_setup_cmake() {
	local MAGISK_CMAKE_MAJORVESION=3.17
	local MAGISK_CMAKE_MINORVERSION=2
	local MAGISK_CMAKE_VERSION=$MAGISK_CMAKE_MAJORVESION.$MAGISK_CMAKE_MINORVERSION
	local MAGISK_CMAKE_TARNAME=cmake-${MAGISK_CMAKE_VERSION}-Linux-x86_64.tar.gz
	local MAGISK_CMAKE_TARFILE=$MAGISK_MODULE_TMPDIR/$MAGISK_CMAKE_TARNAME
	local MAGISK_CMAKE_FOLDER=$MAGISK_COMMON_CACHEDIR/cmake-$MAGISK_CMAKE_VERSION

	#if [ "$MAGISK_ON_DEVICE_BUILD" = "false" ]; then
		if [ ! -d "$MAGISK_CMAKE_FOLDER" ]; then
			magisk_download https://cmake.org/files/v$MAGISK_CMAKE_MAJORVESION/$MAGISK_CMAKE_TARNAME \
				"$MAGISK_CMAKE_TARFILE" \
				dc57f3cc448ca67fc8776b4ad4c22b087b9c6a8e459938b9622b8c7f4ef6b21e
			rm -Rf "$MAGISK_MODULE_TMPDIR/cmake-${MAGISK_CMAKE_VERSION}-Linux-x86_64"
			tar xf "$MAGISK_CMAKE_TARFILE" -C "$MAGISK_MODULE_TMPDIR"
			mv "$MAGISK_MODULE_TMPDIR/cmake-${MAGISK_CMAKE_VERSION}-Linux-x86_64" \
				"$MAGISK_CMAKE_FOLDER"
		fi

		export PATH=$MAGISK_CMAKE_FOLDER/bin:$PATH
	#else
	#	if [ "$(dpkg-query -W -f '${db:Status-Status}\n' cmake 2>/dev/null)" != "installed" ]; then
	#		echo "Package 'cmake' is not installed."
	#		echo "You can install it with"
	#		echo
	#		echo "  pkg install cmake"
	#		echo
	#		exit 1
	#	fi
	#fi

	export CMAKE_INSTALL_ALWAYS=1
}
