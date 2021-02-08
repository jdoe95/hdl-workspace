# refer to UG903

# Overwrite predefined system jitter
# Produced by power supply noise, board noise, or any extra jitter of the system.
#set_system_jitter



# Primary clocks
# Derived clocks are automatically added when a clock propagates through MMCM/PLL/BUFR.
create_clock -period 10.000 -name osc -add [get_ports osc];


# Derived clocks
#create_generated_clock



# Clock groups
#set_clock_groups



# External latencies (the propagation delay on the board from the clock component to the FPGA)
set_clock_latency -source -late 0.0 [get_clocks osc];



# The difference between successive clock edges with respect to variation from the nominal or ideal
# clock arrival times.
set_input_jitter [get_clocks osc] 0.1; # DSC1033CC1-100.0000T 100ps



# Clock uncertainties
# This adds extra timing margin.
#set_clock_uncertainty



# Input and output delays
# Specifies the path delay of the interface input/output port relative to the interface clock edge.
#set_input_delay

# LED display scanner delays
#set_output_delay -clock [get_nets slow_clock] 1 [get_ports seg];
#set_output_delay -clock [get_nets slow_clock] 1 [get_ports dig];
