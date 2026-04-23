#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oneplus/larry

# Release name
PRODUCT_RELEASE_NAME := larry

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# OEM Info (automatically taken from device tree path)
BOARD_VENDOR := oneplus

ENABLE_VIRTUAL_AB := true

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := larry
PRODUCT_NAME := twrp_larry
PRODUCT_BRAND := $(BOARD_VENDOR)
PRODUCT_MODEL := $(shell echo $(PRODUCT_BRAND) | tr  '[:lower:]' '[:upper:]')_$(PRODUCT_DEVICE)
PRODUCT_MANUFACTURER := $(PRODUCT_BRAND)

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

# Assert
TARGET_OTA_ASSERT_DEVICE := OP5958L1,CPH2467,CPH2465,CPH2513,CPH2515