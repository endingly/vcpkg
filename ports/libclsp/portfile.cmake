# set(VCPKG_POLICY_DLLS_WITHOUT_LIBS enabled)
# set(VCPKG_POLICY_DLLS_WITHOUT_EXPORTS enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO endingly/libclsp
    REF fb2868d51e7532068c86f3d81690496939bba243 # 2020-05-26
    SHA512 c73d7bf58818b4fda5d8b4a80d130aa276d9d9a2a0dca157b939edb92c02c9ee6922a6b9de6e15d46d1028e753c024bfd78584cfe4baea2698918a5abc6ac7ea
    HEAD_REF master
    PATCHES
        fix-rapidjson-on-windows.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()
vcpkg_copy_pdbs()

file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/lib/pkgconfig")
file(COPY_FILE "${CURRENT_PACKAGES_DIR}/share/pkgconfig/libclsp.pc" "${CURRENT_PACKAGES_DIR}/lib/pkgconfig/libclsp.pc")
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/pkgconfig")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

# file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
