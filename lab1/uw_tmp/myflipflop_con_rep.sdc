###################################################################################
# Mentor Graphics Corporation
#
###################################################################################

#################
# Attributes
#################
set_attribute -name use_dffenable -value "0" -net -type default o_q_b -design rtl 


##################
# Clocks
##################
create_clock { i_clock } -domain ClockDomain0 -name i_clock -period 2.000000 -waveform { 0.000000 1.000000 } -design rtl 

