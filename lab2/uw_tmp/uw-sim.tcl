source /home/ece327/lib/lib-msim.tcl

proc reload {} {
  vcom -93 +acc -work work-msim heatingsys.vhd heatingsys_tb.vhd
}

if { "" ne "" } {
  source 
}


