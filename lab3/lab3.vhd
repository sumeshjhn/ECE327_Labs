library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab3 is
  port (
    i_clock    : in std_logic;                     -- the system clock
    i_valid    : in std_logic;                     -- if data is available 
    i_input    : in std_logic_vector(7 downto 0);  -- input data
    i_reset    : in std_logic;                     -- reset
    o_output   : out std_logic_vector(7 downto 0)  -- output data
  );
end entity lab3;

architecture main of lab3 is
signal counter : signed(7 downto 0);
signal weB0 : std_logic:='0';
type bankElement is array(0 to 2) of unsigned(7 downto 0);
signal bankElementArray : bankElement(15 downto 0);
begin

	sumLoop: for i in 0 to 2 generate
		-- instantiate the entities here 
	end generate sumLoop;

	firstBank: entity work.mem(main)
	  port map (
	   address=> ,
	   clock=>i_clock,
	   data=> ,
           wren=> weB0,
	   q=>
	);

	secondBank: entity work.mem(main)
	  port map (
	   address=> ,
	   clock=>i_clock,
	   data=> ,
           wren=> weB1,
	   q=>bank1
	);

	thirdBank: entity work.mem(main)
	  port map (
	   address=> ,
	   clock=>i_clock,
	   data=> ,
           wren=> weB2,
	   q=>bank2
	);

	process (i_clock, i_reset)
	begin
	if (rising_edge(i_clock)) then
		if (i_reset='1') then
			counter = to_signed(0,8);
			-- insert code to clear the matrix here
			i_reset = '0';
		else
			-- first byte is the first element in the EMPTY matrix
				
		end if;
	end if;
	end process;

   process(i_valid, i_input) begin
	if (i_valid='1') then
	    --check to reset x (and y if x=16)
              --also do check to see if matrix is full (if it is, reset x and y to oldest element)
            --add to matrix
              --when we hit y=2 and x =0, start calculating output until we hit the end of the third row
                --increment 'counter' each time the condition in the manual is satisfied 
	    --increment x 
	end if; 
   end process;

end architecture main;
--Notes:
-- 1) mem.vhd wtf is an addres
-- 2) check to see if the algorithm is feasible
-- 3) proper way to set up the banks
-- 4) (main reasin derrived from 3)) how to use wren
-- 5) 

-- Q1: number of flip flops and lookup tables?
--

-- Q2: maximum clock frequency?
--

-- Q3: source and destination signals of critical path?
-- 

