
-- 
-- Definition of  ctrl_oven
-- 
--      Mon 04 Jan 2021 03:43:15 PM CET
--      
--      LeonardoSpectrum Level 3, 2014a.12
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library c35_CORELIB;
use c35_CORELIB.vcomponents.all;

architecture behavioral_gray of ctrl_oven is
   signal current_state_1, nx631, current_state_2, nx632, nx2, 
      current_state_0, nx8, nx14, nx633, nx24, nx26, nx44, nx58, nx64, nx70, 
      nx78, nx88, nx100, nx114, nx120, nx138, nx146, nx168, nx180, nx206, 
      nx641, nx643, nx647, nx649, nx652, nx656, nx661, nx663, nx666, nx668, 
      nx670, nx673, nx675, nx679, nx683, nx685, nx687, nx689, nx695, nx697, 
      nx701, nx703, nx709, nx712, nx714, nx717, nx720, nx723, nx725, nx727, 
      nx729: std_logic ;

begin
   ix267 : OAI211 port map ( Q=>stop_count, A=>nx641, B=>nx643, C=>nx709);
   ix642 : CLKIN1 port map ( Q=>nx641, A=>door_open);
   ix644 : AOI221 port map ( Q=>nx643, A=>current_state_1, B=>nx632, C=>nx58, 
      D=>nx633);
   ix181 : NAND31 port map ( Q=>nx180, A=>nx647, B=>nx697, C=>nx703);
   ix648 : AOI221 port map ( Q=>nx647, A=>nx649, B=>nx88, C=>nx695, D=>nx70
   );
   ix650 : CLKIN1 port map ( Q=>nx649, A=>rst);
   ix89 : NOR21 port map ( Q=>nx88, A=>nx652, B=>current_state_0);
   reg_current_state_1 : DF1 port map ( Q=>current_state_1, QN=>nx652, C=>
      clk, D=>nx180);
   ix79 : NAND31 port map ( Q=>nx78, A=>nx656, B=>nx679, C=>nx689);
   ix657 : AOI211 port map ( Q=>nx656, A=>half_power, B=>nx70, C=>nx64);
   ix71 : NOR40 port map ( Q=>nx70, A=>rst, B=>current_state_2, C=>
      current_state_1, D=>nx670);
   ix101 : OAI2111 port map ( Q=>nx100, A=>rst, B=>nx661, C=>nx663, D=>nx668
   );
   ix662 : NAND21 port map ( Q=>nx661, A=>time_set, B=>nx88);
   ix664 : OAI211 port map ( Q=>nx663, A=>current_state_0, B=>
      current_state_1, C=>nx632);
   ix111 : NOR21 port map ( Q=>nx632, A=>rst, B=>nx666);
   reg_current_state_2 : DF1 port map ( Q=>current_state_2, QN=>nx666, C=>
      clk, D=>nx100);
   reg_current_state_0 : DF1 port map ( Q=>current_state_0, QN=>nx670, C=>
      clk, D=>nx78);
   ix65 : NOR40 port map ( Q=>nx64, A=>nx673, B=>full_power, C=>rst, D=>
      current_state_2);
   ix674 : AOI211 port map ( Q=>nx673, A=>half_power, B=>nx675, C=>nx44);
   ix676 : NOR21 port map ( Q=>nx675, A=>current_state_0, B=>current_state_1
   );
   ix45 : NOR40 port map ( Q=>nx44, A=>s120, B=>s60, C=>s30, D=>nx631);
   ix193 : NAND21 port map ( Q=>nx631, A=>current_state_0, B=>
      current_state_1);
   ix680 : AOI211 port map ( Q=>nx679, A=>nx168, B=>nx70, C=>nx206);
   ix169 : NOR40 port map ( Q=>nx168, A=>s120, B=>s60, C=>s30, D=>half_power
   );
   ix207 : NOR40 port map ( Q=>nx206, A=>nx683, B=>nx687, C=>rst, D=>
      current_state_2);
   ix684 : AOI221 port map ( Q=>nx683, A=>current_state_0, B=>
      current_state_1, C=>nx685, D=>nx675);
   ix686 : CLKIN1 port map ( Q=>nx685, A=>half_power);
   ix688 : CLKIN1 port map ( Q=>nx687, A=>full_power);
   ix690 : AOI2111 port map ( Q=>nx689, A=>nx8, B=>nx14, C=>nx26, D=>nx24);
   ix9 : NOR21 port map ( Q=>nx8, A=>timeout, B=>door_open);
   ix15 : NOR40 port map ( Q=>nx14, A=>rst, B=>nx666, C=>current_state_1, D
      =>nx670);
   ix27 : NOR40 port map ( Q=>nx26, A=>nx652, B=>door_open, C=>rst, D=>nx666
   );
   ix25 : NOR31 port map ( Q=>nx24, A=>nx661, B=>rst, C=>door_open);
   ix696 : CLKIN1 port map ( Q=>nx695, A=>nx168);
   ix698 : AOI311 port map ( Q=>nx697, A=>nx632, B=>nx146, C=>nx631, D=>
      nx138);
   ix147 : NOR31 port map ( Q=>nx146, A=>timeout, B=>nx641, C=>nx670);
   ix139 : NOR40 port map ( Q=>nx138, A=>nx701, B=>full_power, C=>rst, D=>
      current_state_2);
   ix702 : AOI221 port map ( Q=>nx701, A=>current_state_0, B=>
      current_state_1, C=>half_power, D=>nx675);
   ix704 : OAI211 port map ( Q=>nx703, A=>nx120, B=>door_open, C=>nx114);
   ix121 : NOR21 port map ( Q=>nx120, A=>start, B=>door_open);
   ix115 : NOR40 port map ( Q=>nx114, A=>nx670, B=>nx652, C=>rst, D=>nx666);
   ix59 : NOR21 port map ( Q=>nx58, A=>rst, B=>current_state_2);
   ix91 : CLKIN1 port map ( Q=>nx633, A=>nx661);
   ix710 : NAND31 port map ( Q=>nx709, A=>nx632, B=>nx652, C=>nx146);
   ix251 : OAI311 port map ( Q=>start_count, A=>timeout, B=>door_open, C=>
      nx712, D=>nx714);
   ix715 : NAND31 port map ( Q=>nx714, A=>nx114, B=>nx641, C=>start);
   ix239 : CLKIN1 port map ( Q=>finished, A=>nx717);
   ix718 : AOI221 port map ( Q=>nx717, A=>nx675, B=>nx2, C=>timeout, D=>nx14
   );
   ix3 : NOR21 port map ( Q=>nx2, A=>door_open, B=>nx720);
   ix231 : OAI2111 port map ( Q=>in_light, A=>nx641, B=>nx723, C=>nx725, D=>
      nx727);
   ix724 : OAI2111 port map ( Q=>nx723, A=>current_state_2, B=>time_set, C=>
      nx649, D=>nx88);
   ix726 : OAI211 port map ( Q=>nx725, A=>start, B=>door_open, C=>nx114);
   ix728 : NAND21 port map ( Q=>nx727, A=>nx729, B=>nx14);
   ix730 : CLKIN1 port map ( Q=>nx729, A=>timeout);
   ix713 : CLKIN1 port map ( Q=>nx712, A=>nx14);
   ix669 : CLKIN1 port map ( Q=>nx668, A=>nx2);
   ix721 : CLKIN1 port map ( Q=>nx720, A=>nx632);
   ix75 : CLKIN1 port map ( Q=>half, A=>nx656);
   ix211 : CLKIN1 port map ( Q=>full, A=>nx679);
end behavioral_gray ;

