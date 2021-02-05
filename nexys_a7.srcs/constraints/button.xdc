# buttons
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS33} [get_ports {button_reset}]; # CPU reset
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {button_c}];     # center
set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33} [get_ports {button_u}];     # up
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports {button_l}];     # left
set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS33} [get_ports {button_r}];     # right
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports {button_d}];     # down
