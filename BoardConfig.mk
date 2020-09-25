#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#IMPORTANT VALUES I.G
#recovery >> /dev/block/mmcblk0p53 >> 131072
#system >> /dev/block/mmcblk0p59 >> 8388608
#vendor  >> /dev/block/mmcblk0p60 >> 2097152
#boot >> /dev/block/mmcblk0p52 >> 131072
#cache  >> /dev/block/mmcblk0p57 >> 786432
#dtbo >> /dev/block/mmcblk0p39 >> 16384
#persist >> /dev/block/mmcblk0p48 >> 65536
#userdata >> /dev/block/mmcblk0p62 >> 45866975
#ALL ABOVE VALUES ARE 32-BIT
#BELOW VALUES ARE 64-BIT
#recovery >> /dev/block/mmcblk0p53 >> 67108864
#system >> /dev/block/mmcblk0p59 >> 4294967296
#vendor  >> /dev/block/mmcblk0p60 >> 1073741824
#boot >> /dev/block/mmcblk0p52 >> 67108864
#cache  >> /dev/block/mmcblk0p57 >> 402653184
#dtbo >> /dev/block/mmcblk0p39 >> 8388608
#persist >> /dev/block/mmcblk0p48 >> 33554432
#userdata >> /dev/block/mmcblk0p62 >> 23483891200


DEVICE_PATH := device/xiaomi/olivewoodlite

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi
TARGET_CPU_VARIANT := cortex-a15

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0 androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x237 ehci-hcd.park=3 
BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7824900.sdhci androidboot.usbconfigfs=true androidboot.selinux=permissive androidboot.configfs=true
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 earlycon=msm_hsl_uart,0x78B0000 vmalloc=300M
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00008000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Platform
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8937
TARGET_BOARD_PLATFORM := msm8937

# Assert
TARGET_OTA_ASSERT_DEVICE := olivewoodlite

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4294967296
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_METADATAIMAGE_PARTITION_SIZE := 65536
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 23483891200 
#change this to 1971322880. if userdata fuckedup
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

TW_NO_EXFAT := true
TW_NO_EXFAT_FUSE := true

TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

TW_SCREEN_BLANK_ON_BOOT := false

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_EXCLUDE_TWRPAPP := true
TW_HAS_EDL_MODE := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 845
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_USES_MKE2FS := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_NTFS_3G := true
TW_NO_BATT_PERCENT := true
TWRP_EVENT_LOGGING := true

TW_INCLUDE_CRYPTO := true
TW_CRYPTO_USE_SYSTEM_VOLD := false
TARGET_HW_DISK_ENCRYPTION := false
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

#Branding
TW_DEVICE_VERSION := Aghora7

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
