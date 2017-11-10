CLASSIC_BIN_OUTPUT=neuroon_classic.bin
OPEN_DEPRECATED_BIN_OUTPUT=neuroon_open.bin
OPEN_BIN_OUTPUT=neuroonOpenFirmware.hex
SOFT_DEVICE_ADDRESS=0x00000000
APP_ADDRESS=0x017000
DFU_ADDRESS=0x030000
BOOTLOADER_ADDRESS=0x03D000

BIN_DIR=bin
EX_BIN_DIR=common
SOFT_DEVICE_BIN=s110_nrf51822_7.3.0_softdevice.bin
SOFT_DEVICE_130_BIN= s130_nrf51_2.0.1_softdevice.hex
DFU_BIN=neuroon_dfu1_0_0_12.bin
DFU_BIN_NEW=nrf51822_xxac_s130_boot_s.hex
BOOTLOADER_BIN=neuroon_bootloader1_0_0_1.bin

JLINK=JLinkExe

include openocd.stlink-v2-1

flash_app_classic: $(BIN_DIR)/$(CLASSIC_BIN_OUTPUT)
	$(OPENOCD) -c "program $(BIN_DIR)/$(CLASSIC_BIN_OUTPUT) $(APP_ADDRESS) verify; reset run; shutdown"

flash_app_open_deprecated: $(BIN_DIR)/$(OPEN_DEPRECATED_BIN_OUTPUT)
	$(OPENOCD) -c "program $(BIN_DIR)/$(OPEN_DEPRECATED_BIN_OUTPUT) $(APP_ADDRESS) verify; reset run; shutdown"

flash_soft_device: $(EX_BIN_DIR)/$(SOFT_DEVICE_BIN)
	$(OPENOCD) -c "program $(EX_BIN_DIR)/$(SOFT_DEVICE_BIN) $(SOFT_DEVICE_ADDRESS) verify; reset run; shutdown"

flash_dfu: $(EX_BIN_DIR)/$(DFU_BIN)
	$(OPENOCD) -c "program $(EX_BIN_DIR)/$(DFU_BIN) $(DFU_ADDRESS) verify; reset run; shutdown"

flash_bootloader: $(EX_BIN_DIR)/$(BOOTLOADER_BIN)
	$(OPENOCD) -c "program $(EX_BIN_DIR)/$(BOOTLOADER_BIN) $(BOOTLOADER_ADDRESS) verify; reset run; shutdown"

flash_all_classic: $(BIN_DIR)/$(CLASSIC_BIN_OUTPUT) $(EX_BIN_DIR)/$(SOFT_DEVICE_BIN) $(EX_BIN_DIR)/$(DFU_BIN) $(EX_BIN_DIR)/$(BOOTLOADER_BIN)
	$(OPENOCD) -c"init ; reset init ; program $(EX_BIN_DIR)/$(SOFT_DEVICE_BIN) verify $(SOFT_DEVICE_ADDRESS); program $(EX_BIN_DIR)/$(BOOTLOADER_BIN) verify $(BOOTLOADER_ADDRESS) ; program $(EX_BIN_DIR)/$(DFU_BIN) verify $(DFU_ADDRESS) ; program $(BIN_DIR)/$(CLASSIC_BIN_OUTPUT) verify $(APP_ADDRESS) ; reset run ; shutdown"

flash_all_open_deprecated: $(BIN_DIR)/$(OPEN_DEPRECATED_BIN_OUTPUT) $(EX_BIN_DIR)/$(SOFT_DEVICE_BIN) $(EX_BIN_DIR)/$(DFU_BIN) $(EX_BIN_DIR)/$(BOOTLOADER_BIN)
	$(OPENOCD) -c"init ; reset init ; program $(EX_BIN_DIR)/$(SOFT_DEVICE_BIN) verify $(SOFT_DEVICE_ADDRESS); program $(EX_BIN_DIR)/$(BOOTLOADER_BIN) verify $(BOOTLOADER_ADDRESS) ; program $(EX_BIN_DIR)/$(DFU_BIN) verify $(DFU_ADDRESS) ; program $(BIN_DIR)/$(OPEN_DEPRECATED_BIN_OUTPUT) verify $(APP_ADDRESS) ; reset run ; shutdown"

jlink_all_open_deprecated: $(BIN_DIR)/$(OPEN_DEPRECATED_BIN_OUTPUT) $(EX_BIN_DIR)/$(SOFT_DEVICE_BIN) $(EX_BIN_DIR)/$(DFU_BIN) $(EX_BIN_DIR)/$(BOOTLOADER_BIN)
	$(JLINK) deprecated_neuroon.jlink

jlink_all_classic: $(BIN_DIR)/$(CLASSIC_BIN_OUTPUT) $(EX_BIN_DIR)/$(SOFT_DEVICE_BIN) $(EX_BIN_DIR)/$(DFU_BIN) $(EX_BIN_DIR)/$(BOOTLOADER_BIN)
	$(JLINK) old_neuroon.jlink

jlink_all_open: $(BIN_DIR)/$(OPEN_BIN_OUTPUT) $(EX_BIN_DIR)/$(SOFT_DEVICE_130_BIN) $(EX_BIN_DIR)/$(DFU_BIN_NEW)
	$(JLINK) neuroon_open_firmware.jlink
