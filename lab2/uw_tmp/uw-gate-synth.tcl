set_results_dir uw_tmp
setup_design \
  -manufacturer Altera \
  -family {Stratix II} \
  -part EP2S15F484C \
  -speed 5 
setup_design -frequency 500
setup_design -design heatingsys
setup_design -architecture main
setup_design -generics {  }

foreach file [concat {  } { heatingsys.vhd }] {
  add_input_file $file
}

compile
set clocks [ find_clocks ] 
if { [ llength $clocks ] != 0 } { 
  set clock [ lindex $clocks 0 ] 
  set_input_delay 0 [ all_inputs ] -clock $clock
  set_output_delay 0 [ all_outputs ] -clock $clock
}
auto_write heatingsys_gate.vho

puts "*** synthesis to generic gates succeeded ***"

if { "-newgui" == " -shell" } {
  exit
}
