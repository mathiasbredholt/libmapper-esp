get_filename_component(compat_include compat_idf/include/compat.h ABSOLUTE)
idf_component_register(SRC_DIRS compat_idf/src liblo/src libmapper/src
                       SRCS zlib/crc32.c
                       INCLUDE_DIRS compat_idf/include zlib liblo libmapper/include)
target_compile_options(${COMPONENT_LIB} PRIVATE -DHAVE_CONFIG_H -include${compat_include})
