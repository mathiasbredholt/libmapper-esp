get_filename_component(compat_include compat-idf/include/compat.h ABSOLUTE)
set(LIBMAPPER_SRCS libmapper/src/device.c libmapper/src/expression.c libmapper/src/graph.c libmapper/src/link.c libmapper/src/list.c libmapper/src/map.c libmapper/src/network.c libmapper/src/object.c libmapper/src/properties.c libmapper/src/router.c libmapper/src/signal.c libmapper/src/slot.c libmapper/src/table.c libmapper/src/time.c libmapper/src/value.c)
set(LIBLO_SRCS liblo/src/address.c liblo/src/blob.c liblo/src/bundle.c liblo/src/message.c liblo/src/method.c liblo/src/pattern_match.c liblo/src/send.c liblo/src/server.c liblo/src/server_thread.c liblo/src/timetag.c)
set(COMPAT_SRCS compat-idf/src/gai_strerror.c compat-idf/src/gethostname.c compat-idf/src/getnameinfo.c compat-idf/src/ifaddrs.c)
set(ZLIB_SRCS zlib/crc32.c)
idf_component_register(SRCS ${LIBMAPPER_SRCS} ${LIBLO_SRCS} ${COMPAT_SRCS} ${ZLIB_SRCS}
                       INCLUDE_DIRS compat-idf/include zlib liblo libmapper/include)
target_compile_options(${COMPONENT_LIB} PRIVATE -DHAVE_CONFIG_H -DDEBUG -include${compat_include} -w)

add_custom_command(OUTPUT liblo/config.h
                   COMMAND cp liblo_config.h liblo/config.h
                   WORKING_DIRECTORY ${COMPONENT_DIR})
add_custom_command(OUTPUT liblo/lo/lo.h
                   COMMAND cp lo.h liblo/lo/lo.h
                   WORKING_DIRECTORY ${COMPONENT_DIR})
add_custom_command(OUTPUT liblo/lo/lo_endian.h
                   COMMAND cp lo_endian.h liblo/lo/lo_endian.h
                   WORKING_DIRECTORY ${COMPONENT_DIR})
add_custom_command(OUTPUT libmapper/src/config.h
                   COMMAND cp libmapper_config.h libmapper/src/config.h
                   WORKING_DIRECTORY ${COMPONENT_DIR})

add_custom_target(libmpr_config_headers DEPENDS liblo/config.h liblo/lo/lo.h liblo/lo/lo_endian.h libmapper/src/config.h)
add_dependencies(${COMPONENT_LIB} libmpr_config_headers)
