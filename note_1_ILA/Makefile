# Directories
BUILD_DIR = build
SCRIPT_DIR_1 = ip/scalar_add/script.tcl
SCRIPT_DIR_2 = ip/mult_constant/script.tcl 

# Executables
VIVADO_HLS = vitis_hls
VIVADO = vivado

.PHONY: all setup ip1 ip2 bit1 bit2 clean

all: setup ip1 ip2 bit1 bit2

setup:
	if [ -d $(BUILD_DIR) ]; then echo "/build directory already exists. Please enter: make clean"; exit; fi
	mkdir $(BUILD_DIR)

ip1:
	cd $(BUILD_DIR) && $(VIVADO_HLS) -f ../$(SCRIPT_DIR_1)
ip2:
	cd $(BUILD_DIR) && $(VIVADO_HLS) -f ../$(SCRIPT_DIR_2)

bit1:
	mkdir $(BUILD_DIR)/proj_tutorial_1
	cd $(BUILD_DIR)/proj_tutorial_1 && $(VIVADO) -mode tcl -source ../../tcl/tutorial_1.tcl -nojournal -nolog

bit2:
	mkdir $(BUILD_DIR)/proj_tutorial_2
	cd $(BUILD_DIR)/proj_tutorial_2 && $(VIVADO) -mode tcl -source ../../tcl/tutorial_2.tcl -nojournal -nolog


clean:
	rm -rf $(BUILD_DIR)
