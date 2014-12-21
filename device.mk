# Copyright (C) 2011 rockchip Limited
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Everything in this directory will become public


$(call inherit-product, build/target/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/rockchip/rk3188/rk3188-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/rockchip/rk3188/overlay

LOCAL_PATH := device/rockchip/rk3188



PRODUCT_AAPT_CONFIG += large

########################################################
# Kernel
########################################################
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel


include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk


# Recovery
PRODUCT_PACKAGES += \
    librecovery_ui_rk3188 \

PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/init.rc:root/init.rc \
    device/rockchip/rk3188/init.environ.rc:root/init.environ.rc \
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

########################################################
# Google applications
########################################################
ifeq ($(strip $(BUILD_WITH_GOOGLE_MARKET)),true)
PRODUCT_GOOGLE_PREBUILT_MODULES :=
include vendor/google/gapps_kk_mini.mk
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


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_CHARACTERISTICS := tablet

########################################################
# build with drmservice
########################################################
ifeq ($(strip $(BUILD_WITH_DRMSERVICE)),true)
	PRODUCT_PACKAGES += \
	               drmservice
endif



########################################################
# this product has GPS or not
########################################################
ifeq ($(strip $(BOARD_HAS_GPS)),true)
	PRODUCT_PROPERTY_OVERRIDES += \
		ro.factory.hasGPS=true
else
	PRODUCT_PROPERTY_OVERRIDES += \
                ro.factory.hasGPS=false
endif

########################################################
# this product has Ethernet or not
########################################################
ifneq ($(strip $(BOARD_HS_ETHERNET)),true)
    PRODUCT_PROPERTY_OVERRIDES += ro.rk.ethernet_enable=false
endif

#######################################################
#build system support ntfs?
########################################################
ifeq ($(strip $(BOARD_IS_SUPPORT_NTFS)),true)
     PRODUCT_PROPERTY_OVERRIDES += \
         ro.factory.storage_suppntfs=true
else
     PRODUCT_PROPERTY_OVERRIDES += \
         ro.factory.storage_suppntfs=false
endif

########################################################
# build without battery
########################################################
ifeq ($(strip $(BUILD_WITHOUT_BATTERY)),true)
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.factory.without_battery=true
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.factory.without_battery=false
endif
 
# NTFS support
PRODUCT_PACKAGES += \
    ntfs-3g

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Copy manifest to system/
ifeq ($(strip $(SYSTEM_WITH_MANIFEST)),true)
    PRODUCT_COPY_FILES += \
        manifest.xml:system/manifest.xml
endif

# Copy init.usbstorage.rc to root
ifeq ($(strip $(BUILD_WITH_MULTI_USB_PARTITIONS)),true)
    PRODUCT_COPY_FILES += \
        device/rockchip/rk3188/init.usbstorage.rc:root/init.usbstorage.rc
endif
