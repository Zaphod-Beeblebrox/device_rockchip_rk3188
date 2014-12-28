CUR_PATH := device/rockchip/rk3188/gps

ifeq ($(strip $(BLUETOOTH_USE_BPLUS)),true)
PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/gps/ap6xxx/gps.default.so:system/lib/hw/gps.default.so \
    device/rockchip/rk3188/gps/ap6xxx/glgps:system/bin/glgps \
    device/rockchip/rk3188/gps/ap6xxx/gpslogd:system/bin/gpslogd \
    device/rockchip/rk3188/gps/ap6xxx/gpsconfig.xml:system/etc/gps/gpsconfig.xml
endif

