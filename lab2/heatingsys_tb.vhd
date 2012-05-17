------------------------------------------------------------------------
-- heating system testbench
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity heatingsys_tb is
end entity;

architecture main of heatingsys_tb is
  signal cur_temp       : signed(7 downto 0);     -- current temp
  signal des_temp       : signed(7 downto 0);     -- desired temp
  signal reset          : std_logic;                     -- reset
  signal clock          : std_logic;                     -- clock
  signal heatmode       : std_logic_vector(1 downto 0);  -- mode
begin

  uut : entity work.heatingsys(main)
    port map (
      i_cur_temp => cur_temp,
      i_des_temp => des_temp,
      i_reset => reset,
      i_clock => clock,
      o_heatmode => heatmode
    );

  process 
  begin
  --clock <= NOT clock;
  clock <= '0';
wait for 10 ns;
  clock <= '1';
wait for 10 ns;
  end process;


  process 
  begin
  --------state = off----
  cur_temp <= to_signed(0,8);
  des_temp <= to_signed(0,8);
  reset <= '0';
wait for 20 ns;
  -----------------------
  --------state = off->low
  cur_temp <= to_signed(20,8);
  des_temp <= to_signed(23,8);
  reset <= '0';
wait for 20 ns;
  -----------------------
  --------state = low->high
  cur_temp <= to_signed(20,8);
  des_temp <= to_signed(27,8);
  reset <= '0';
wait for 20 ns;
  -----------------------
  --------state = high->low
  cur_temp <= to_signed(24,8);
  des_temp <= to_signed(20,8);
  reset <= '0';
wait for 20 ns;
  -----------------------
    --------state = low->off
  cur_temp <= to_signed(23,8);
  des_temp <= to_signed(20,8);
  reset <= '0';
wait for 20 ns;
  -----------------------
  --------state = off->high
  cur_temp <= to_signed(20,8);
  des_temp <= to_signed(25,8);
  reset <= '0';
wait for 20 ns;
  -----------------------
  --------state = high (RESET)
  reset <= '1';
  cur_temp <= to_signed(23,8);
  des_temp <= to_signed(20,8);
wait for 20 ns;
  -----------------------
  --------state = off (RESET)
  reset <= '1';
  cur_temp <= to_signed(23,8);
  des_temp <= to_signed(20,8);
wait for 20 ns;
  -----------------------
  --------state = off->low (RESET)
  cur_temp <= to_signed(23,8);
  des_temp <= to_signed(20,8);
  reset <= '1';
  -----------------------
wait for 10 ns;
  end process;

end architecture;
