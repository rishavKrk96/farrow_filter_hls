# Create clock constraints
create_clock -name clk -period 5 [get_ports {clk}]
# Create virtual clocks for input and output delay constraints
#create clock -name vclk -period 4.000

# derive clock uncertainty
derive_clock_uncertainty

# set input and output delays
set_input_delay -clock { clk } 0.1 [all_inputs]

set_output_delay -clock { clk } 0.1 [all_outputs]
