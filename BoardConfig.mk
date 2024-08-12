#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/huawei/potter

# Inherit from kirin710-common
include device/huawei/kirin710-9-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/huawei/potter/BoardConfigVendor.mk

# Display
TARGET_SCREEN_DENSITY := 415

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# SKUs
ODM_MANIFEST_SKUS += POT-L21
ODM_MANIFEST_POT-L21_FILES := $(DEVICE_PATH)/manifest_dualsimnfc.xmlc
