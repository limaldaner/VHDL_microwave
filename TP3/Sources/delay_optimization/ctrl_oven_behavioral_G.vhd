
-- 
-- Definition of  ctrl_oven
-- 
--      Mon 04 Jan 2021 03:56:31 PM CET
--      
--      LeonardoSpectrum Level 3, 2014a.12
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ctrl_oven is
   port (
      clk : IN std_logic ;
      rst : IN std_logic ;
      half_power : IN std_logic ;
      full_power : IN std_logic ;
      start : IN std_logic ;
      s30 : IN std_logic ;
      s60 : IN std_logic ;
      s120 : IN std_logic ;
      time_set : IN std_logic ;
      door_open : IN std_logic ;
      timeout : IN std_logic ;
      full : OUT std_logic ;
      half : OUT std_logic ;
      in_light : OUT std_logic ;
      finished : OUT std_logic ;
      start_count : OUT std_logic ;
      stop_count : OUT std_logic) ;
end ctrl_oven ;

architecture behavioral of ctrl_oven is
   signal current_state_1, nx631, current_state_2, nx632, nx2, 
      current_state_0, nx16, nx633, nx24, nx44, nx46, nx58, nx64, nx70, nx78, 
      nx88, nx100, nx114, nx120, nx138, nx146, nx168, nx180, nx202, nx204, 
      nx220, nx641, nx643, nx647, nx649, nx652, nx656, nx661, nx663, nx666, 
      nx668, nx670, nx673, nx675, nx679, nx681, nx686, nx689, nx692, nx696, 
      nx698, nx700, nx704, nx706, nx712, nx714, nx717, nx720, nx723, nx725, 
      nx728, nx731, nx734, nx736, nx738: std_logic ;

