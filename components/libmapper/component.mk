COMPAT_OBJS := $(patsubst $(COMPONENT_PATH)/%.c,%.o,$(wildcard $(COMPONENT_PATH)/compat_idf/src/*.c))
LIBLO_OBJS := $(patsubst $(COMPONENT_PATH)/%.c,%.o,$(wildcard $(COMPONENT_PATH)/liblo/src/*.c))
LIBMAPPER_OBJS := $(patsubst $(COMPONENT_PATH)/%.c,%.o,$(wildcard $(COMPONENT_PATH)/libmapper/src/*.c))

COMPONENT_SRCDIRS := compat_idf/src liblo/src libmapper/src zlib
COMPONENT_OBJS := $(COMPAT_OBJS) $(LIBLO_OBJS) $(LIBMAPPER_OBJS) zlib/crc32.o
COMPONENT_PRIV_INCLUDEDIRS := compat_idf/include zlib
COMPONENT_ADD_INCLUDEDIRS := libmapper/include liblo
CPPFLAGS += -DHAVE_CONFIG_H -include $(COMPONENT_PATH)/compat_idf/include/compat.h -Wno-char-subscripts -Wno-maybe-uninitialized

COMPONENT_EXTRA_CLEAN := liblo/lo/lo.h

liblo_config.o : lo.h

lo.h: $(COMPONENT_PATH)/liblo/lo/lo.h
    cd $(COMPONENT_PATH)/liblo && ./autogen.sh
