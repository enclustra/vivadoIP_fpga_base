--------------------------------------------------------------------------------
--                       Goran Marinkovic
--------------------------------------------------------------------------------
-- Unit    : fpga_base_date_package.vhd
-- Author  : Goran Marinkovic
-- Version : $Revision: 1.1 $
--------------------------------------------------------------------------------
-- Copyright© Goran Marinkovic
--------------------------------------------------------------------------------
-- Comment : This is the source for the compilation date and time component.
--------------------------------------------------------------------------------
-- Std. library (platform) -----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package fpga_base_date_package is

   -----------------------------------------------------------------------------
   -- Component Date
   -----------------------------------------------------------------------------
   component fpga_base_date is
   generic
   (
      C_DATE_YEAR                 : integer := 2026;
      C_DATE_MONTH                : integer := 11;
      C_DATE_DAY                  : integer := 3;
      C_DATE_HOUR                 : integer := 19;
      C_DATE_MINUTE               : integer := 49;
      C_USE_GENERIC_DATE          : boolean := false
   );
   port
   (
      --------------------------------------------------------------------------
      -- System
      --------------------------------------------------------------------------
      i_clk                       : in    std_logic;
      --------------------------------------------------------------------------
      -- Date and time
      --------------------------------------------------------------------------
      o_year                      : out   std_logic_vector(31 downto  0);
      o_month                     : out   std_logic_vector(31 downto  0);
      o_day                       : out   std_logic_vector(31 downto  0);
      o_hour                      : out   std_logic_vector(31 downto  0);
      o_minute                    : out   std_logic_vector(31 downto  0)
   );
   end component fpga_base_date;

end package fpga_base_date_package;

--------------------------------------------------------------------------------
-- Component Date
--------------------------------------------------------------------------------
-- Std. library (platform) -----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Work library (platform) -----------------------------------------------------
library unisim;
use unisim.vcomponents.all;

-- Work library (application) --------------------------------------------------

entity fpga_base_date is
   generic
   (
      C_DATE_YEAR                 : integer := 2026;
      C_DATE_MONTH                : integer := 11;
      C_DATE_DAY                  : integer := 3;
      C_DATE_HOUR                 : integer := 19;
      C_DATE_MINUTE               : integer := 49;
      C_USE_GENERIC_DATE          : boolean := false
   );
   port
   (
      --------------------------------------------------------------------------
      -- System
      --------------------------------------------------------------------------
      i_clk                       : in    std_logic;
      --------------------------------------------------------------------------
      -- Date and time
      --------------------------------------------------------------------------
      o_year                      : out   std_logic_vector(31 downto  0);
      o_month                     : out   std_logic_vector(31 downto  0);
      o_day                       : out   std_logic_vector(31 downto  0);
      o_hour                      : out   std_logic_vector(31 downto  0);
      o_minute                    : out   std_logic_vector(31 downto  0)
   );
end entity fpga_base_date;

architecture structural of fpga_base_date is

    signal year     : std_logic_vector(31 downto  0);
    signal month    : std_logic_vector(31 downto  0);
    signal day      : std_logic_vector(31 downto  0);
    signal hour     : std_logic_vector(31 downto  0);
    signal minute   : std_logic_vector(31 downto  0);

begin

   gen_year : for count in 0 to 31 generate
      attribute dont_touch : string;
      attribute dont_touch of year_dfpe_inst: label is "true";
   begin

      year_dfpe_inst: FDPE
      port map
      (
         PRE                      => '0',
         CE                       => '0',
         C                        => i_clk,
         D                        => '0',
         Q                        => year(count)
      );

   end generate;

   gen_month : for count in 0 to 31 generate
      attribute dont_touch : string;
      attribute dont_touch of month_dfpe_inst: label is "true";
   begin

      month_dfpe_inst: FDPE
      port map
      (
         PRE                      => '0',
         CE                       => '0',
         C                        => i_clk,
         D                        => '0',
         Q                        => month(count)
      );

   end generate;

   gen_day : for count in 0 to 31 generate
      attribute dont_touch : string;
      attribute dont_touch of day_dfpe_inst: label is "true";
   begin

      day_dfpe_inst: FDPE
      port map
      (
         PRE                      => '0',
         CE                       => '0',
         C                        => i_clk,
         D                        => '0',
         Q                        => day(count)
      );

   end generate;

   gen_hour : for count in 0 to 31 generate
      attribute dont_touch : string;
      attribute dont_touch of hour_dfpe_inst: label is "true";
   begin

      hour_dfpe_inst: FDPE
      port map
      (
         PRE                      => '0',
         CE                       => '0',
         C                        => i_clk,
         D                        => '0',
         Q                        => hour(count)
      );

   end generate;

   gen_minute : for count in 0 to 31 generate
      attribute dont_touch : string;
      attribute dont_touch of minute_dfpe_inst: label is "true";
   begin

      minute_dfpe_inst: FDPE
      port map
      (
         PRE                      => '0',
         CE                       => '0',
         C                        => i_clk,
         D                        => '0',
         Q                        => minute(count)
      );

   end generate;
   
   g_generics : if C_USE_GENERIC_DATE generate
   begin
      o_year <= std_logic_vector(to_unsigned(C_DATE_YEAR, 32));
      o_month <= std_logic_vector(to_unsigned(C_DATE_MONTH, 32));
      o_day <= std_logic_vector(to_unsigned(C_DATE_DAY, 32));
      o_hour <= std_logic_vector(to_unsigned(C_DATE_HOUR, 32));
      o_minute <= std_logic_vector(to_unsigned(C_DATE_MINUTE, 32));
   end generate;
   
   g_ngenerics : if not C_USE_GENERIC_DATE generate
   begin
      o_year <= year;
      o_month <= month;
      o_day <= day;
      o_hour <= hour;
      o_minute <= minute;
   end generate;
   
end structural;

--------------------------------------------------------------------------------
-- End of file
--------------------------------------------------------------------------------
