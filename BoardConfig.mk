USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/rockchip/rk3188/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := rk3188
TARGET_BOARD_HARDWARE := rk30board
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM_GPU := mali400
TARGET_EXTRA_CFLAGS += $(call cc-option,-mtune=cortex-a9,$(call cc-option,-mtune=cortex-a8)) $(call cc-option,-mcpu=cortex-a9,$(call cc-option,-mcpu=cortex-a8))

TARGET_BOOTLOADER_BOARD_NAME := rk3188

BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x60400000
BOARD_KERNEL_PAGESIZE := 16384

BOARD_USE_LOW_MEM := false
BOARD_USE_LCDC_COMPOSER := false

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_NO_RECOVERY := false
TARGET_ROCHCHIP_RECOVERY := true
TARGET_RECOVERY_UI_LIB := librecovery_ui_${TARGET_PRODUCT}
RECOVERY_BOARD_ID := false
RECOVERY_UPDATEIMG_RSA_CHECK := false

BOARD_EGL_CFG := vendor/rockchip/rk3188/proprietary/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true

#for widevine drm
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

BOARD_USES_GENERIC_AUDIO ?= true
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_CODEC_ITV := true

BOARD_CONNECTIVITY_VENDOR := Broadcom
BOARD_CONNECTIVITY_MODULE := ap6xxx

FORCE_WIFI_WORK_AS_ANDROID4_2 := false
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/etc/firmware/fw_bcm4329_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcm4329_apsta.bin"

BOARD_HAVE_BLUETOOTH        := true
BLUETOOTH_USE_BPLUS         := false
BOARD_HAVE_BLUETOOTH_BCM    := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/rockchip/rk3188/bluetooth
BLUETOOTH_HCI_USE_RTK_H5 ?= true
