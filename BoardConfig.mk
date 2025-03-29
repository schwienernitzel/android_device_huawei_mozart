#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/huawei/mozart

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Assert
TARGET_OTA_ASSERT_DEVICE := hi3635,mozart

# Audio
BOARD_USES_ALSA_AUDIO := true

# Binder
TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hi3635
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif

# Display
USE_OPENGL_RENDERER := true
TARGET_HARDWARE_3D := true
ANDROID_ENABLE_RENDERSCRIPT := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
SF_START_GRAPHICS_ALLOCATOR_SERVICE := true
TARGET_USES_ION := true
TARGET_USE_PAN_DISPLAY := true

# Filesystem
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_EXFAT_DRIVER := exfat
TARGET_USERIMAGES_USE_EXT4 := true

# Header
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Kernel
BOARD_KERNEL_BASE := 0x00678000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := \
    mem=3072M \
    coherent_pool=512K \
    mmcparts=mmcblk0:p1(vrl),p2(vrl_backup),p6(modemnvm_factory),p9(splash),p10(modemnvm_backup),p11(modemnvm_img),p12(modemnvm_system),p14(3rdmodemnvm),p15(3rdmodemnvmback),p17(modem_om),p20(modemnvm_update),p30(modem),p31(modem_dsp),p32(dfx),p33(3rdmodem) \
    androidboot.selinux=permissive \
    ate_enable=true

BOARD_MKBOOTIMG_ARGS := \
    --kernel_offset 0x00008000 \
    --ramdisk_offset 0x07588000 \
    --tags_offset 0xffb88000

BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_SOURCE := kernel/huawei/mozart
TARGET_KERNEL_CONFIG := lineage_mozart_defconfig

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11448352768
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE := 131072

# Platform
TARGET_BOARD_PLATFORM := hi3635
BOARD_VENDOR_PLATFORM := hi3635

# Properties
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/configs/props/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.hi3635

# SELinux
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/lib/hw/audio.primary.hi3635.so|libicuuc_shim.so \
    /system/lib64/hw/audio.primary.hi3635.so|libicuuc_shim.so \
    /system/lib/libhuaweiprocessing.so|libicuuc_shim.so \
    /system/lib/libril.so|libicuuc_shim.so \
    /system/lib64/libril.so|libicuuc_shim.so

# Vintf
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/vintf/manifest.xml
