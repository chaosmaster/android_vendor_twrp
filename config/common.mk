PRODUCT_BRAND ?= twrp

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1 \
    persist.sys.disable_rescue=true

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES  += ro.adb.secure=1
endif

# Additional packages
-include vendor/twrp/config/packages.mk

PRODUCT_EXTRA_RECOVERY_KEYS := \
    vendor/twrp/build/target/product/security/lineage

