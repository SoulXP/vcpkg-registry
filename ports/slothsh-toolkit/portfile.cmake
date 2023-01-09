vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO SoulXP/slothsh-toolkit
    REF 0ede2b9a39ac048b83c9bc8c581ef57eb9ba99e2
    SHA512 0
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
vcpkg_cmake_config_fixup(PACKAGE_NAME slothshtoolkit)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

file(INSTALL "${SOURCE_PATH}/LICENSE"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright)
