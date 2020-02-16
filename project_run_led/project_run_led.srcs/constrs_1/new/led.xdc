set_property PACKAGE_PIN AC19 [get_ports clk]

set_property PACKAGE_PIN Y3 [get_ports resetn]

set_property PACKAGE_PIN K23 [get_ports {led[0]}]
set_property PACKAGE_PIN J23 [get_ports {led[1]}]
set_property PACKAGE_PIN H23 [get_ports {led[2]}]
set_property PACKAGE_PIN J19 [get_ports {led[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports resetn]
set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}}