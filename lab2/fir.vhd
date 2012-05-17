------------------------------------------------------------------------
-- finite-impulse response filters
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.fir_synth_pkg.all;

entity fir is
  port(
    clk     : in  std_logic;
    i_data  : in  word;
    o_data  : out word
  );
end entity;

architecture avg of fir is

  signal tap0, tap1 , tap2 , tap3
             , prod1, prod2, prod3
                    , sum2 , sum3
       : word;

  constant coef1 : word := x"0004";
  constant coef2 : word := x"0004";
  constant coef3 : word := x"0004";
  
begin

  -- delay line of flops to hold samples of input data
  tap0 <= i_data;
  delay_line : process(clk)
  begin
    if (rising_edge(clk)) then
      tap1 <= tap0;
      tap2 <= tap1;
      tap3 <= tap2;
    end if;
  end process;
  
  -- simple averaging circuit
  --
  prod1 <= mult( tap1, coef1);
  prod2 <= mult( tap2, coef2);
  prod3 <= mult( tap3, coef3);

  sum2  <= prod1 + prod2;
  sum3  <= sum2  + prod3;
  
  o_data <= sum3;

end architecture;

------------------------------------------------------------------------
-- low-pass filter
------------------------------------------------------------------------

architecture low_pass of fir is

  -- The attribute line below is usually needed to avoid a warning
  -- from PrecisionRTL that signals could be implemented using
  -- memory arrays.  If your main signals have different names,
  -- then make the appropriate changes to tap, prod, and sum.
  -- 
  -- attribute logic_block of tap, prod, sum : signal is true;
  
begin

end architecture;

-- question 2
  -- insert your answer here

-- question 3
  -- insert your answer here
