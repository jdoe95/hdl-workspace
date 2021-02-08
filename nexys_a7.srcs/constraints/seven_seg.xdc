# seven segment displays

set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {seg[0]}]; # a
set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports {seg[1]}]; # b
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports {seg[2]}]; # c
set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {seg[3]}]; # d
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {seg[4]}]; # e
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {seg[5]}]; # f
set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports {seg[6]}]; # g
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports {seg[7]}]; # dp

set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports {dig[0]}]; # DIG0
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports {dig[1]}]; # DIG1
set_property -dict {PACKAGE_PIN T9  IOSTANDARD LVCMOS33} [get_ports {dig[2]}]; # DIG2
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {dig[3]}]; # DIG3
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {dig[4]}]; # DIG4
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {dig[5]}]; # DIG5
set_property -dict {PACKAGE_PIN K2  IOSTANDARD LVCMOS33} [get_ports {dig[6]}]; # DIG6
set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVCMOS33} [get_ports {dig[7]}]; # DIG7
