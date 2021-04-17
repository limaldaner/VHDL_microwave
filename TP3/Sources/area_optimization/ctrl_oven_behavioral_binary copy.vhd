
-- 
-- Definition of  ctrl_oven
-- 
--      Mon 04 Jan 2021 03:32:15 PM CET
--      
--      LeonardoSpectrum Level 3, 2014a.12
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library c35_CORELIB;
use c35_CORELIB.vcomponents.all;

entity ctrl_oven_binary is
port(
	clk, rst, half_power, full_power, start, s30, s60, s120,
	time_set, door_open, timeout : in std_logic;
	full, half, in_light, finished, start_count, stop_count : out std_logic
	);
end ctrl_oven_binary;

architecture behavioral_binary of ctrl_oven_binary is
   signal current_state_2, nx2, nx6, nx603, current_state_1, nx604, nx605, 
      current_state_0, nx14, nx20, nx36, nx42, nx48, nx64, nx70, nx74, nx606, 
      nx76, nx86, nx102, nx118, nx120, nx126, nx134, nx158, nx186, nx224, 
      nx232, nx274, nx614, nx616, nx618, nx621, nx624, nx630, nx633, nx635, 
      nx638, nx640, nx645, nx647, nx651, nx654, nx661, nx666, nx670, nx677, 
      nx680, nx683, nx685, nx688, nx690, nx695, nx698, nx701, nx709, nx713, 
      nx715: std_logic ;

begin
   ix279 : OAI211 port map ( Q=>stop_count, A=>nx614, B=>nx661, C=>nx688);
   ix615 : NAND31 port map ( Q=>nx614, A=>nx616, B=>door_open, C=>time_set);
   ix87 : NAND41 port map ( Q=>nx86, A=>nx621, B=>nx677, C=>nx680, D=>nx683
   );
   ix622 : AOI211 port map ( Q=>nx621, A=>nx6, B=>nx640, C=>nx606);
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
   ix648 : AOI2111 port map ( Q=>nx647, A=>nx126, B=>nx70, C=>nx120, D=>nx74
   );
   ix127 : NOR21 port map ( Q=>nx126, A=>timeout, B=>door_open);
   ix71 : NOR40 port map ( Q=>nx70, A=>rst, B=>nx638, C=>nx651, D=>
      current_state_0);
   reg_current_state_1 : DF1 port map ( Q=>current_state_1, QN=>nx651, C=>
      clk, D=>nx134);
   ix655 : CLKIN1 port map ( Q=>nx654, A=>half_power);
   ix147 : NAND21 port map ( Q=>nx605, A=>current_state_0, B=>
      current_state_1);
   ix667 : AOI211 port map ( Q=>nx666, A=>nx48, B=>nx42, C=>nx102);
   ix49 : NOR40 port map ( Q=>nx48, A=>nx618, B=>current_state_1, C=>rst, D
      =>current_state_2);
   ix43 : CLKIN1 port map ( Q=>nx42, A=>nx670);
   ix671 : NOR31 port map ( Q=>nx670, A=>s60, B=>s120, C=>s30);
   ix103 : AOI2111 port map ( Q=>nx102, A=>nx20, B=>nx651, C=>nx633, D=>
      nx618);
   ix21 : NOR21 port map ( Q=>nx20, A=>start, B=>door_open);
   ix678 : AOI211 port map ( Q=>nx677, A=>timeout, B=>nx70, C=>nx64);
   ix65 : NOR40 port map ( Q=>nx64, A=>rst, B=>current_state_2, C=>time_set, 
      D=>nx605);
   ix681 : AOI221 port map ( Q=>nx680, A=>nx604, B=>nx42, C=>nx654, D=>nx48
   );
   ix177 : NOR40 port map ( Q=>nx604, A=>rst, B=>current_state_2, C=>nx651, 
      D=>current_state_0);
   ix684 : AOI311 port map ( Q=>nx683, A=>nx685, B=>nx20, C=>nx2, D=>nx36);
   ix686 : NOR21 port map ( Q=>nx685, A=>nx618, B=>current_state_1);
   ix37 : NOR40 port map ( Q=>nx36, A=>nx618, B=>nx651, C=>rst, D=>door_open
   );
   ix689 : AOI311 port map ( Q=>nx688, A=>nx70, B=>nx690, C=>door_open, D=>
      nx274);
   ix691 : CLKIN1 port map ( Q=>nx690, A=>timeout);
   ix275 : NOR40 port map ( Q=>nx274, A=>rst, B=>nx638, C=>nx635, D=>
      current_state_1);
   ix259 : OAI311 port map ( Q=>start_count, A=>nx633, B=>nx20, C=>nx14, D=>
      nx695);
   ix696 : NAND21 port map ( Q=>nx695, A=>nx126, B=>nx70);
   ix247 : OAI221 port map ( Q=>finished, A=>nx690, B=>nx698, C=>nx605, D=>
      nx633);
   ix239 : OAI211 port map ( Q=>in_light, A=>timeout, B=>nx698, C=>nx701);
   ix702 : AOI221 port map ( Q=>nx701, A=>nx232, B=>nx603, C=>nx2, D=>nx224
   );
   ix225 : OAI221 port map ( Q=>nx224, A=>nx20, B=>nx14, C=>nx635, D=>nx76);
   ix209 : OAI311 port map ( Q=>half, A=>nx42, B=>full_power, C=>nx645, D=>
      nx709);
   ix710 : NAND21 port map ( Q=>nx709, A=>half_power, B=>nx118);
   ix119 : AOI2111 port map ( Q=>nx118, A=>full_power, B=>nx618, C=>nx661, D
      =>current_state_1);
   ix199 : OAI311 port map ( Q=>full, A=>nx42, B=>half_power, C=>nx713, D=>
      nx715);
   ix716 : NAND21 port map ( Q=>nx715, A=>full_power, B=>nx186);
   ix187 : AOI2111 port map ( Q=>nx186, A=>half_power, B=>nx651, C=>nx661, D
      =>current_state_0);
   ix233 : CLKIN1 port map ( Q=>nx232, A=>nx614);
   ix121 : CLKIN1 port map ( Q=>nx120, A=>nx709);
   ix77 : CLKIN1 port map ( Q=>nx76, A=>nx640);
   ix189 : CLKIN1 port map ( Q=>nx606, A=>nx715);
   ix75 : CLKIN1 port map ( Q=>nx74, A=>nx677);
   ix699 : CLKIN1 port map ( Q=>nx698, A=>nx70);
   ix714 : CLKIN1 port map ( Q=>nx713, A=>nx48);
   ix15 : CLKIN1 port map ( Q=>nx14, A=>nx685);
   ix617 : CLKIN1 port map ( Q=>nx616, A=>nx605);
   ix646 : CLKIN1 port map ( Q=>nx645, A=>nx604);
   ix662 : CLKIN1 port map ( Q=>nx661, A=>nx603);
   ix7 : CLKIN1 port map ( Q=>nx6, A=>nx633);
   ix625 : CLKIN1 port map ( Q=>nx624, A=>nx2);
end behavioral_binary ;
