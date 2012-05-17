
-- 
-- Definition of  heatingsys
-- 
--      Thu May 17 15:14:58 2012
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
   component or_5u_5u
      port (
         a : IN std_logic_vector (4 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
   component or_6u_6u
      port (
         a : IN std_logic_vector (5 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
   component and_4u_4u
      port (
         a : IN std_logic_vector (3 DOWNTO 0) ;
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
   component or_7u_7u
      port (
         a : IN std_logic_vector (6 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
   signal o_heatmode_EXMPLR22: std_logic_vector (1 DOWNTO 0) ;
   
   signal PWR, GND, not_o_heatmode_0, not_rtlc1n543, rtlc1n211, 
      rtlc1_PS14_n272: std_logic ;
   
   signal rtlc1n286: std_logic_vector (7 DOWNTO 0) ;
   
   signal rtlc1n395: std_logic_vector (7 DOWNTO 0) ;
   
   signal rtlc1n540, not_rtlcn2, rtlc1n543, rtlc1n611, not_rtlc1n611, 
      not_rtlc1n286_2, not_rtlc1n286_1, not_rtlc1n286_0, rtlc1n616, 
      rtlc1n617, rtlc1n618, rtlc1n619, rtlc1n691, not_rtlcn3, rtlc1n694, 
      rtlc1n717, rtlc1n735, rtlcn2, rtlcn3, not_rtlcn64, rtlcn51, rtlcn64, 
      rtlcn65, rtlcn66, not_rtlc1n211, rtlcn68, not_rtlc1n395_7, rtlcn70, 
      not_rtlc1n694, rtlcn72, not_rtlc1n735, rtlcn74, not_rtlcn79, rtlcn79, 
      not_o_heatmode_1: std_logic ;
   
   signal DANGLING : std_logic_vector (1 downto 0 );

begin
   o_heatmode(1) <= o_heatmode_EXMPLR22(1) ;
   o_heatmode(0) <= o_heatmode_EXMPLR22(0) ;
   PWR <= '1' ;
   GND <= '0' ;
   not_rtlc1n543 <= NOT rtlc1n543 ;
   rtlc1_44_sub_0 : sub_8u_8u_8u_0 port map ( cin=>PWR, a(7)=>i_cur_temp(7), 
      a(6)=>i_cur_temp(6), a(5)=>i_cur_temp(5), a(4)=>i_cur_temp(4), a(3)=>
      i_cur_temp(3), a(2)=>i_cur_temp(2), a(1)=>i_cur_temp(1), a(0)=>
      i_cur_temp(0), b(7)=>i_des_temp(7), b(6)=>i_des_temp(6), b(5)=>
      i_des_temp(5), b(4)=>i_des_temp(4), b(3)=>i_des_temp(3), b(2)=>
      i_des_temp(2), b(1)=>i_des_temp(1), b(0)=>i_des_temp(0), d(7)=>
      rtlc1n395(7), d(6)=>rtlc1n395(6), d(5)=>rtlc1n395(5), d(4)=>
      rtlc1n395(4), d(3)=>rtlc1n395(3), d(2)=>rtlc1n395(2), d(1)=>
      rtlc1n395(1), d(0)=>rtlc1n395(0), cout=>DANGLING(0));
   rtlc1_59_sub_1 : sub_8u_8u_8u_0 port map ( cin=>PWR, a(7)=>i_des_temp(7), 
      a(6)=>i_des_temp(6), a(5)=>i_des_temp(5), a(4)=>i_des_temp(4), a(3)=>
      i_des_temp(3), a(2)=>i_des_temp(2), a(1)=>i_des_temp(1), a(0)=>
      i_des_temp(0), b(7)=>i_cur_temp(7), b(6)=>i_cur_temp(6), b(5)=>
      i_cur_temp(5), b(4)=>i_cur_temp(4), b(3)=>i_cur_temp(3), b(2)=>
      i_cur_temp(2), b(1)=>i_cur_temp(1), b(0)=>i_cur_temp(0), d(7)=>
      rtlc1n286(7), d(6)=>rtlc1n286(6), d(5)=>rtlc1n286(5), d(4)=>
      rtlc1n286(4), d(3)=>rtlc1n286(3), d(2)=>rtlc1n286(2), d(1)=>
      rtlc1n286(1), d(0)=>rtlc1n286(0), cout=>DANGLING(1));
   rtlc1n211 <= not_rtlc1n543 AND rtlc1n619 ;
   not_o_heatmode_0 <= NOT o_heatmode_EXMPLR22(0) ;
   rtlc1n543 <= not_rtlcn2 OR rtlc1n286(7) ;
   not_rtlc1n611 <= NOT rtlc1n611 ;
   not_rtlc1n286_2 <= NOT rtlc1n286(2) ;
   not_rtlc1n286_1 <= NOT rtlc1n286(1) ;
   not_rtlc1n286_0 <= NOT rtlc1n286(0) ;
   rtlc1n616 <= not_rtlc1n286_1 AND not_rtlc1n286_0 ;
   rtlc1n617 <= not_rtlc1n286_2 OR rtlc1n616 ;
   rtlc1n618 <= not_rtlc1n611 AND rtlc1n617 ;
   rtlc1n619 <= rtlc1n618 OR rtlc1n286(7) ;
   rtlc1_145_and_2 : and_3u_3u port map ( a(2)=>rtlc1n286(2), a(1)=>
      rtlc1n286(1), a(0)=>rtlc1n286(0), d=>rtlc1n691);
   rtlc1n694 <= not_rtlcn3 OR rtlc1n286(7) ;
   rtlc1n735 <= rtlc1n717 AND not_rtlc1n395_7 ;
   rtlc1n540 <= rtlc1n286(1) AND rtlc1n286(0) ;
   not_rtlcn2 <= NOT rtlcn2 ;
   rtlc_8_or_4 : or_5u_5u port map ( a(4)=>rtlc1n286(3), a(3)=>rtlc1n286(4), 
      a(2)=>rtlc1n286(5), a(1)=>rtlc1n286(6), a(0)=>rtlc1n286(7), d=>
      rtlc1n611);
   not_rtlcn3 <= NOT rtlcn3 ;
   rtlc_70_or_5 : or_6u_6u port map ( a(5)=>rtlc1n395(2), a(4)=>rtlc1n395(3), 
      a(3)=>rtlc1n395(4), a(2)=>rtlc1n395(5), a(1)=>rtlc1n395(6), a(0)=>
      rtlc1n395(7), d=>rtlc1n717);
   rtlcn66 <= rtlc1n395(0) AND rtlc1n395(1) ;
   rtlcn65 <= rtlc1n717 OR rtlcn66 ;
   not_rtlc1n211 <= NOT rtlc1n211 ;
   rtlc_74_and_6 : and_3u_3u port map ( a(2)=>rtlc1n619, a(1)=>not_rtlc1n211, 
      a(0)=>not_o_heatmode_0, d=>rtlcn68);
   not_rtlc1n395_7 <= NOT rtlc1n395(7) ;
   rtlc_76_and_7 : and_4u_4u port map ( a(3)=>rtlc1n694, a(2)=>
      not_rtlc1n395_7, a(1)=>rtlc1_PS14_n272, a(0)=>rtlcn65, d=>rtlcn70);
   rtlcn64 <= rtlcn68 OR rtlcn70 ;
   not_rtlcn64 <= NOT rtlcn64 ;
   not_rtlc1n694 <= NOT rtlc1n694 ;
   rtlcn72 <= not_rtlc1n694 AND rtlc1_PS14_n272 ;
   not_rtlc1n735 <= NOT rtlc1n735 ;
   rtlcn74 <= not_rtlc1n735 AND o_heatmode_EXMPLR22(1) ;
   rtlc_87_or_8 : or_3u_3u port map ( a(2)=>rtlcn72, a(1)=>rtlcn74, a(0)=>
      not_rtlcn79, d=>rtlcn51);
   not_rtlcn79 <= NOT rtlcn79 ;
   rtlcn79 <= rtlc1n619 OR o_heatmode_EXMPLR22(0) ;
   rtlcn3 <= rtlc1n611 OR rtlc1n691 ;
   not_o_heatmode_1 <= NOT o_heatmode_EXMPLR22(1) ;
   rtlc1_PS14_n272 <= not_o_heatmode_1 AND o_heatmode_EXMPLR22(0) ;
   DFFRSE (rtlcn51,GND,i_reset,PWR,i_clock,o_heatmode_EXMPLR22(1)) ;
   DFFRSE (not_rtlcn64,GND,i_reset,PWR,i_clock,o_heatmode_EXMPLR22(0)) ;
   modgen_or_0 : or_7u_7u port map ( a(6)=>rtlc1n286(2), a(5)=>rtlc1n286(3), 
      a(4)=>rtlc1n286(4), a(3)=>rtlc1n286(5), a(2)=>rtlc1n286(6), a(1)=>
      rtlc1n286(7), a(0)=>rtlc1n540, d=>rtlcn2);
end main ;

