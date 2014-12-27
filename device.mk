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
    device/rockchip/rk3188/install-recovery.sh:system/bin/install-recovery.sh \
    device/rockchip/rk3188/audio_policy.conf:system/etc/audio_policy.conf \
    device/rockchip/rk3188/rkxx-remotectl.kl:system/usr/keylayout/rkxx-remotectl.kl \
    device/rockchip/rk3188/rk29-keypad.kl:system/usr/keylayout/rk29-keypad.kl \
    device/rockchip/rk3188/bin/io:system/xbin/io \
    device/rockchip/rk3188/bin/mkdosfs:root/sbin/mkdosfs \
    device/rockchip/rk3188/bin/busybox:/system/bin/busybox

# HAL
PRODUCT_PACKAGES += \
    power.$(TARGET_BOARD_PLATFORM) \
    sensors.$(TARGET_BOARD_HARDWARE) \
    gralloc.$(TARGET_BOARD_HARDWARE) \
    hwcomposer.$(TARGET_BOARD_HARDWARE) \
    lights.$(TARGET_BOARD_HARDWARE) \
    camera.$(TARGET_BOARD_HARDWARE) \
    Camera \
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

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/asound_itv.conf:system/etc/asound.conf

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
    librkswscale 

# GPU
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcdc_composer=0
PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/gpu/libmali_smp/libMali.so:system/lib/libMali.so \
    device/rockchip/rk3188/gpu/libmali_smp/libMali.so:obj/lib/libMali.so \
    device/rockchip/rk3188/gpu/libmali_smp/libUMP.so:system/lib/libUMP.so \
    device/rockchip/rk3188/gpu/libmali_smp/libUMP.so:obj/lib/libUMP.so \
    device/rockchip/rk3188/gpu/libmali_smp/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
    device/rockchip/rk3188/gpu/libmali_smp/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
    device/rockchip/rk3188/gpu/libmali_smp/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so \
    device/rockchip/rk3188/gpu/libmali_smp/osmem/mali.ko.3.0.36+:system/lib/modules/mali.ko.3.0.36+ \
    device/rockchip/rk3188/gpu/libmali_smp/osmem/mali.ko:system/lib/modules/mali.ko \
    device/rockchip/rk3188/gpu/libmali_smp/osmem/ump.ko.3.0.36+:system/lib/modules/ump.ko.3.0.36+ \
    device/rockchip/rk3188/gpu/libmali_smp/osmem/ump.ko:system/lib/modules/ump.ko \
    device/rockchip/rk3188/gpu/gpu_performance/performance_info.xml:system/etc/performance_info.xml \
    device/rockchip/rk3188/gpu/gpu_performance/packages-compat.xml:system/etc/packages-compat.xml \
    device/rockchip/rk3188/gpu/gpu_performance/packages-composer.xml:system/etc/packages-composer.xml \
    device/rockchip/rk3188/gpu/gpu_performance/performance:system/bin/performance \
    device/rockchip/rk3188/gpu/gpu_performance/libperformance_runtime.so:system/lib/libperformance_runtime.so \
    device/rockchip/rk3188/gpu/gpu_performance/gpu.$(TARGET_BOARD_HARDWARE).so:system/lib/hw/gpu.$(TARGET_BOARD_HARDWARE).so

#VPU
CUR_PATH := device/rockchip/rk3188/vpu
sf_lib_files := $(shell ls $(CUR_PATH)/lib | grep .so)
PRODUCT_COPY_FILES += \
       $(foreach file, $(sf_lib_files), $(CUR_PATH)/lib/$(file):system/lib/$(file))

PRODUCT_COPY_FILES += \
       $(foreach file, $(sf_lib_files), $(CUR_PATH)/lib/$(file):obj/lib/$(file))

PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/vpu/lib/media_codecs.xml:system/etc/media_codecs.xml \
    device/rockchip/rk3188/vpu/lib/modules_smp/vpu_service.ko.3.0.36+:system/lib/modules/vpu_service.ko.3.0.36+ \
    device/rockchip/rk3188/vpu/lib/modules_smp/vpu_service.ko:system/lib/modules/vpu_service.ko\
    device/rockchip/rk3188/vpu/lib/modules_smp/rk30_mirroring.ko.3.0.8+:system/lib/modules/rk30_mirroring.ko.3.0.8+\
    device/rockchip/rk3188/vpu/lib/modules_smp/rk30_mirroring.ko.3.0.36+:system/lib/modules/rk30_mirroring.ko.3.0.36+ 

PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/vpu/lib/wfd:system/bin/wfd

PRODUCT_PACKAGES += \
	libyuvtorgb     

