library ieee;
use ieee.std_logic_1164.all;

package heat_pkg is
  subtype heat_ty is std_logic_vector(1 downto 0);
  constant off  : heat_ty := "00";
  constant low  : heat_ty := "01";
  constant high : heat_ty := "11";
end heat_pkg;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.heat_pkg.all;

entity heatingsys is                           -- finite state machine
  port(i_cur_temp       : in signed(7 downto 0); -- current temp
       i_des_temp       : in signed(7 downto 0); -- desired temp
       i_reset          : in std_logic;          -- reset
       i_clock          : in std_logic;          -- clock
       o_heatmode       : out heat_ty            -- mode
      );
end heatingsys;

architecture main of heatingsys is
  signal state : heat_ty;   
begin

  -- insert your vhdl code here
  process (i_clock, i_reset)
    begin
    if rising_edge(i_clock) then
     if (i_reset = '1') then
      state <= OFF;
     else
      case state is 
        when OFF =>
          if ((3 <= (i_cur_temp - i_des_temp)) AND ((i_cur_temp - i_des_temp)  < 5)) then
            state <= LOW;
          else 
           -- shouldn't need this --  if (5 <= (i_des_temp - i_cur_temp))
              state <= HIGH;
           -- shouldn't need this -- end if;
          end if;
        when LOW =>
          if (7 <= (i_cur_temp - i_des_temp)) then
            state <= HIGH;
          else
            -- shouldn't need this -- if (2 < (i_cur_temp - i_des_temp))
            state <= LOW;
            -- shouldn't need this -- end if
          end if; 
        when HIGH =>
          if (3 < (i_cur_temp - i_des_temp)) then
            state <= LOW;
          else
            -- to avoid the "implicit" flip flop, we add this else statement
            state <= HIGH;
          end if;
        when others =>
          --failsafe
          state <= OFF;
      end case;  
    end if;
    end if;
  end process;

--the state is the output
  o_heatmode <= state; 
               
end main;

-- question 1
  --1-bit flip-flops: 2
  --ANDs: 9
  --ORs: 10
  --NOTs: 12
  --Subtractors: 1 

