# config.mk
# 
# Product-specific compile-time definitions.
#


TARGET_PREBUILT_KERNEL := kernel/arch/arm/boot/Image
TARGET_BOARD_PLATFORM := rk3188
TARGET_ARCH := arm
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
TARGET_NO_BOOTLOADER := true

TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
TARGET_ROCHCHIP_RECOVERY := true
TARGET_RECOVERY_UI_LIB := librecovery_ui_${TARGET_PRODUCT}
RECOVERY_BOARD_ID := false
RECOVERY_UPDATEIMG_RSA_CHECK := false

TARGET_PROVIDES_INIT_RC := true

BOARD_USE_LOW_MEM := false
BOARD_USE_LCDC_COMPOSER := false

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_EGL_CFG := vendor/rockchip/rk3188/proprietary/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true

BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_CODEC_ITV := true

BOARD_CONNECTIVITY_VENDOR := Broadcom
BOARD_CONNECTIVITY_MODULE := ap6xxx

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
BLUETOOTH_HCI_USE_RTK_H5 := true

# google apps
BUILD_WITH_GOOGLE_MARKET := true

# sensors
BOARD_SENSOR_ST := true

# CAMERA SUPPORT
USE_CAMERA_STUB := true

#phone pad codec list
BOARD_CODEC_WM8994 := false
BOARD_CODEC_RT5625_SPK_FROM_SPKOUT := false
BOARD_CODEC_RT5625_SPK_FROM_HPOUT := false
BOARD_CODEC_RT3261 := false
BOARD_CODEC_RT3224 := true
BOARD_CODEC_RT5631 := false
BOARD_CODEC_RK616 := false

#if set to true m-user would be disabled and UMS enabled, if set to disable UMS would be disabled and m-user enabled
BUILD_WITH_UMS := true

# for update nand 2.1
NAND_UPDATE :=true

# define tablet support NTFS 
BOARD_IS_SUPPORT_NTFS := true

# product has GPS or not
BOARD_HAS_GPS := true

# ethernet
BOARD_HAS_ETHERNET := true

# manifest
SYSTEM_WITH_MANIFEST := false

# multi usb partitions
BUILD_WITH_MULTI_USB_PARTITIONS := true

# no battery
BUILD_WITHOUT_BATTERY := true

#for widevine drm
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

# for tablet encryption
BUILD_WITH_CRYPTO := false
