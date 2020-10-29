LOCAL_PATH := $(call my-dir)

PATH_32 := $(TARGET_OUT)/lib/
PATH_64 := $(TARGET_OUT)/lib64/

PATH_EXTRACTORS_32 := $(TARGET_OUT)/lib/extractors
PATH_EXTRACTORS_64 := $(TARGET_OUT)/lib64/extractors

PATH_VENDOR_32 := $(TARGET_OUT_VENDOR)/lib/
PATH_VENDOR_64 := $(TARGET_OUT_VENDOR)/lib64/

SRC_PATH_32 := lib/
SRC_PATH_64 := lib64/

ifeq (,$(wildcard $(LOCAL_PATH)/../../../frameworks/av/AmFFmpegAdapter))
ifeq (,$(wildcard $(LOCAL_PATH)/../../../AmFFmpegAdapter))
include $(CLEAR_VARS)

LOCAL_MODULE := libamffmpegadapter
LOCAL_MULTILIB := both
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(PATH_32)
LOCAL_MODULE_PATH_64 := $(PATH_64)
LOCAL_SRC_FILES_arm := $(SRC_PATH_32)$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SRC_FILES_arm64 := $(SRC_PATH_64)$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SHARED_LIBRARIES := libamffmpeg libammediaext libbinder libc++ libc libcutils libdl liblog \
	libm libmediaextractor libstagefright_foundation libutils
LOCAL_CHECK_ELF_FILES := false

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := libavenhancements
LOCAL_MULTILIB := both
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(PATH_32)
LOCAL_MODULE_PATH_64 := $(PATH_64)
LOCAL_SRC_FILES_arm := $(SRC_PATH_32)$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SRC_FILES_arm64 := $(SRC_PATH_64)$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SHARED_LIBRARIES := libammediaext libbinder libc++ libc libcutils libdl liblog libm \
	libmedia_omx libmediaextractor libstagefright_foundation libstagefright_omx \
	libstagefright_xmlparser libutils
LOCAL_CHECK_ELF_FILES := false

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := libamffmpegcodec
LOCAL_MULTILIB := both
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(PATH_VENDOR_32)
LOCAL_SRC_FILES_arm := $(SRC_PATH_32)$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SHARED_LIBRARIES := libamffmpeg.vendor libammediaext libbinder libc++ libc libcutils libdl \
	liblog libm libstagefright_foundation libutils

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := libamextractor
LOCAL_MULTILIB := both
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(PATH_EXTRACTORS_32)
LOCAL_SRC_FILES_arm := $(SRC_PATH_32)$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SHARED_LIBRARIES := libbinder libc++ libc libcutils libdl liblog libm libmediaextractor \
	libstagefright_foundation libutils
LOCAL_CHECK_ELF_FILES := false

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := libmetadataretriever_ext
LOCAL_MULTILIB := 32
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(PATH_32)
LOCAL_SRC_FILES_arm := $(SRC_PATH_32)$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)

include $(BUILD_PREBUILT)

endif
endif

ifeq (,$(wildcard $(LOCAL_PATH)/../../../frameworks/av/amnuplayer))
ifeq (,$(wildcard $(LOCAL_PATH)/../../../amnuplayer))
include $(CLEAR_VARS)

LOCAL_MODULE := libamnuplayer
LOCAL_MULTILIB := 32
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(PATH_32)
LOCAL_SRC_FILES_arm := $(SRC_PATH_32)$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libwfd_hdcp_adaptor
LOCAL_MULTILIB := 32
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(PATH_32)
LOCAL_SRC_FILES_arm := $(SRC_PATH_32)$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
include $(BUILD_PREBUILT)
endif
endif

