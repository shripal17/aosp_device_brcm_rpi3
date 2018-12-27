# USE_OEM_TV_APP := true
# $(call inherit-product, device/google/atv/products/atv_base.mk)

GAPPS_VARIANT := pico

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
# $(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults.mk)
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)

GAPPS_FORCE_PACKAGE_OVERRIDES := true
WITH_DEXPREOPT := true
GAPPS_EXCLUDED_PACKAGES := GooglePackageInstaller SetupWizard
GAPPS_PRODUCT_PACKAGES := YouTube

PRODUCT_NAME := rpi3
PRODUCT_DEVICE := rpi3
PRODUCT_BRAND := TechOnTouch
PRODUCT_MODEL := MediaOnTouch
PRODUCT_MANUFACTURER := brcm

# include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120 \
    ro.opengles.version=131072 \
    ro.adb.secure=0 \
    ethernet.interface=eth0 \
    wifi.interface=wlan0

# application packages
PRODUCT_PACKAGES += \
    Launcher3 \
    su \
    Browser \
    Settings

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# system packages
PRODUCT_PACKAGES += \
    libGLES_mesa \
    gralloc.rpi3 \
    hwcomposer.rpi3 \
    audio.primary.rpi3 \
    audio.usb.default \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

# hardware/interfaces
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.keymaster@3.0-impl \
    android.hardware.memtrack@1.0-impl

# system configurations
PRODUCT_COPY_FILES := \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    $(LOCAL_PATH)/manifest.xml:system/vendor/manifest.xml \
    $(LOCAL_PATH)/rpi3_core_hardware.xml:system/etc/permissions/rpi3_core_hardware.xml \
    $(LOCAL_PATH)/init.rpi3.rc:root/init.rpi3.rc \
    $(LOCAL_PATH)/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/ueventd.rpi3.rc:root/ueventd.rpi3.rc \
    $(LOCAL_PATH)/fstab.rpi3:root/fstab.rpi3 \
    $(LOCAL_PATH)/Generic.kl:system/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/firmware/brcm/BCM43430A1.hcd:root/lib/firmware/brcm/BCM43430A1.hcd \
    $(LOCAL_PATH)/firmware/brcm/BCM434345C0.hcd:root/lib/firmware/brcm/BCM4345C0.hcd \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43430-sdio.bin:root/lib/firmware/brcm/brcmfmac43430-sdio.bin \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43430-sdio.txt:root/lib/firmware/brcm/brcmfmac43430-sdio.txt \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43455-sdio.bin:root/lib/firmware/brcm/brcmfmac43455-sdio.bin \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43455-sdio.txt:root/lib/firmware/brcm/brcmfmac43455-sdio.txt \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43455-sdio.clm_blob:root/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
    $(PRODUCT_COPY_FILES)

# media configurations
PRODUCT_COPY_FILES := \
    device/generic/goldfish/camera/media_profiles.xml:system/etc/media_profiles.xml \
    device/generic/goldfish/camera/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \
    device/brcm/rpi3/bootanimation.zip:/system/media/bootanimation.zip \
    $(LOCAL_PATH)/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    $(PRODUCT_COPY_FILES)

DEVICE_PACKAGE_OVERLAYS := device/brcm/rpi3/overlay
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_LOCALES := en_US,ko_KR,ja_JP,zh_CN,hi_IN,en_GB,de_DE,fr_FR,it_IT,ru_RU,es_ES,pt_PT,nl_BE,nl_NL
