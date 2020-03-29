COMPONENT_SRCDIRS := compat_idf/src liblo/src libmapper/src zlib
COMPONENT_EXTRA_INCLUDES := $(COMPONENT_PATH)/compat_idf/include $(COMPONENT_PATH)/zlib $(COMPONENT_PATH)/liblo $(COMPONENT_PATH)/libmapper/include
CPPFLAGS += -DHAVE_CONFIG_H -include $(COMPONENT_PATH)/compat_idf/include/compat.h
