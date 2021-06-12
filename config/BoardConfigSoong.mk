PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += twrpVarsPlugin

SOONG_CONFIG_twrpVarsPlugin :=

define addVar
  SOONG_CONFIG_twrpVarsPlugin += $(1)
  SOONG_CONFIG_twrpVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += twrpGlobalVars
SOONG_CONFIG_twrpGlobalVars += \
    target_enforce_ab_ota_partition_list \
    target_init_vendor_lib

# Soong bool variables
SOONG_CONFIG_twrpGlobalVars_target_enforce_ab_ota_partition_list := $(TARGET_ENFORCE_AB_OTA_PARTITION_LIST)

# Set default values
TARGET_INIT_VENDOR_LIB ?= vendor_init

# Soong value variables
SOONG_CONFIG_twrpGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
