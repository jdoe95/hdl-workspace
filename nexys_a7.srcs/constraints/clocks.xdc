# clock signals

set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {osc}];
create_clock -add -name osc -period 10 [get_ports {osc}];
# derived clocks are automatically added when a clock propagates through MMCM/PLL/BUFR
