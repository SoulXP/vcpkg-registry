vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO SoulXP/slothsh-toolkit
    REF acd58e533c84df0ab22640439fde4237dc3b63fe
    SHA512 1e46882e418ebe9cdfaf2a26a5137b136b92c741606c8b8636af3b9fee41f2ae78bf901bf82025338540589e2822d2ce42cd550e2c9dffc9a34b6535a4b5f00b
    HEAD_REF main
    )

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright)
