# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./coordinate.sv"
vlog "./Filter.sv"
vlog "./boxDrawer.sv"
vlog "V_Sdram_Control/command.v"
vlog "V_Sdram_Control/control_interface.v"
vlog "V_Sdram_Control/sdr_data_path.v"
vlog "V_Sdram_Control/Sdram_Control.v"
vlog "V_Sdram_Control/Sdram_Params.v"




# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work coordinate_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do coordinate_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
