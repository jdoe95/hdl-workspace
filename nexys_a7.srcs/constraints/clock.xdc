# clock signals
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports osc]

# derived clocks are automatically added when a clock propagates through MMCM/PLL/BUFR
create_clock -period 10.000 -name osc -add [get_ports osc]
