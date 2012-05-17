library ieee;
use ieee.std_logic_1164.all;

-- insert entity definition here
entity add2 is
	port (
		signal i_a, i_b: in std_logic_vector(1 downto 0);
		signal i_cin: in std_logic; 
		signal o_cout: out std_logic;
		signal o_sum: out std_logic_vector(1 downto 0)
	);
end add2;

-- insert architecture here
architecture main of add2 is 
signal fa0_cout: std_logic;
begin
u_fa0 : entity work.fulladder(main)
    port map (
      i_a   => i_a(0),
      i_b   => i_b(0),
      i_cin => i_cin,
      o_cout => fa0_cout,
      o_sum => o_sum(0)
    );

u_fa1 : entity work.fulladder(main)
    port map (
      i_a   => i_a(1),
      i_b   => i_b(1),
      o_cout => o_cout,
      i_cin => fa0_cout,
      o_sum => o_sum(1)
    );
end main; 

