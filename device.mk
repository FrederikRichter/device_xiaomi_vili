#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Fingerprint
PRODUCT_PACKAGES += \
    vendor.xiaomi.hardware.fx.tunnel@1.0.vendor

# MIUI Camera
$(call inherit-product-if-exists, vendor/xiaomi/camera/miuicamera.mk)
$(call soong_config_set,camera,override_format_from_reserved,true)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Overlays-RRO
PRODUCT_PACKAGES += \
    SettingsProviderOverlayVili \
    WifiOverlayVili \
    NfcOverlayVili

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rro_overlays/config-odm.xml:$(TARGET_COPY_OUT_ODM)/overlay/config/config.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# SurfaceFlinger
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_idle_timer_ms=6000 \
    ro.surface_flinger.set_touch_timer_ms=6000 \
    ro.surface_flinger.set_display_power_timer_ms=1000

# Vibrator
$(call soong_config_set,qti_vibrator,effect_lib,libqtivibratoreffect.xiaomi)
$(call soong_config_set,qti_vibrator,use_effect_stream,true)

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/vili/vili-vendor.mk)
