
-- 
-- Definition of  heatingsys
-- 
--      Wed May 16 13:32:44 2012
--      
--      Precision RTL Synthesis, 2008a.47
-- 

library IEEE;library altera_mf;library lpm;library altera; 
 use IEEE.STD_LOGIC_1164.ALL;
 use altera_mf.altera_mf_components.all, lpm.lpm_components.all, altera.altera_primitives_components.all;

entity heatingsys is 
   port (
      i_cur_temp : IN std_logic_vector (7 DOWNTO 0) ;
      i_des_temp : IN std_logic_vector (7 DOWNTO 0) ;
      i_reset : IN std_logic ;
      i_clock : IN std_logic ;
      o_heatmode : OUT std_logic_vector (1 DOWNTO 0)) ;
end heatingsys ;

architecture main of heatingsys is 
   component sub_8u_8u_8u_0
      port (
         cin : IN std_logic ;
         a : IN std_logic_vector (7 DOWNTO 0) ;
         b : IN std_logic_vector (7 DOWNTO 0) ;
         d : OUT std_logic_vector (7 DOWNTO 0) ;
         cout : OUT std_logic) ;
   end component ;
   component and_3u_3u
      port (
         a : IN std_logic_vector (2 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
   component or_6u_6u
      port (
         a : IN std_logic_vector (5 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
   component or_5u_5u
      port (
         a : IN std_logic_vector (4 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
   component or_3u_3u
      port (
         a : IN std_logic_vector (2 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
   procedure DFFRSE (
      constant data   : in std_logic;
      constant set    : in std_logic;
      constant reset  : in std_logic;
      constant enable : in std_logic;
      signal clk      : in std_logic;
      signal q        : out std_logic)
   is begin
       if (clk'event and clk'last_value = '0' and clk = '1') then
           if (reset = '1') then
               q <= '0' ;
           elsif (set = '1') then
               q <= '1' ;
           elsif (enable = '1') then
               q <= data and data ;    -- takes care of q<='X' if data='Z'
           end if ;
       end if ;
       if ((set/='1' or reset/='1') and clk/='0' and clk/='1') then
           q <= 'X' ;
       end if ;
   end DFFRSE ;
   signal o_heatmode_EXMPLR22: std_logic_vector (1 DOWNTO 0) ;
   
   signal PWR, GND, not_rtlc1n409, rtlc1n187, rtlc1_PS10_n196: std_logic ;
   
   signal rtlc1n266: std_logic_vector (7 DOWNTO 0) ;
   
   signal rtlc1n404, rtlc1n406, not_rtlcn2, rtlc1n409, rtlc1n477, 
      not_rtlc1n477, not_rtlc1n266_2, not_rtlc1n266_1, not_rtlc1n266_0, 
      rtlc1n482, rtlc1n483, rtlc1n484, rtlc1n485, rtlc1n557, not_rtlcn3, 
      rtlc1n560, not_rtlc1n266_7, rtlc1n574, rtlcn2, rtlcn3, rtlcn21, 
      not_rtlc1n560, rtlcn32, not_rtlc1n574, rtlcn34, not_rtlcn39, rtlcn39, 
      not_o_heatmode_1: std_logic ;
   
   signal DANGLING : std_logic_vector (0 downto 0 );

begin
   o_heatmode(1) <= o_heatmode_EXMPLR22(1) ;
   o_heatmode(0) <= o_heatmode_EXMPLR22(0) ;
   PWR <= '1' ;
   GND <= '0' ;
   not_rtlc1n409 <= NOT rtlc1n409 ;
   rtlc1_29_sub_0 : sub_8u_8u_8u_0 port map ( cin=>PWR, a(7)=>i_cur_temp(7), 
      a(6)=>i_cur_temp(6), a(5)=>i_cur_temp(5), a(4)=>i_cur_temp(4), a(3)=>
      i_cur_temp(3), a(2)=>i_cur_temp(2), a(1)=>i_cur_temp(1), a(0)=>
      i_cur_temp(0), b(7)=>i_des_temp(7), b(6)=>i_des_temp(6), b(5)=>
      i_des_temp(5), b(4)=>i_des_temp(4), b(3)=>i_des_temp(3), b(2)=>
      i_des_temp(2), b(1)=>i_des_temp(1), b(0)=>i_des_temp(0), d(7)=>
      rtlc1n266(7), d(6)=>rtlc1n266(6), d(5)=>rtlc1n266(5), d(4)=>
      rtlc1n266(4), d(3)=>rtlc1n266(3), d(2)=>rtlc1n266(2), d(1)=>
      rtlc1n266(1), d(0)=>rtlc1n266(0), cout=>DANGLING(0));
   rtlc1n187 <= not_rtlc1n409 AND rtlc1n485 ;
   rtlc1n409 <= not_rtlcn2 OR rtlc1n266(7) ;
   not_rtlc1n477 <= NOT rtlc1n477 ;
   not_rtlc1n266_2 <= NOT rtlc1n266(2) ;
   not_rtlc1n266_1 <= NOT rtlc1n266(1) ;
   not_rtlc1n266_0 <= NOT rtlc1n266(0) ;
   rtlc1n482 <= not_rtlc1n266_1 AND not_rtlc1n266_0 ;
   rtlc1n483 <= not_rtlc1n266_2 OR rtlc1n482 ;
   rtlc1n484 <= not_rtlc1n477 AND rtlc1n483 ;
   rtlc1n485 <= rtlc1n484 OR rtlc1n266(7) ;
   rtlc1_108_and_1 : and_3u_3u port map ( a(2)=>rtlc1n266(2), a(1)=>
      rtlc1n266(1), a(0)=>rtlc1n266(0), d=>rtlc1n557);
   rtlc1n560 <= not_rtlcn3 OR rtlc1n266(7) ;
   not_rtlc1n266_7 <= NOT rtlc1n266(7) ;
   rtlc1n574 <= rtlc1n404 AND not_rtlc1n266_7 ;
   rtlc_4_or_2 : or_6u_6u port map ( a(5)=>rtlc1n266(2), a(4)=>rtlc1n266(3), 
      a(3)=>rtlc1n266(4), a(2)=>rtlc1n266(5), a(1)=>rtlc1n266(6), a(0)=>
      rtlc1n266(7), d=>rtlc1n404);
   rtlc1n406 <= rtlc1n266(1) AND rtlc1n266(0) ;
   not_rtlcn2 <= NOT rtlcn2 ;
   rtlc_8_or_3 : or_5u_5u port map ( a(4)=>rtlc1n266(3), a(3)=>rtlc1n266(4), 
      a(2)=>rtlc1n266(5), a(1)=>rtlc1n266(6), a(0)=>rtlc1n266(7), d=>
      rtlc1n477);
   not_rtlcn3 <= NOT rtlcn3 ;
   not_rtlc1n560 <= NOT rtlc1n560 ;
   rtlcn32 <= not_rtlc1n560 AND rtlc1_PS10_n196 ;
   not_rtlc1n574 <= NOT rtlc1n574 ;
   rtlcn34 <= not_rtlc1n574 AND o_heatmode_EXMPLR22(1) ;
   rtlc_44_or_4 : or_3u_3u port map ( a(2)=>rtlcn32, a(1)=>rtlcn34, a(0)=>
      not_rtlcn39, d=>rtlcn21);
   not_rtlcn39 <= NOT rtlcn39 ;
   rtlcn3 <= rtlc1n477 OR rtlc1n557 ;
   not_o_heatmode_1 <= NOT o_heatmode_EXMPLR22(1) ;
   rtlcn2 <= rtlc1n404 OR rtlc1n406 ;
   rtlcn39 <= rtlc1n187 OR o_heatmode_EXMPLR22(0) ;
   rtlc1_PS10_n196 <= not_o_heatmode_1 AND o_heatmode_EXMPLR22(0) ;
   DFFRSE (rtlcn21,GND,i_reset,PWR,i_clock,o_heatmode_EXMPLR22(1)) ;
   DFFRSE (PWR,GND,i_reset,PWR,i_clock,o_heatmode_EXMPLR22(0)) ;
end main ;