#WiFI
PRODUCT_COPY_FILES += \
	device/rockchip/rk3188/wifi/lib/modules_smp/wlan.ko:system/lib/modules/wlan.ko \
	device/rockchip/rk3188/wifi/lib/modules_smp/rkwifi.ko:system/lib/modules/rkwifi.ko \
	device/rockchip/rk3188/wifi/lib/modules_smp/rkwifi.oob.ko:system/lib/modules/rkwifi.oob.ko \
	device/rockchip/rk3188/wifi/lib/modules_smp/8188eu.ko:system/lib/modules/8188eu.ko \
	device/rockchip/rk3188/wifi/lib/modules_smp/8192cu.ko:system/lib/modules/8192cu.ko \
	device/rockchip/rk3188/wifi/lib/modules_smp/mt5931.ko:system/lib/modules/mt5931.ko \
        device/rockchip/rk3188/wifi/lib/modules_smp/8723as.ko:system/lib/modules/8723as.ko \
	device/rockchip/rk3188/wifi/lib/modules_smp/8723au.ko:system/lib/modules/8723au.ko \
	device/rockchip/rk3188/wifi/lib/modules_smp/8189es.ko:system/lib/modules/8189es.ko \
	device/rockchip/rk3188/wifi/lib/modules_smp/mt7601sta.ko:system/lib/modules/mt7601sta.ko \
	device/rockchip/rk3188/wifi/lib/modules_smp/mt7601ap.ko:system/lib/modules/mt7601ap.ko \
	device/rockchip/rk3188/wifi/lib/modules_smp/mtprealloc7601Usta.ko:system/lib/modules/mtprealloc7601Usta.ko \
	device/rockchip/rk3188/wifi/lib/modules_smp/esp8089.ko:system/lib/modules/esp8089.ko \
        device/rockchip/rk3188/wifi/lib/init_data.conf:system/lib/modules/init_data.conf \
	device/rockchip/rk3188/wifi/lib/esp_init_data.bin:system/lib/modules/esp_init_data.bin \
	device/rockchip/rk3188/wifi/lib/esp_supplicant:system/bin/esp_supplicant \
	device/rockchip/rk3188/wifi/lib/esp_hostapd:system/bin/esp_hostapd \
	device/rockchip/rk3188/wifi/lib/bcm_supplicant:system/bin/bcm_supplicant \
	device/rockchip/rk3188/wifi/lib/rtl_supplicant:system/bin/rtl_supplicant \
	device/rockchip/rk3188/wifi/lib/rtl_hostapd:system/bin/rtl_hostapd \
        device/rockchip/rk3188/wifi/mt5931/wpa_supplicant/wpa_supplicant:system/bin/wpa_supplicant_mt5931 \
        device/rockchip/rk3188/wifi/mt5931/wpa_supplicant/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant_mt5931.conf \
        device/rockchip/rk3188/wifi/mt5931/wpa_supplicant/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant_mt5931.conf

#Nand
ifeq ($(strip $(NAND_UPDATE)),true)
   PRODUCT_COPY_FILES += \
	device/rockchip/rk3188/nand/lib/update/rk30xxnand_ko.ko.3.0.36+:root/rk30xxnand_ko.ko.3.0.36+ \
	device/rockchip/rk3188/nand/lib/update/rk30xxnand_ko.ko.3.0.8+:root/rk30xxnand_ko.ko.3.0.8+ \
        device/rockchip/rk3188/nand/lib/drmboot.ko:root/drmboot.ko
else
   PRODUCT_COPY_FILES += \
        device/rockchip/rk3188/nand/lib/rk30xxnand_ko.ko.3.0.36+:root/rk30xxnand_ko.ko.3.0.36+ \
	device/rockchip/rk3188/nand/lib/rk30xxnand_ko.ko.3.0.8+:root/rk30xxnand_ko.ko.3.0.8+ \
	device/rockchip/rk3188/nand/lib/drmboot.ko:root/drmboot.ko
endif

#IPP
PRODUCT_COPY_FILES += \
	device/rockchip/rk3188/ipp/lib/rk29-ipp.ko.3.0.36+:system/lib/modules/rk29-ipp.ko.3.0.36+ \
	device/rockchip/rk3188/ipp/lib/rk29-ipp.ko:system/lib/modules/rk29-ipp.ko

#Ion
PRODUCT_COPY_FILES += \
	device/rockchip/rk3188/ion/lib/libion.so:system/lib/libion.so \
	device/rockchip/rk3188/ion/lib/libion.so:obj/lib/libion.so 

#Bluetooth
CUR_PATH := device/rockchip/rk3188/bluetooth
BT_FIRMWARE_FILES := $(shell ls $(CUR_PATH)/lib/firmware)
PRODUCT_COPY_FILES += \
    $(foreach file, $(BT_FIRMWARE_FILES), $(CUR_PATH)/lib/firmware/$(file):system/vendor/firmware/$(file))

include device/rockchip/rk3188/bluetooth/console_start_bt/console_start_bt.mk

#GPS

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images 

# Display
PRODUCT_PACKAGES += \
    displayd \
    WifiDisplay 

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
    device/rockchip/rk3188/media_codecs.xml:system/etc/media_codecs.xml \
    device/rockchip/rk3188/performance_info.xml:system/etc/performance_info.xml \
    device/rockchip/rk3188/packages-compat.xml:system/etc/packages-compat.xml \
    device/rockchip/rk3188/packages-composer.xml:system/etc/packages-composer.xml

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
