ifeq (,$(wildcard $(LOCAL_PATH)/../../../AmFFmpegAdapter))
ifeq (,$(wildcard $(BOARD_AML_VENDOR_PATH)/AmFFmpegAdapter))
LOCAL_PATH := $(call my-dir)

PATH_32 := $(TARGET_OUT_VENDOR)/lib/
PATH_64 := $(TARGET_OUT_VENDOR)/lib64/

include $(CLEAR_VARS)

LOCAL_MODULE := libstagefright_soft_amsoftdec
LOCAL_MULTILIB := both
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(PATH_32)
LOCAL_MODULE_PATH_64 := $(PATH_64)
LOCAL_SRC_FILES_arm := lib/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SRC_FILES_arm64 := lib64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SHARED_LIBRARIES := libamffmpegcodec libammediaext libc++ libc libdl liblog libm \
	libstagefright_foundation libstagefright_omx libutils
LOCAL_ALLOW_UNDEFINED_SYMBOLS := true

include $(BUILD_PREBUILT)
include $(CLEAR_VARS)

LOCAL_MODULE := libstagefright_soft_av1dec
LOCAL_MULTILIB := 32
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(PATH_32)
LOCAL_SRC_FILES_arm := lib/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)

include $(BUILD_PREBUILT)

endif
endif
