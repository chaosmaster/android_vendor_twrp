include vendor/twrp/config/BoardConfigKernel.mk
include vendor/twrp/config/BoardConfigSoong.mk

ifeq ($(BOARD_USES_RECOVERY_AS_BOOT),true)
    ifeq (true,$(BOARD_USES_GENERIC_KERNEL_IMAGE))
        GENERIC_KERNEL_CMDLINE += twrpfastboot=1
    else
        INTERNAL_KERNEL_CMDLINE += twrpfastboot=1
    endif
endif

