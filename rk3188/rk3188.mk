# Release name
PRODUCT_RELEASE_NAME := rk3188

# Inherit some common CM stuff.
#$(call inherit-product, vendor/aokp/config/common_mini_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/rockchip/rk3188/device_radxarock.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := NU3001
PRODUCT_NAME := AOKP_NU3001
PRODUCT_BRAND := rockchip
PRODUCT_MODEL := rk3188
PRODUCT_MANUFACTURER := rockchip
