------------------------------------------------------------------------------
--  Copyright (c) 2019 by Enclustra GmbH, Switzerland
--  All rights reserved.
--  Authors: Oliver Bruendler
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package fpga_base_scripted_info_pkg is

    constant BuildYear_c    : integer := 0000; -- $$year$$
    constant BuildMonth_c   : integer := 0;    -- $$month$$
    constant BuildDay_c     : integer := 0;    -- $$day$$
    constant BuildHour_c    : integer := 0;    -- $$hour$$
    constant BuildMinute_c  : integer := 0;    -- $$minute$$
    constant BuildGitHash_c : std_logic_vector(31 downto 0) := X"00000000"; -- $$githash$$

end package fpga_base_scripted_info_pkg;


--------------------------------------------------------------------------------
-- End of file
--------------------------------------------------------------------------------
