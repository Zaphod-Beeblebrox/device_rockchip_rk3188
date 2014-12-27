ifeq ($(strip $(TARGET_BOARD_PLATFORM_GPU)), mali400)
LOCAL_PATH := $(call my-dir)

ifeq ($(strip $(TARGET_BOARD_PLATFORM)),rk3188)
ifeq ($(strip $(TARGET_PRODUCT)),rk3188)

ifeq ($(strip $(BOARD_USE_LCDC_COMPOSER)),true)

    include $(CLEAR_VARS)
    LOCAL_PREBUILT_LIBS := dedicated/hwcomposer.rk30board.so
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
    include $(BUILD_MULTI_PREBUILT)

    include $(CLEAR_VARS)
    LOCAL_PREBUILT_LIBS := dedicated/gralloc.rk30board.so
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
    include $(BUILD_MULTI_PREBUILT)

else
    include $(CLEAR_VARS)
    LOCAL_PREBUILT_LIBS := osmem/hwcomposer.rk30board.so
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
    include $(BUILD_MULTI_PREBUILT)

    include $(CLEAR_VARS)
    LOCAL_PREBUILT_LIBS := osmem/gralloc.rk30board.so
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
    include $(BUILD_MULTI_PREBUILT)

endif

endif
endif

endif
