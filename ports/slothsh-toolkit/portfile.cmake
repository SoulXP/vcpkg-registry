vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO SoulXP/slothsh-toolkit
    REF ce9864a9711400ba2e7a7b4148a521ed0aa8a47b
    SHA512 c40008ea5de1dc2dfb2cc1463fdac0a02c2036ef4afdf6ca733f53b4b117a84fde8cd5e728cb87da356ff694ad0914b7e4ae96d573e2ab4ac6aeb2e107998aae
    HEAD_REF main
    )

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DSLOTHSH_TOOLKIT_OPT_BUILD_BENCHMARKS=OFF
        -DSLOTHSH_TOOLKIT_OPT_BUILD_EXAMPLES=OFF
        -DSLOTHSH_TOOLKIT_OPT_BUILD_TESTS=OFF
        -DSLOTHSH_TOOLKIT_OPT_INSTALLL=ON
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/slothsh-toolkit PACKAGE_NAME slothsh-toolkit)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright"
     COPYONLY)
