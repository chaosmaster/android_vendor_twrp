include vendor/twrp/config/BoardConfigKernel.mk
include vendor/twrp/config/BoardConfigSoong.mk

ifeq ($(BOARD_USES_RECOVERY_AS_BOOT),true)
    ifeq ($(BOARD_BOOT_HEADER_VERSION),3)
         GENERIC_KERNEL_CMDLINE += twrpfastboot=1
    else
        INTERNAL_KERNEL_CMDLINE += twrpfastboot=1
    endif
endif

