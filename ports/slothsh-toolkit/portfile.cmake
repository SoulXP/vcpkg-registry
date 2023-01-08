vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO SoulXP/slothsh-toolkit
    REF 5ab4266f0038eba56856ff42fe6277646b9a9a89
    SHA512 0c7a5072ecc63fda7d444912d03c4eba5c5ea4a4e22114ba778cb80ebec98aa9a3f505108b6e6a64169e532e0f65f49544a505a16257a26934a76ce0e3d73506
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
