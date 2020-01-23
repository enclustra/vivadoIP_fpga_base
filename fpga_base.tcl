###############################################################################
#                       Goran Marinkovic
###############################################################################
# Unit    : fpga_base.tcl
# Author  : Goran Marinkovic
# Version : $Revision: 1.1 $
###############################################################################
# Copyright© Goran Marinkovic
#            With massive help from Xilinx Aidan Mac Creary ‎[aidanmac.mac-creary@xilinx.com]‎‎
###############################################################################
# Comment : Writes the compile date and time to the block design containing
#           the fpga_base component.
###############################################################################

###############################################################################
# Conversion decimal to binary
###############################################################################
proc dec2bin {i {width {}}} {
   #returns the binary representation of $i
   # width determines the length of the returned string (left truncated or added left 0)
   # use of width allows concatenation of bits sub-fields

   set res {}
   if {$i<0} {
      set sign -
      set i [expr {abs($i)}]
   } else {
      set sign {}
   }
   while {$i>0} {
      set res [expr {$i%2}]$res
      set i [expr {$i/2}]
   }
   if {$res eq {}} {set res 0}

   if {$width ne {}} {
      append d [string repeat 0 $width] $res
      set res [string range $d [string length $res] end]
   }
   return $sign$res
}

###############################################################################
# Write date and time bits to flip-flops init generic.
###############################################################################
proc fpga_base {} {

   puts "Compilation date and time is set to:"

   set date_raw     [clock seconds]

   set c_date [clock format $date_raw -format %Y]
   scan $c_date "%d" c_date_int
   set c_date_int [expr {$c_date_int}]
   puts "C_DATE_YEAR   : $c_date_int"
   set binYear [dec2bin $c_date_int 32]
   puts "$binYear"

   set x 31
   set y 0
   while {$x>=0} {
      set val [string index $binYear $y]
      set reg */fpga_base_inst/U0/fpga_base_date_inst/gen_year[$x].year_dfpe_inst
      puts "reg is $reg: x is $x : val is $val"
      set_property -verbose INIT $val [get_cells $reg]
      set x [expr {$x - 1}]
      set y [expr {$y + 1}]
   }

   set c_date [clock format $date_raw -format %m]
   scan $c_date "%d" c_date_int
   puts "C_DATE_MONTH  : $c_date_int"
   set binMonth [dec2bin $c_date_int 32]
   puts "$binMonth"

   set x 31
   set y 0
   while {$x>=0} {
      set val [string index $binMonth $y]
      set reg */fpga_base_inst/U0/fpga_base_date_inst/gen_month[$x].month_dfpe_inst
      puts "reg is $reg: x is $x : val is $val"
      set_property -verbose INIT $val [get_cells $reg]
      set x [expr {$x - 1}]
      set y [expr {$y + 1}]
   }

   set c_date [clock format $date_raw -format %e]
   scan $c_date "%d" c_date_int
   puts "C_DATE_DAY    : $c_date_int"
   set binDay [dec2bin $c_date_int 32]
   puts "$binDay"

   set x 31
   set y 0
   while {$x>=0} {
      set val [string index $binDay $y]
      set reg */fpga_base_inst/U0/fpga_base_date_inst/gen_day[$x].day_dfpe_inst
      puts "reg is $reg: x is $x : val is $val"
      set_property -verbose INIT $val [get_cells $reg]
      set x [expr {$x - 1}]
      set y [expr {$y + 1}]
   }

   set c_date [clock format $date_raw -format %k]
   scan $c_date "%d" c_date_int
   puts "C_DATE_HOUR   : $c_date_int"
   set binHour [dec2bin $c_date_int 32]
   puts "$binHour"

   set x 31
   set y 0
   while {$x>=0} {
      set val [string index $binHour $y]
      set reg */fpga_base_inst/U0/fpga_base_date_inst/gen_hour[$x].hour_dfpe_inst
      puts "reg is $reg: x is $x : val is $val"
      set_property -verbose INIT $val [get_cells $reg]
      set x [expr {$x - 1}]
      set y [expr {$y + 1}]
   }

   set c_date [clock format $date_raw -format %M]
   scan $c_date "%d" c_date_int
   puts "C_DATE_MINUTE : $c_date_int"
   set binMin [dec2bin $c_date_int 32]
   puts "$binMin"

   set x 31
   set y 0
   while {$x>=0} {
      set val [string index $binMin $y]
      set reg */fpga_base_inst/U0/fpga_base_date_inst/gen_minute[$x].minute_dfpe_inst
      puts "reg is $reg: x is $x : val is $val"
      set_property -verbose INIT $val [get_cells $reg]
      set x [expr {$x - 1}]
      set y [expr {$y + 1}]
   }

   return
}

###############################################################################
# Execute tcl script tcl.pre in optimize design.
###############################################################################
fpga_base

###############################################################################
# End of File
###############################################################################
