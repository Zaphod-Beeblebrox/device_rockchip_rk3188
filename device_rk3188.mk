$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/rockchip/rk3188/rk3188-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/rockchip/rk3188/overlay

LOCAL_PATH := device/rockchip/rk3188

KERNEL_PATH := kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(KERNEL_PATH)/arch/arm/boot/Image
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

ifeq ($(strip $(BOARD_USE_LCDC_COMPOSER)), true)
include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.stack-trace-file=/data/anr/traces.txt \
    ro.hwui.texture_cache_size=72 \
    ro.hwui.layer_cache_size=48 \
    ro.hwui.path_cache_size=16 \
    ro.hwui.shape_cache_size=4 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.texture_cache_flush_rate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024 \
    ro.hwui.disable_scissor_opt=true \
    ro.rk.screenshot_enable=true   \
    persist.sys.ui.hw=true

else
ifeq ($(strip $(BOARD_USE_LOW_MEM)), true)
include frameworks/native/build/tablet-dalvik-heap.mk
else
include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk
endif
endif

# Recovery
PRODUCT_PACKAGES += \
    librecovery_ui_rk3188 \

PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/init.rk30board.rc:root/init.rk30board.rc \
    device/rockchip/rk3188/init.rk30board.usb.rc:root/init.rk30board.usb.rc \
    device/rockchip/rk3188/init.rk30board.bootmode.emmc.rc:root/init.rk30board.bootmode.emmc.rc \
    device/rockchip/rk3188/init.rk30board.bootmode.unknown.rc:root/init.rk30board.bootmode.unknown.rc \
    device/rockchip/rk3188/init.connectivity.rc:root/init.connectivity.rc \
    device/rockchip/rk3188/ueventd.rk30board.rc:root/ueventd.rk30board.rc \
    device/rockchip/rk3188/fstab.rk30board.bootmode.emmc:root/fstab.rk30board.bootmode.emmc \
    device/rockchip/rk3188/fstab.rk30board.bootmode.unknown:root/fstab.rk30board.bootmode.unknown \

# Filesystem management tools
PRODUCT_PACKAGES += \
    mke2fs \
    e2fsck \
    tune2fs \
    resize2fs \
    mkdosfs \
    genext2fs \
    mkyaffs2image \

PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/install-recovery.sh:system/bin/install-recovery.sh \
    device/rockchip/rk3188/audio_policy.conf:system/etc/audio_policy.conf \
    device/rockchip/rk3188/rkxx-remotectl.kl:system/usr/keylayout/rkxx-remotectl.kl \
    device/rockchip/rk3188/rk29-keypad.kl:system/usr/keylayout/rk29-keypad.kl \

# HAL
PRODUCT_PACKAGES += \
    hwcomposer.rk30board \
    power.rk3188 \

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    alsa.default \
    acoustics.default \

# Media proprietary libraries
PRODUCT_PACKAGES += \
    libvpu \
    librk_on2 \
    libjesancache \
    librkwmapro \
    libapedec \
    libffmpegvpu \
    libRKBluray \
    libffmpeg_on2 \
    libffmpeg \
    libhevcdec \
    libOMX_Core \
    libomxvpu_dec \
    libomxvpu_enc \
    libRkOMX_Resourcemanager \
    libstagefright_hdcp \
    libstagefrighthw \
    libstagefright \
    libjpeghwenc \
    libjpeghwdec \
    librkswscale \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/asound_itv.conf:system/etc/asound.conf

$(call inherit-product-if-exists, $(LOCAL_PATH)/system/alsa-lib/copy.mk)
$(call inherit-product-if-exists, $(LOCAL_PATH)/system/alsa-utils/copy.mk)

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images \

# Display
PRODUCT_PACKAGES += \
    displayd \
    WifiDisplay \

#//*************************************************
#//* add by bonovo zbiao for android box
#//*************************************************
#PRODUCT_COPY_FILES += \
#    device/rockchip/$(TARGET_PRODUCT)/newsmy_initlogo.rle:root/initlogo.rle
#    #device/rockchip/$(TARGET_PRODUCT)/bootanimation.zip:system/media/bootanimation.zip 

PRODUCT_PACKAGES += \
		blogd \
		seriald \
		BonovoAvIn \
		libbonovoavin \
		BonovoRadio \
		libradio\
		BonovoMcu\
		libbonovomcu\
		BonovoHandle \
		libbonovohandle \
		BonovoKeyEditor \
		libbonovokeyeditor \
		libbonovobluetooth \
		BonovoBluetooth \
		libbonovovin \
		BonovoVIn \
		libbonovobackdraft \
		BonovoBackDraft \
		BonovoRadar \
		BonovoAirConditioning \
		BonovoCarDoor \
		BonovoSoundBalance \
		gps.$(TARGET_BOARD_HARDWARE)

#copy widevine drm lib & jar

ifeq ($(BOARD_WIDEVINE_OEMCRYPTO_LEVEL),3)

include vendor/widevine/widevine.mk

endif

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \

PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/media_profiles_default.xml:system/etc/media_profiles_default.xml \
    device/rockchip/rk3188/media_codecs.xml:system/etc/media_codecs.xml \
    device/rockchip/rk3188/performance_info.xml:system/etc/performance_info.xml \
    device/rockchip/rk3188/packages-compat.xml:system/etc/packages-compat.xml \
    device/rockchip/rk3188/packages-composer.xml:system/etc/packages-composer.xml \

PRODUCT_COPY_FILES += \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    hardware/broadcom/wlan/bcmdhd/config/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \


$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_CHARACTERISTICS := tablet
