#
# Copyright (C) 2023 The Evolution X Project
# SPDX-License-Identifier: Apache-2.0
#

ifneq ($(filter sailfish marlin walleye taimen blueline crosshatch sargo bonito flame coral sunfish bramble redfin barbet oriole raven bluejay panther cheetah lynx tangorpro felix shiba husky akita tokay caiman komodo comet frankel blazer mustang, $(LINEAGE_BUILD)),)

# Do not include ROM side face unlock
TARGET_FACE_UNLOCK_SUPPORTED := false

# Face unlock
PRODUCT_PACKAGES += \
    SettingsGoogleFutureFaceEnroll

# Overlay
ifneq ($(TARGET_GOOGLE_FACE_UNLOCK),true)
DEVICE_PACKAGE_OVERLAYS += vendor/google/faceunlock/overlay
endif

# Runtime resource overlays
ifneq ($(TARGET_GOOGLE_FACE_UNLOCK),true)
PRODUCT_PACKAGES += \
    FaceEnrollOverlay \
    FaceEnrollSettingsOverlay
     
endif

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.biometrics.face.xml


# Sepolicy
ifneq ($(TARGET_GOOGLE_FACE_UNLOCK),true)
BOARD_SEPOLICY_DIRS += vendor/google/faceunlock/sepolicy
endif
endif
