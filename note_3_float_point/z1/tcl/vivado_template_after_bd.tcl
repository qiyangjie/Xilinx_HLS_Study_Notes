
################################################################
# This is a generated script based on design: dma_tutorial_2_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

##########################################################################################
# mySetup BIN
##########################################################################################
# ToDo: Modify the project name
set proj_name dma_tutorial_2_1

# The below do not need to change
set proj_path "./$proj_name"
set ip_path "./$proj_name"
set design_name $proj_name

# Create custom project
create_project $proj_name $proj_path -part xc7z020clg400-1
set_property BOARD_PART www.digilentinc.com:pynq-z1:part0:1.0 [current_project]

set_property ip_repo_paths $ip_path [current_project]
update_ip_catalog

###########################################################################################
# mySetup PAUSE, there are another part at the end
###########################################################################################


# CHANGE DESIGN NAME HERE
variable design_name
set design_name dma_tutorial_2_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

}

##################################################################
# MAIN FLOW
##################################################################

create_root_design ""

################################################################
# MySetup Part II
################################################################
# Create top-level wrapper file
make_wrapper -files [get_files $proj_path/$proj_name.srcs/sources_1/bd/$design_name/$design_name.bd] -top
add_files -norecurse $proj_path/$proj_name.srcs/sources_1/bd/$design_name/hdl/${proj_name}_wrapper.v
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Run bistream generation on 8 threads
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

# write_hw_platform -fixed -force  -include_bit -file $proj_path/${proj_name}_wrapper.xsa

set overlays_path ./overlays
file mkdir $overlays_path
file copy -force ./$proj_name/$proj_name.runs/impl_1/$proj_name\_wrapper.bit $overlays_path/$proj_name.bit
file copy -force ./$proj_name/$proj_name.gen/sources_1/bd/$proj_name/hw_handoff/$proj_name.hwh $overlays_path/$proj_name.hwh
file copy -force ./$proj_name/$proj_name.gen/sources_1/bd/$proj_name/hw_handoff/$proj_name\_bd.tcl $overlays_path/$proj_name.tcl
close_project
exit

################################################################
# mySetup END
################################################################


