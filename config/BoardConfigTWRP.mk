include vendor/twrp/config/BoardConfigKernel.mk
include vendor/twrp/config/BoardConfigSoong.mk

ifeq ($(BOARD_USES_RECOVERY_AS_BOOT),true)
GENERIC_KERNEL_CMDLINE += twrpfastboot=1
endif


