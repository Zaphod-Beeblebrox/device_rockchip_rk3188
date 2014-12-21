# Inherit some common AOKP stuff.
$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

# Inherit device configuration
$(call inherit-product, device/rockchip/rk3188/device.mk)
include device/rockchip/rk3188/BoardConfig.mk

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := NU3001
PRODUCT_NAME := AOKP_NU3001
PRODUCT_BRAND := Newsmy
PRODUCT_MODEL := CarPad-II-P
PRODUCT_MANUFACTURER := Newsmy
# Release name
PRODUCT_RELEASE_NAME := AOKP_NU3001

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.version = 0.0.1 \
