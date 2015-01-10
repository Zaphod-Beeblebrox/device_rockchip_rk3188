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

$(shell python device/rockchip/rk3188/auto_generator.py $(TARGET_DEVICE) preinstall)
$(shell python device/rockchip/rk3188/auto_generator.py $(TARGET_DEVICE) preinstall_del)
-include device/rockchip/$(TARGET_DEVICE)/preinstall/preinstall.mk
-include device/rockchip/$(TARGET_DEVICE)/preinstall_del/preinstall.mk

$(call inherit-product, build/target/product/full_base.mk)

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
    librecovery_ui_rk3188 

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
    device/rockchip/rk3188/fstab.rk30board.bootmode.unknown:root/fstab.rk30board.bootmode.unknown

# Filesystem management tools
PRODUCT_PACKAGES += \
    mke2fs \
    e2fsck \
    tune2fs \
    resize2fs \
    mkdosfs \
    genext2fs \
    mkyaffs2image

PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/audio_policy.conf:system/etc/audio_policy.conf \
    device/rockchip/rk3188/rk29-keypad.kl:system/usr/keylayout/rk29-keypad.kl

# HAL
PRODUCT_PACKAGES += \
    power.$(TARGET_BOARD_PLATFORM) \
    sensors.$(TARGET_BOARD_HARDWARE) \
    gralloc.$(TARGET_BOARD_HARDWARE) \
    hwcomposer.$(TARGET_BOARD_HARDWARE) \
    lights.$(TARGET_BOARD_HARDWARE) \
#    camera.$(TARGET_BOARD_HARDWARE) \
#    Camera \
    akmd 

# Audio
PRODUCT_PACKAGES += \
    audio_policy.$(TARGET_BOARD_HARDWARE) \
    audio.primary.$(TARGET_BOARD_HARDWARE) \
    audio.alsa_usb.$(TARGET_BOARD_HARDWARE) \
    audio.a2dp.default\
    audio.r_submix.default\
    audio.usb.default \
    alsa.default \
    alsa.audio.primary.$(TARGET_BOARD_HARDWARE)\
    alsa.audio_policy.$(TARGET_BOARD_HARDWARE) \
    acoustics.default \
    libtinyalsa \
    libasound 

# For audio-recoard 
PRODUCT_PACKAGES += \
    libsrec_jni

# For tts test
PRODUCT_PACKAGES += \
    libwebrtc_audio_coding

# GPU
include device/rockchip/rk3188/gpu/rk30xx_gpu.mk

#VPU
include device/rockchip/rk3188/vpu/rk30_vpu.mk

#WiFI
include device/rockchip/rk3188/wifi/rk30_wifi.mk

#Nand
include device/rockchip/rk3188/nand/rk30_nand.mk

#IPP
include device/rockchip/rk3188/ipp/rk29_ipp.mk

#Ion
include device/rockchip/rk3188/ion/rk30_ion.mk

#Bluetooth
ifeq ($(strip $(BOARD_HAVE_BLUETOOTH)),true)
    include device/rockchip/rk3188/bluetooth/rk30_bt.mk
endif

#GPS
include device/rockchip/rk3188/gps/rk30_gps.mk

#BIN
include device/rockchip/rk3188/bin/rk30_bin.mk

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images 

PRODUCT_PACKAGES += WifiDisplay
PRODUCT_PACKAGES += Email
PRODUCT_PACKAGES += StressTest

# uncomment the line bellow to enable phone functions
include device/rockchip/rk3188/phone/rk30_phone.mk

include device/rockchip/rk3188/features/rk-core.mk
include device/rockchip/rk3188/features/rk-camera.mk
include device/rockchip/rk3188/features/rk-camera-front.mk
include device/rockchip/rk3188/features/rk-gms.mk


#whtest for bin
PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/whtest.sh:system/bin/whtest.sh

# for preinstall
PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/preinstall_cleanup.sh:system/bin/preinstall_cleanup.sh
    
# for data clone
include device/rockchip/rk3188/data_clone/packdata.mk

#getbootmode.sh for stresstest
PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/getbootmode.sh:system/bin/getbootmode.sh \

#//*************************************************
#//* add by bonovo zbiao for android box
#//*************************************************
#PRODUCT_COPY_FILES += \
#    device/rockchip/$(TARGET_DEVICE)/newsmy_initlogo.rle:root/initlogo.rle
#    #device/rockchip/$(TARGET_DEVICE)/bootanimation.zip:system/media/bootanimation.zip 

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

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.strictmode.visual=false \
    dalvik.vm.jniopts=warnonly

PRODUCT_TAGS += dalvik.gc.type-precise

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
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml

PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/media_profiles_default.xml:system/etc/media_profiles_default.xml \
    device/rockchip/rk3188/alarm_filter.xml:system/etc/alarm_filter.xml 

PRODUCT_COPY_FILES += \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    hardware/broadcom/wlan/bcmdhd/config/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf


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
