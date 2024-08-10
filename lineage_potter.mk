@@ -0,0 +1,24 @@
#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from potter device
$(call inherit-product, device/huawei/potter/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := potter
PRODUCT_NAME := lineage_potter
PRODUCT_BRAND := HWPOT-H
PRODUCT_MODEL := POT-LX1
PRODUCT_MANUFACTURER := HUAWEI

PRODUCT_GMS_CLIENTID_BASE := android-huawei

# Use the latest approved GMS identifiers
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=POT \
    PRIVATE_BUILD_DESC="POT-L21-user 9.1.0 HUAWEIPOT-L21 314-LGRP2-OVS release-keys"

BUILD_FINGERPRINT := HUAWEI/POT-LX1/HWPOT-H:9/HUAWEIPOT-L21/314C432:user/release-keys
