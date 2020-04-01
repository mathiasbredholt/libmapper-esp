if(NOT EXISTS "${COMPONENT_DIR}/liblo/config.h")
    message(STATUS "Configuring liblo...")
    execute_process(COMMAND "./autogen.sh"
                    WORKING_DIRECTORY "${COMPONENT_DIR}/liblo")

endif()
if(NOT EXISTS "${COMPONENT_DIR}/libmapper/src/config.h")
    message(STATUS "Configuring libmapper...")
    execute_process(COMMAND "./autogen.sh"
                    WORKING_DIRECTORY "${COMPONENT_DIR}/libmapper")
endif()
get_filename_component(compat_include compat_idf/include/compat.h ABSOLUTE)
idf_component_register(SRCS compat_idf/src/gai_strerror.c compat_idf/src/gethostname.c compat_idf/src/getnameinfo.c compat_idf/src/ifaddrs.c liblo/src/address.c liblo/src/blob.c liblo/src/bundle.c liblo/src/message.c liblo/src/method.c liblo/src/pattern_match.c liblo/src/send.c liblo/src/server.c liblo/src/server_thread.c liblo/src/timetag.c libmapper/src/device.c libmapper/src/expression.c libmapper/src/link.c libmapper/src/list.c libmapper/src/map.c libmapper/src/network.c libmapper/src/object.c libmapper/src/properties.c libmapper/src/router.c libmapper/src/signal.c libmapper/src/slot.c libmapper/src/table.c zlib/crc32.c
                       INCLUDE_DIRS compat_idf/include zlib liblo libmapper/include)
target_compile_options(${COMPONENT_LIB} PRIVATE -DHAVE_CONFIG_H -include${compat_include} -w)
