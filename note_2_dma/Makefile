# Directories
BUILD_DIR = build
SCRIPT_DIR_1 = tcl/ip_dma_tutorial_1.tcl
SCRIPT_DIR_2 = tcl/bit_dma_tutorial_1.tcl
SCRIPT_DIR_3 = tcl/bit_dma_tutorial_2_1.tcl
SCRIPT_DIR_4 = tcl/bit_dma_tutorial_2_2.tcl
SCRIPT_DIR_5 = tcl/vivado_template_z1.tcl

# Executables
VIVADO_HLS = vitis_hls
VIVADO = vivado

.PHONY: all setup ip bit clean

all: setup ip bit

setup:
	if [ -d $(BUILD_DIR) ]; then echo "/build directory already exists. Please enter: make clean"; exit; fi
	mkdir $(BUILD_DIR)

ip:
	cd $(BUILD_DIR) && $(VIVADO_HLS) -f ../$(SCRIPT_DIR_1)
	cd $(BUILD_DIR) && $(VIVADO_HLS) -f ../tcl/ip_dma_tutorial_2_1.tcl
	cd $(BUILD_DIR) && $(VIVADO_HLS) -f ../tcl/ip_dma_tutorial_2_2.tcl

bit:
	cd $(BUILD_DIR) && $(VIVADO) -mode tcl -source ../$(SCRIPT_DIR_2) -nojournal -nolog
	cd $(BUILD_DIR) && $(VIVADO) -mode tcl -source ../$(SCRIPT_DIR_3) -nojournal -nolog
	cd $(BUILD_DIR) && $(VIVADO) -mode tcl -source ../$(SCRIPT_DIR_4) -nojournal -nolog

clean:
	rm -rf $(BUILD_DIR)