begin
   ix267 : OAI211 port map ( Q=>stop_count, A=>nx641, B=>nx643, C=>nx714);
   ix642 : CLKIN1 port map ( Q=>nx641, A=>door_open);
   ix644 : AOI221 port map ( Q=>nx643, A=>current_state_1, B=>nx632, C=>nx58, 
      D=>nx633);
   ix181 : NAND31 port map ( Q=>nx180, A=>nx647, B=>nx700, C=>nx706);
   ix648 : AOI221 port map ( Q=>nx647, A=>nx649, B=>nx88, C=>nx698, D=>nx70
   );
   ix650 : CLKIN1 port map ( Q=>nx649, A=>rst);
   ix89 : NOR21 port map ( Q=>nx88, A=>nx652, B=>current_state_0);
   reg_current_state_1 : DF1 port map ( Q=>current_state_1, QN=>nx652, C=>
      clk, D=>nx180);
   ix79 : NAND31 port map ( Q=>nx78, A=>nx656, B=>nx681, C=>nx689);
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
   ix669 : NAND21 port map ( Q=>nx668, A=>nx641, B=>nx632);
   reg_current_state_0 : DF1 port map ( Q=>current_state_0, QN=>nx670, C=>
      clk, D=>nx78);
   ix65 : NOR31 port map ( Q=>nx64, A=>nx673, B=>full_power, C=>nx679);
   ix674 : AOI211 port map ( Q=>nx673, A=>half_power, B=>nx675, C=>nx44);
   ix676 : NOR21 port map ( Q=>nx675, A=>current_state_0, B=>current_state_1
   );
   ix45 : NOR40 port map ( Q=>nx44, A=>s120, B=>s60, C=>s30, D=>nx631);
   ix193 : NAND21 port map ( Q=>nx631, A=>current_state_0, B=>
      current_state_1);
   ix680 : NAND21 port map ( Q=>nx679, A=>nx649, B=>nx666);
   ix682 : AOI221 port map ( Q=>nx681, A=>nx202, B=>nx204, C=>nx168, D=>nx70
   );
   ix203 : OAI211 port map ( Q=>nx202, A=>half_power, B=>nx46, C=>nx631);
   ix47 : NAND21 port map ( Q=>nx46, A=>nx670, B=>nx652);
   ix205 : NOR21 port map ( Q=>nx204, A=>nx686, B=>nx679);
   ix687 : CLKIN1 port map ( Q=>nx686, A=>full_power);
   ix169 : NOR40 port map ( Q=>nx168, A=>s120, B=>s60, C=>s30, D=>half_power
   );
   ix690 : AOI2111 port map ( Q=>nx689, A=>current_state_1, B=>nx2, C=>nx24, 
      D=>nx16);
   ix3 : NOR21 port map ( Q=>nx2, A=>door_open, B=>nx692);
   ix693 : NAND21 port map ( Q=>nx692, A=>nx649, B=>current_state_2);
   ix25 : NOR31 port map ( Q=>nx24, A=>nx661, B=>rst, C=>door_open);
   ix17 : NOR31 port map ( Q=>nx16, A=>timeout, B=>door_open, C=>nx696);
   ix697 : NAND31 port map ( Q=>nx696, A=>nx632, B=>nx652, C=>
      current_state_0);
   ix699 : CLKIN1 port map ( Q=>nx698, A=>nx168);
   ix701 : AOI311 port map ( Q=>nx700, A=>nx632, B=>nx146, C=>nx631, D=>
      nx138);
   ix147 : NOR31 port map ( Q=>nx146, A=>timeout, B=>nx641, C=>nx670);
   ix139 : AOI2111 port map ( Q=>nx138, A=>nx704, B=>nx631, C=>full_power, D
      =>nx679);
   ix705 : NAND21 port map ( Q=>nx704, A=>half_power, B=>nx675);
   ix707 : OAI211 port map ( Q=>nx706, A=>nx120, B=>door_open, C=>nx114);
   ix121 : NOR21 port map ( Q=>nx120, A=>start, B=>door_open);
   ix115 : NOR21 port map ( Q=>nx114, A=>nx631, B=>nx692);
   ix59 : NOR21 port map ( Q=>nx58, A=>rst, B=>current_state_2);
   ix91 : NOR31 port map ( Q=>nx633, A=>nx712, B=>nx652, C=>current_state_0
   );
   ix713 : CLKIN1 port map ( Q=>nx712, A=>time_set);
   ix715 : NAND31 port map ( Q=>nx714, A=>nx632, B=>nx652, C=>nx146);
   ix251 : OAI311 port map ( Q=>start_count, A=>timeout, B=>door_open, C=>
      nx696, D=>nx717);
   ix718 : NAND31 port map ( Q=>nx717, A=>nx114, B=>nx641, C=>start);
   ix239 : OAI221 port map ( Q=>finished, A=>nx720, B=>nx696, C=>nx46, D=>
      nx668);
   ix721 : CLKIN1 port map ( Q=>nx720, A=>timeout);
   ix231 : OAI211 port map ( Q=>in_light, A=>timeout, B=>nx696, C=>nx723);
   ix724 : AOI221 port map ( Q=>nx723, A=>nx725, B=>nx114, C=>door_open, D=>
      nx220);
   ix726 : CLKIN1 port map ( Q=>nx725, A=>nx120);
   ix221 : AOI2111 port map ( Q=>nx220, A=>nx666, B=>nx712, C=>rst, D=>nx728
   );
   ix729 : NAND21 port map ( Q=>nx728, A=>current_state_1, B=>nx670);
   ix75 : OAI311 port map ( Q=>half, A=>nx673, B=>full_power, C=>nx679, D=>
      nx731);
   ix732 : NAND21 port map ( Q=>nx731, A=>half_power, B=>nx70);
   ix211 : OAI311 port map ( Q=>full, A=>nx734, B=>nx686, C=>nx679, D=>nx738
   );
   ix735 : AOI221 port map ( Q=>nx734, A=>current_state_0, B=>
      current_state_1, C=>nx736, D=>nx675);
   ix737 : CLKIN1 port map ( Q=>nx736, A=>half_power);
   ix739 : NAND21 port map ( Q=>nx738, A=>nx168, B=>nx70);
end behavioral ;

