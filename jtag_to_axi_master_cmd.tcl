################################################################################
#                       Goran Marinkovic
################################################################################
# Unit    : jtag_to_axi_master_cmd.tcl
# Author  : Goran Marinkovic
# Version : $Revision: 1.1 $
################################################################################
# Copyright© Goran Marinkovic
################################################################################
# Comment : Functions are targeting the Arty board with XC7A35TICSG324-1L.
################################################################################

################################################################################
# Write to JTAG to AXI master LEDs
################################################################################
proc fpga_base_led_wr {base value} {

   reset_hw_axi [get_hw_axis hw_axi_1];
   set addr [format 0x%x [expr {$base + 0x00000060}]]
   create_hw_axi_txn write_txn [get_hw_axis hw_axi_1] -force -type WRITE -address $addr -len 1 -data $value;
   run_hw_axi -quiet [get_hw_axi_txns write_txn];

   return;
}

################################################################################
# Read from JTAG to AXI master LEDs
################################################################################
proc fpga_base_led_rd {base} {

   reset_hw_axi [get_hw_axis hw_axi_1];
   set addr [format 0x%x [expr {$base + 0x00000060}]]
   create_hw_axi_txn read_txn [get_hw_axis hw_axi_1] -force -type READ -address $addr -len 1;
   run_hw_axi -quiet [get_hw_axi_txns read_txn];
   set led_val [lindex [report_hw_axi_txn -quiet [get_hw_axi_txns read_txn]] 1];
   puts "   $led_val";

   return;
}

################################################################################
# Read from JTAG to AXI master project, firmware and software date and time
################################################################################
proc fpga_base_fw_date_rd {base} {

   reset_hw_axi [get_hw_axis hw_axi_1];

   #Project string minor
   set addr [format 0x%x [expr {$base + 0x00000050}]]
   create_hw_axi_txn read_txn [get_hw_axis hw_axi_1] -quiet -force -type READ -address $addr -len 4;
   run_hw_axi -quiet [get_hw_axi_txns read_txn];
   set character_array [report_hw_axi_txn -quiet -t u1 -w 16 [get_hw_axi_txns read_txn]];
   set character_string ""
   for {set word 0} {$word < 4} {incr word} {
      for {set byte 0} {$byte < 4} {incr byte} {
         set character_val [lindex $character_array [expr {4 + $word * 4 - $byte}]]
         if {$character_val > 31} {
            append character_string [format %c $character_val];
         }
      }
   }
   puts "   Project minor: $character_string";

   #Project string major
   set addr [format 0x%x [expr {$base + 0x00000040}]]
   create_hw_axi_txn read_txn [get_hw_axis hw_axi_1] -quiet -force -type READ -address $addr -len 4;
   run_hw_axi -quiet [get_hw_axi_txns read_txn];
   set character_array [report_hw_axi_txn -quiet -t u1 -w 16 [get_hw_axi_txns read_txn]];
   set character_string ""
   for {set word 0} {$word < 4} {incr word} {
      for {set byte 0} {$byte < 4} {incr byte} {
         set character_val [lindex $character_array [expr {4 + $word * 4 - $byte}]]
         if {$character_val > 31} {
            append character_string [format %c $character_val];
         }
      }
   }
   puts "   Project major: $character_string";

   #Firmware compile date and time
   set addr [format 0x%x [expr {$base + 0x00000004}]]
   create_hw_axi_txn read_txn [get_hw_axis hw_axi_1] -quiet -force -type READ -address $addr -len 5;
   run_hw_axi -quiet [get_hw_axi_txns read_txn];
   set date_array [report_hw_axi_txn -quiet -t u4 -w 32 [get_hw_axi_txns read_txn]]

   set year   [lindex $date_array 1];
   set month  [lindex $date_array 2];
   set day    [lindex $date_array 3];
   set hour   [lindex $date_array 4];
   set minute [lindex $date_array 5];

   puts "   FW date:  $year.$month.$day $hour:$minute";

   #Software compile date and time
   set addr [format 0x%x [expr {$base + 0x00000018}]]
   create_hw_axi_txn read_txn [get_hw_axis hw_axi_1] -quiet -force -type READ -address $addr -len 5;
   run_hw_axi -quiet [get_hw_axi_txns read_txn];
   set date_array [report_hw_axi_txn -quiet -t u4 -w 32 [get_hw_axi_txns read_txn]]

   set year   [lindex $date_array 1];
   set month  [lindex $date_array 2];
   set day    [lindex $date_array 3];
   set hour   [lindex $date_array 4];
   set minute [lindex $date_array 5];

   puts "   SW date:  $year.$month.$day $hour:$minute";

   return;
}

################################################################################
# Read from JTAG to AXI master xadc
################################################################################
proc fpga_base_xadc_rd {base} {

   reset_hw_axi [get_hw_axis hw_axi_1];
   set addr [format 0x%x [expr {$base + 0x00000084}]]
   create_hw_axi_txn read_txn [get_hw_axis hw_axi_1] -quiet -force -type READ -address $addr -len 4;
   run_hw_axi -quiet [get_hw_axi_txns read_txn];
   set xadc_array [report_hw_axi_txn -quiet -t u4 -w 16 [get_hw_axi_txns read_txn]]

   set xadc_temp [lindex $xadc_array 1];
   set xadc_temp [expr {$xadc_temp / 65536.0 * 503.975 - 273.15}];
   set xadc_temp [format %2.3f $xadc_temp];
   puts "   TEMP \[degC]\:  $xadc_temp";

   set xadc_vccint [lindex $xadc_array 3];
   set xadc_vccint [expr {$xadc_vccint / 65536.0 * 3.0}];
   set xadc_vccint [format %2.3f $xadc_vccint];
   puts "   VCCINT  \[V]\:  $xadc_vccint";

   set xadc_vccaux [lindex $xadc_array 2];
   set xadc_vccaux [expr {$xadc_vccaux / 65536.0 * 3.0}];
   set xadc_vccaux [format %2.3f $xadc_vccaux];
   puts "   VCCAUX  \[V]\:  $xadc_vccaux";

   set xadc_vccbram [lindex $xadc_array 4];
   set xadc_vccbram [expr {$xadc_vccbram / 65536.0 * 3.0}];
   set xadc_vccbram [format %2.3f $xadc_vccbram];
   puts "   VCCBRAM \[V]\:  $xadc_vccbram";

   return;
}

################################################################################
# End of File
################################################################################
