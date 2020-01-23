/*
//----------------------------------------------------------------------------
//                       Paul Scherrer Institute (PSI)
//----------------------------------------------------------------------------
// Unit    : fpga_base.c
// Author  : Goran Marinkovic, Section Diagnostic
// Version : $Revision: 1.1 $
//----------------------------------------------------------------------------
// CopyrightÂ© PSI, Section Diagnostic
//----------------------------------------------------------------------------
// Comment : This file is used for the compile date and time conversion.
//----------------------------------------------------------------------------
*/
/* Include files */
#include "fpga_base.h"

void fpga_base_set_led(uint32_t base_addr, uint8_t val)
{
	Xil_Out8(base_addr + C_LED_OFS, val);
}

uint8_t fpga_base_read_dip(uint32_t base_addr)
{
	return Xil_In32(base_addr+C_DIP_SW_OFS);
}

void fpga_base_version(uint32_t base_addr)
{
   /* Store the year */
   Xil_Out32(base_addr + 0x00000018, DATE_YEAR);
   /* Store the month */
   Xil_Out32(base_addr + 0x0000001C, DATE_MONTH);
   /* Store the day */
   Xil_Out32(base_addr + 0x00000020, DATE_DAY);
   /* Store the hour */
   Xil_Out32(base_addr + 0x00000024, TIME_HOUR);
   /* Store the minute */
   Xil_Out32(base_addr + 0x00000028, TIME_MINUTE);

   return;
}

void fpga_base_print(uint32_t base_addr)
{
   uint8_t word_addr = 0;
   uint8_t byte_index = 0;
   uint8_t print_string[17];

   /* Print version */
   xil_printf("Version: 0x%08X\r\n", Xil_In32(base_addr + C_VERSION_OFS));
   /* Print firmware compilation date and time */
   xil_printf("FW date/time: %d.%d.%d %02d:%02d\r\n",
      Xil_In32(base_addr + C_FW_DATE_YEAR_OFS),
      Xil_In32(base_addr + C_FW_DATE_MONTH_OFS),
      Xil_In32(base_addr + C_FW_DATE_DAY_OFS),
      Xil_In32(base_addr + C_FW_DATE_HOUR_OFS),
      Xil_In32(base_addr + C_FW_DATE_MINUTE_OFS)
   );
   /* Print firmware compilation date and time */
   xil_printf("SW date/time: %d.%d.%d %02d:%02d\r\n",
      Xil_In32(base_addr + C_SW_DATE_YEAR_OFS),
      Xil_In32(base_addr + C_SW_DATE_MONTH_OFS),
      Xil_In32(base_addr + C_SW_DATE_DAY_OFS),
      Xil_In32(base_addr + C_SW_DATE_HOUR_OFS),
      Xil_In32(base_addr + C_SW_DATE_MINUTE_OFS)
   );
   /* Print project name */
   for (word_addr = 0; word_addr < 4; word_addr++)
   {
      for (byte_index = 0; byte_index < 4; byte_index++)
      {
         print_string[(word_addr * 4) + byte_index] = Xil_In8(base_addr + C_PROJECT_OFS + (word_addr * 4) + 3 - byte_index);
      }
   }
   print_string[16] = '\0';
   xil_printf("Project: %s\r\n", print_string);
   /* Print facility name*/
   for (word_addr = 0; word_addr < 4; word_addr++)
   {
      for (byte_index = 0; byte_index < 4; byte_index++)
      {
         print_string[(word_addr * 4) + byte_index] = Xil_In8(base_addr + C_FACILITY_OFS + (word_addr * 4) + 3 - byte_index);
      }
   }
   print_string[16] = '\0';
   xil_printf("Facility: %s\r\n", print_string);

   return;
}

/* EOF */
