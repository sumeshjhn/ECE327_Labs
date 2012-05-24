------------------------------------------------------------------------
-- fir test bench
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.fir_synth_pkg.all;

entity fir_tb is
end entity;

------------------------------------------------------------------------

architecture main of fir_tb is
	signal i_data	: word;
	signal clock	: std_logic; 	
	signal o_data	: word;
begin
	
	uut : entity work.fir(low_pass)
    port map (
      i_data => i_data,
      clk => clock,
      o_data => o_data
    );
 
	process 
		begin
			clock <= '0';
			wait for 5 ns;
			clock <= '1';
			wait for 5 ns;
		end process;
	
	
	process 
		begin
			i_data <= x"0000";
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			i_data <= x"0010";
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
			wait until rising_edge(clock);
	end process;
end architecture;
------------------------------------------------------------------------

