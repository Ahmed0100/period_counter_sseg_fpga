## Generated SDC file "period_counter.out.sdc"

## Copyright (C) 2022  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 21.1.1 Build 850 06/23/2022 SJ Lite Edition"

## DATE    "Wed Sep 21 11:33:30 2022"

##
## DEVICE  "EP4CE6E22C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 50.000 -waveform { 0.000 25.000 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {reset_n}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {si}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {start}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {ready}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sel[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sel[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sel[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sel[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sseg[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sseg[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sseg[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sseg[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sseg[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sseg[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sseg[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sseg[7]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

