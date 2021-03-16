magisk_step_configure_cmake() {
	magisk_setup_cmake

	local BUILD_TYPE=Release
	[ "$MAGISK_DEBUG" = "true" ] && BUILD_TYPE=Debug

	local CMAKE_PROC=$MAGISK_ARCH
	test $CMAKE_PROC == "arm" && CMAKE_PROC='armv7-a'
	local MAKE_PROGRAM_PATH
	if [ "$MAGISK_CMAKE_BUILD" = Ninja ]; then
		magisk_setup_ninja
		MAKE_PROGRAM_PATH=$(command -v ninja)
	else
		MAKE_PROGRAM_PATH=$(command -v make)
	fi

	local CMAKE_ADDITIONAL_ARGS=()
	CXXFLAGS+=" --target=$CCMAGISK_HOST_PLATFORM"
	CFLAGS+=" --target=$CCMAGISK_HOST_PLATFORM -static"
	LDFLAGS+=" --target=$CCMAGISK_HOST_PLATFORM -static"

	CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_CROSSCOMPILING=True")
	CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_LINKER=$MAGISK_STANDALONE_TOOLCHAIN/bin/$LD $LDFLAGS")
	CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_SYSTEM_NAME=Android")
	CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_SYSTEM_VERSION=$MAGISK_MODULE_API_LEVEL")
	CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_SYSTEM_PROCESSOR=$CMAKE_PROC")
	CMAKE_ADDITIONAL_ARGS+=("-DCMAKE_ANDROID_STANDALONE_TOOLCHAIN=$MAGISK_STANDALONE_TOOLCHAIN")

	# XXX: CMAKE_{AR,RANLIB} needed for at least jsoncpp build to not
	# pick up cross compiled binutils tool in $MAGISK_PREFIX/bin:
	cmake -G "$MAGISK_CMAKE_BUILD" "$MAGISK_MODULE_SRCDIR" \
		-DCMAKE_AR="$(command -v $AR)" \
		-DCMAKE_UNAME="$(command -v uname)" \
		-DCMAKE_RANLIB="$(command -v $RANLIB)" \
		-DCMAKE_BUILD_TYPE=$BUILD_TYPE \
		-DCMAKE_C_FLAGS="$CFLAGS $CPPFLAGS" \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS $CPPFLAGS" \
		-DCMAKE_FIND_ROOT_PATH=$MAGISK_PREFIX \
		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER \
		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
		-DCMAKE_INSTALL_PREFIX=$MAGISK_PREFIX \
		-DCMAKE_MAKE_PROGRAM=$MAKE_PROGRAM_PATH \
		-DCMAKE_SKIP_INSTALL_RPATH=ON \
		-DCMAKE_USE_SYSTEM_LIBRARIES=True \
		-DDOXYGEN_EXECUTABLE= \
		-DBUILD_TESTING=OFF \
		"${CMAKE_ADDITIONAL_ARGS[@]}" \
		$MAGISK_MODULE_EXTRA_CONFIGURE_ARGS
}
