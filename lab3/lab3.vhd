library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compute is
  port (
    i_clock	  : in std_logic;			
    i_i1, i_i2    : in signed(7 downto 0);  
    o_p   	  : out signed(7 downto 0)  -- output data
  );
end entity compute;

----see section 2.7.8 VHDL Implementation #2
---- r1 = i1-i2 and r2 <= i2 (from next cycle)
---- r1 + r2 becomes output
architecture p_compute of compute is
signal r1, r2 : signed (7 downto 0);
begin
	process
	begin
		wait until rising_edge(i_clock);
		r1 <= i_i1;
		r2 <= i_i2;
		wait until rising_edge(i_clock);
		r1 <= r1 - r2;
		r2 <= i_i2;
		wait until rising_edge(i_clock);
		r1 <= r1 + r2;
	end process;
	o_p <= r1;
end architecture;

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
signal counter : unsigned(7 downto 0);				-- number of times the condition is met
signal wrenArray : std_logic_vector (2 downto 0);	-- write  enable array for the banks (write only one bank at a time)
signal col : std_logic_vector (3 downto 0);			-- the 16 column indexer
signal row : std_logic_vector(2 downto 0);
type bankElement is array(2 downto 0) of std_logic_vector(7 downto 0);	-- DATA-TYPE: the 3 row column, each cell 8 bits wide
								   -- mem.vhd is the 16 column row, and we are instantiating it 3 times
signal bankElementArray : bankElement;				-- the "window" or reference to see the column; we access the three rows
signal enough_data : std_logic;
signal i1, i2, internal_p : signed (7 downto 0);
signal total_rows : unsigned (7 downto 0);
begin
	memBank0: entity work.mem(main)
		port map (
			address => col, 
			clock => i_clock,
			data => i_input,
			wren => wrenArray(0),
			q => bankElementArray(0)
		);

	memBank1: entity work.mem(main)
		port map (
			address => col, 
			clock => i_clock,
			data => i_input,
			wren => wrenArray(1),
			q => bankElementArray(1)
		);

	memBank2: entity work.mem(main)
		port map (
			address => col, 
			clock => i_clock,
			data => i_input,
			wren => wrenArray(2),
			q => bankElementArray(2)
		);

	ComputeP: entity work.compute(p_compute)
	  port map (
	    i_clock => i_clock,			
	    i_i1 => i1,
	    i_i2 => i2,  
	    o_p => internal_p
	  );

--LEGEND: NED = not enough data, ED = enough data
--idle--
--check for valid data
--once valid...go to NED state
	process 
	begin
		wait until (rising_edge(i_clock)); 
		if (row="010") then
			enough_data <= '1';
			counter <= to_unsigned(0,8);
		end if;
		
	end process;

	process 
	begin
		wait until (rising_edge(i_clock)); 
			if ((i_reset='1') OR (total_rows=15)) then
				col <= "0000";
				row <= "000";
				enough_data <= '0';
				total_rows <= to_unsigned(0,8);
			end if;
		
	end process;

--this process has a problem with all the wait untils...we need to break it down
-- new statemachine?
-- multiple processes?
	process  
	begin
		wait until rising_edge(i_clock);
			if (i_valid='1' AND i_reset='0') then
				wrenArray(to_integer(unsigned(row))) <= '1';
				wait until rising_edge(i_clock);
				bankElementArray(to_integer(unsigned(row))) <= i_input;
				wrenArray(to_integer(unsigned(row))) <= '0';
				wait until rising_edge(i_clock);
				if (enough_data = '1') then
					case row is 
						when "000" =>
					  		i1 <= signed(bankElementArray(to_integer((signed(row))+1)));
					  		i2 <= signed(bankElementArray(to_integer((signed(row))+2)));
						when "001" =>
					  		i1 <= signed(bankElementArray(to_integer((signed(row))+1)));
					  		i2 <= signed(bankElementArray(to_integer((signed(row))-1)));
						when "010" =>
					  		i1 <= signed(bankElementArray(to_integer((signed(row))-2)));
					  		i2 <= signed(bankElementArray(to_integer((signed(row))-1)));
						when others =>
							--failsafe
					end case;
					wait until rising_edge(i_clock);
					i2 <= signed(bankElementArray(to_integer((signed(row)))));
					wait until rising_edge(i_clock);
					if (internal_p >= to_signed(0,8)) then
						counter <= counter + 1;
						o_output <= std_logic_vector(counter);
					end if; 	
							
				end if;
				col <= std_logic_vector(unsigned(col)+1);
				if NOT(to_integer(unsigned(col)) < 16) then
					row <= std_logic_vector(unsigned(row) + 1);
					total_rows <= total_rows + 1;
					if (row > "010") then
						row <= "000";
					end if;
					col <= "0000";
				end if;	
			end if;
	end process;

end architecture main;


--Notes:
-- 2) check to see if the algorithm is feasible

-- 3) proper way to set up the banks
-- 4) (main reasin derrived from 3)) how to use wren

-- Q1: number of flip flops and lookup tables?
--

-- Q2: maximum clock frequency?
--

-- Q3: source and destination signals of critical path?
-- 

