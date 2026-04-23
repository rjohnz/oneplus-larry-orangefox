#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Configure gsi_keys.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Configure Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Configure virtual_ab compression.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Configure SDCard replacement functionality
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure full_base_telephony.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Configure twrp common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# A/B
AB_OTA_UPDATER:= true

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vbmeta_vendor \
    vendor_boot \
    vendor_dlkm

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Boot control HAL
PRODUCT_PACKAGES += \
    bootctrl.holi.recovery \
    android.hardware.boot@1.1-impl-qti.recovery 

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# qcom decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# tzdata
PRODUCT_PACKAGES_ENG += \
    tzdata_twrp

# API
PRODUCT_SHIPPING_API_LEVEL  := 30
PRODUCT_TARGET_VNDK_VERSION := 31

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# OTA certs
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/local_OTA \
    $(LOCAL_PATH)/security/special_OTA

# Display Size & Density
TARGET_SCREEN_HEIGHT  := 2400
TARGET_SCREEN_DENSITY := 450
TARGET_SCREEN_WIDTH   := 1080

# Crypto
BOARD_USES_QCOM_FBE_DECRYPTION  := true
PLATFORM_VERSION                := 99.87.36
PLATFORM_VERSION_LAST_STABLE    := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH         := 2099-12-31
VENDOR_SECURITY_PATCH           := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH             := $(PLATFORM_SECURITY_PATCH)
TW_INCLUDE_CRYPTO               := true
TW_INCLUDE_CRYPTO_FBE           := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY           := 2

# Soong Namespaces : Qcom commonsys Display
PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display

# Misc.
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hidl.allocator@1.0 \
    android.hidl.memory@1.0 \
    android.hidl.memory.token@1.0 \
    libdmabufheap \
    libhidlmemory \
    libion \
    libnetutils \
    libdebuggerd_client \
    libdisplayconfig.qti \
    vendor.display.config@1.0 \
    vendor.display.config@2.0 
   
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.allocator@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory.token@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdebuggerd_client.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so



 

