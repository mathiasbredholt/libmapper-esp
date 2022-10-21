get_filename_component(compat_include compat-idf/include/compat.h ABSOLUTE)
set(LIBMAPPER_SRCS libmapper/src/device.c libmapper/src/expression.c libmapper/src/graph.c libmapper/src/link.c libmapper/src/list.c libmapper/src/map.c libmapper/src/network.c libmapper/src/object.c libmapper/src/properties.c libmapper/src/router.c libmapper/src/signal.c libmapper/src/slot.c libmapper/src/table.c libmapper/src/time.c libmapper/src/value.c)
set(LIBLO_SRCS liblo/src/address.c liblo/src/blob.c liblo/src/bundle.c liblo/src/message.c liblo/src/method.c liblo/src/pattern_match.c liblo/src/send.c liblo/src/server.c liblo/src/server_thread.c liblo/src/timetag.c)
set(COMPAT_SRCS compat-idf/src/gai_strerror.c compat-idf/src/gethostname.c compat-idf/src/getnameinfo.c compat-idf/src/ifaddrs.c)
set(ZLIB_SRCS zlib/crc32.c)
idf_component_register(SRCS ${LIBMAPPER_SRCS} ${LIBLO_SRCS} ${COMPAT_SRCS} ${ZLIB_SRCS}
                       INCLUDE_DIRS compat-idf/include zlib liblo libmapper/include .)
target_compile_options(${COMPONENT_LIB} PRIVATE -include${compat_include} -w)

target_compile_definitions(${COMPONENT_LIB} PRIVATE
  HAVE_ARPA_INET_H=1
  HAVE_DLFCN_H=1
  HAVE_ERRNO_H=1
  HAVE_FCNTL_H=1
  HAVE_GETIFADDRS=1
  HAVE_GETTIMEOFDAY=1
  HAVE_INTTYPES_H=1
  HAVE_LIBLO=1
  HAVE_LIBLO_BUNDLE_COUNT=1
  HAVE_LIBLO_SERVERS_RECV_NOBLOCK=1
  HAVE_LIBLO_SERVER_IFACE=1
  HAVE_LIBLO_SET_IFACE=1
  HAVE_LIBZ=1
  HAVE_MEMORY_H=1
  HAVE_PTHREAD=1
  HAVE_STDINT_H=1
  HAVE_STDLIB_H=1
  HAVE_STRINGS_H=1
  HAVE_STRING_H=1
  HAVE_SYS_STAT_H=1
  HAVE_SYS_TIME_H=1
  HAVE_SYS_TYPES_H=1
  HAVE_TERMIOS_H=1
  HAVE_UNISTD_H=1
  HAVE_ZLIB_H=1
  ENABLE_NETWORK_TESTS=1
  ENABLE_THREADS=1
  HAVE_INET_PTON=1
  HAVE_LIBPTHREAD=1
  HAVE_NETDB_H=1
  HAVE_NETINET_IN_H=1
  HAVE_POLL=1
  HAVE_SELECT=1
  HAVE_SETVBUF=1
  HAVE_SYS_SOCKET_H=1
  HAVE_UINTPTR_T=1
  STDC_HEADERS=1
  PACKAGE_NAME="libmapper-esp"
  PACKAGE_VERSION="1.2-155-ge732a23f"
  PRINTF_LL="ll"
)
