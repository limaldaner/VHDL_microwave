
-- 
-- Definition of  ctrl_oven
-- 
--      Mon 04 Jan 2021 03:57:04 PM CET
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
   signal current_state_2, nx2, nx6, nx603, current_state_1, nx605, 
      current_state_0, nx14, nx20, nx38, nx42, nx48, nx54, nx64, nx70, nx74, 
      nx76, nx86, nx100, nx118, nx120, nx126, nx134, nx158, nx186, nx224, 
      nx232, nx274, nx614, nx616, nx618, nx621, nx624, nx626, nx630, nx633, 
      nx635, nx638, nx640, nx645, nx647, nx651, nx654, nx656, nx658, nx661, 
      nx664, nx666, nx672, nx674, nx677, nx680, nx683, nx685, nx688, nx690, 
      nx692, nx696, nx698, nx700, nx704, nx707, nx713: std_logic ;

begin
   ix279 : OAI211 port map ( Q=>stop_count, A=>nx614, B=>nx661, C=>nx690);
   ix615 : NAND31 port map ( Q=>nx614, A=>nx616, B=>door_open, C=>time_set);
   ix617 : NOR21 port map ( Q=>nx616, A=>nx618, B=>nx651);
   ix87 : NAND41 port map ( Q=>nx86, A=>nx621, B=>nx674, C=>nx677, D=>nx680
   );
   ix622 : NAND21 port map ( Q=>nx621, A=>nx6, B=>nx640);
   ix7 : NOR21 port map ( Q=>nx6, A=>door_open, B=>nx624);
   ix625 : NAND21 port map ( Q=>nx624, A=>nx626, B=>current_state_2);
   ix627 : CLKIN1 port map ( Q=>nx626, A=>rst);
   ix159 : OAI2111 port map ( Q=>nx158, A=>nx624, B=>nx616, C=>nx630, D=>
      nx633);
   ix631 : NAND31 port map ( Q=>nx630, A=>nx603, B=>time_set, C=>nx616);
   ix171 : NOR21 port map ( Q=>nx603, A=>rst, B=>current_state_2);
   ix634 : NAND21 port map ( Q=>nx633, A=>nx635, B=>nx2);
   ix636 : CLKIN1 port map ( Q=>nx635, A=>door_open);
   ix3 : NOR21 port map ( Q=>nx2, A=>rst, B=>nx638);
   reg_current_state_2 : DF1 port map ( Q=>current_state_2, QN=>nx638, C=>
      clk, D=>nx158);
   ix641 : NOR21 port map ( Q=>nx640, A=>current_state_0, B=>current_state_1
   );
   reg_current_state_0 : DF1 port map ( Q=>current_state_0, QN=>nx618, C=>
      clk, D=>nx86);
   ix135 : OAI2111 port map ( Q=>nx134, A=>full_power, B=>nx645, C=>nx647, D
      =>nx666);
   ix646 : NAND31 port map ( Q=>nx645, A=>nx603, B=>current_state_1, C=>
      nx618);
   ix648 : AOI2111 port map ( Q=>nx647, A=>nx126, B=>nx70, C=>nx120, D=>nx74
   );
   ix127 : NOR21 port map ( Q=>nx126, A=>timeout, B=>door_open);
   ix71 : NOR40 port map ( Q=>nx70, A=>rst, B=>nx638, C=>nx651, D=>
      current_state_0);
   reg_current_state_1 : DF1 port map ( Q=>current_state_1, QN=>nx651, C=>
      clk, D=>nx134);
   ix121 : NOR21 port map ( Q=>nx120, A=>nx654, B=>nx656);
   ix655 : CLKIN1 port map ( Q=>nx654, A=>half_power);
   ix657 : OAI2111 port map ( Q=>nx656, A=>nx658, B=>current_state_0, C=>
      nx603, D=>nx651);
   ix659 : CLKIN1 port map ( Q=>nx658, A=>full_power);
   ix75 : OAI311 port map ( Q=>nx74, A=>nx661, B=>time_set, C=>nx605, D=>
      nx664);
   ix662 : NAND21 port map ( Q=>nx661, A=>nx626, B=>nx638);
   ix147 : NAND21 port map ( Q=>nx605, A=>current_state_0, B=>
      current_state_1);
   ix665 : NAND21 port map ( Q=>nx664, A=>timeout, B=>nx70);
   ix667 : AOI221 port map ( Q=>nx666, A=>nx6, B=>nx100, C=>nx48, D=>nx42);
   ix101 : AOI211 port map ( Q=>nx100, A=>nx20, B=>nx651, C=>nx618);
   ix21 : NOR21 port map ( Q=>nx20, A=>start, B=>door_open);
   ix49 : NOR40 port map ( Q=>nx48, A=>nx618, B=>current_state_1, C=>rst, D
      =>current_state_2);
   ix43 : CLKIN1 port map ( Q=>nx42, A=>nx672);
   ix673 : NOR31 port map ( Q=>nx672, A=>s60, B=>s120, C=>s30);
   ix675 : NAND21 port map ( Q=>nx674, A=>full_power, B=>nx186);
   ix187 : AOI2111 port map ( Q=>nx186, A=>half_power, B=>nx651, C=>nx661, D
      =>current_state_0);
   ix678 : AOI211 port map ( Q=>nx677, A=>timeout, B=>nx70, C=>nx64);
   ix65 : NOR40 port map ( Q=>nx64, A=>rst, B=>current_state_2, C=>time_set, 
      D=>nx605);
   ix681 : NOR21 port map ( Q=>nx680, A=>nx54, B=>nx38);
   ix55 : OAI221 port map ( Q=>nx54, A=>half_power, B=>nx683, C=>nx645, D=>
      nx672);
   ix684 : NAND21 port map ( Q=>nx683, A=>nx685, B=>nx603);
   ix686 : NOR21 port map ( Q=>nx685, A=>nx618, B=>current_state_1);
   ix39 : OAI311 port map ( Q=>nx38, A=>nx605, B=>rst, C=>door_open, D=>
      nx688);
   ix689 : NAND31 port map ( Q=>nx688, A=>nx685, B=>nx20, C=>nx2);
   ix691 : AOI311 port map ( Q=>nx690, A=>nx70, B=>nx692, C=>door_open, D=>
      nx274);
   ix693 : CLKIN1 port map ( Q=>nx692, A=>timeout);
   ix275 : NOR40 port map ( Q=>nx274, A=>rst, B=>nx638, C=>nx635, D=>
      current_state_1);
   ix259 : OAI311 port map ( Q=>start_count, A=>timeout, B=>door_open, C=>
      nx696, D=>nx698);
   ix697 : NAND31 port map ( Q=>nx696, A=>nx2, B=>current_state_1, C=>nx618
   );
   ix699 : NAND31 port map ( Q=>nx698, A=>nx6, B=>nx700, C=>nx685);
   ix701 : CLKIN1 port map ( Q=>nx700, A=>nx20);
   ix247 : OAI221 port map ( Q=>finished, A=>nx692, B=>nx696, C=>nx605, D=>
      nx633);
   ix239 : OAI211 port map ( Q=>in_light, A=>timeout, B=>nx696, C=>nx704);
   ix705 : AOI221 port map ( Q=>nx704, A=>nx232, B=>nx603, C=>nx2, D=>nx224
   );
   ix233 : NOR40 port map ( Q=>nx232, A=>nx618, B=>nx651, C=>nx635, D=>nx707
   );
   ix708 : CLKIN1 port map ( Q=>nx707, A=>time_set);
   ix225 : OAI221 port map ( Q=>nx224, A=>nx20, B=>nx14, C=>nx635, D=>nx76);
   ix15 : NAND21 port map ( Q=>nx14, A=>current_state_0, B=>nx651);
   ix77 : NAND21 port map ( Q=>nx76, A=>nx618, B=>nx651);
   ix209 : OAI311 port map ( Q=>half, A=>nx42, B=>full_power, C=>nx645, D=>
      nx713);
   ix714 : NAND21 port map ( Q=>nx713, A=>half_power, B=>nx118);
   ix119 : AOI2111 port map ( Q=>nx118, A=>full_power, B=>nx618, C=>nx661, D
      =>current_state_1);
   ix199 : OAI311 port map ( Q=>full, A=>nx42, B=>half_power, C=>nx683, D=>
      nx674);
end behavioral ;

