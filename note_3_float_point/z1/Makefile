# Directories
BUILD_DIR = build
SCRIPT_DIR_1 = tcl/ip_float_point_tutorial.tcl
SCRIPT_DIR_2 = tcl/bit_float_point_tutorial.tcl

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

bit:
	cd $(BUILD_DIR) && $(VIVADO) -mode tcl -source ../$(SCRIPT_DIR_2) -nojournal -nolog

clean:
	rm -rf $(BUILD_DIR)
