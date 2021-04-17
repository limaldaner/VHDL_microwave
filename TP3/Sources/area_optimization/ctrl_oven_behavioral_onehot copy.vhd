
-- 
-- Definition of  ctrl_oven
-- 
--      Thu 07 Jan 2021 12:28:37 PM CET
--      
--      LeonardoSpectrum Level 3, 2014a.12
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library c35_CORELIB;
use c35_CORELIB.vcomponents.all;

entity ctrl_oven_onehot is
port(
	clk, rst, half_power, full_power, start, s30, s60, s120,
	time_set, door_open, timeout : in std_logic;
	full, half, in_light, finished, start_count, stop_count : out std_logic
	);
end ctrl_oven_onehot;

architecture behavioral_onehot of ctrl_oven_onehot is
   signal stop_count_EXMPLR, finished_EXMPLR, start_count_EXMPLR, 
      half_EXMPLR, full_EXMPLR, current_state_5, current_state_4, nx966, 
      current_state_6, nx967, current_state_3, current_state_1, 
      current_state_2, nx34, current_state_0, current_state_7, nx58, nx72, 
      nx86, nx968, nx130, nx160, nx164, nx172, nx190, nx976, nx978, nx982, 
      nx986, nx988, nx992, nx995, nx998, nx1000, nx1003, nx1007, nx1009, 
      nx1012, nx1014, nx1017, nx1021, nx1024, nx1028, nx1032, nx1034, nx1037, 
      nx1039, nx1041, nx1043, nx1045, nx1048, nx1050, nx1054: std_logic ;

begin
   full <= full_EXMPLR ;
   half <= half_EXMPLR ;
   finished <= finished_EXMPLR ;
   start_count <= start_count_EXMPLR ;
   stop_count <= stop_count_EXMPLR ;
   ix135 : OAI311 port map ( Q=>full_EXMPLR, A=>nx976, B=>rst, C=>nx1048, D
      =>nx1050);
   ix977 : AOI211 port map ( Q=>nx976, A=>nx978, B=>current_state_0, C=>
      current_state_2);
   ix979 : CLKIN1 port map ( Q=>nx978, A=>half_power);
   ix59 : NAND21 port map ( Q=>nx58, A=>nx982, B=>nx1009);
   ix983 : AOI221 port map ( Q=>nx982, A=>door_open, B=>current_state_7, C=>
      current_state_0, D=>nx34);
   ix47 : OAI311 port map ( Q=>finished_EXMPLR, A=>nx986, B=>rst, C=>
      door_open, D=>nx988);
   reg_current_state_7 : DF1 port map ( Q=>current_state_7, QN=>nx986, C=>
      clk, D=>finished_EXMPLR);
   ix989 : NAND31 port map ( Q=>nx988, A=>current_state_6, B=>nx1009, C=>
      timeout);
   ix7 : NOR31 port map ( Q=>start_count_EXMPLR, A=>nx992, B=>rst, C=>
      door_open);
   ix993 : CLKIN1 port map ( Q=>nx992, A=>nx967);
   ix207 : OAI221 port map ( Q=>nx967, A=>nx995, B=>nx1043, C=>timeout, D=>
      nx1045);
   ix191 : AOI2111 port map ( Q=>nx190, A=>nx998, B=>nx1003, C=>rst, D=>
      door_open);
   ix999 : NAND21 port map ( Q=>nx998, A=>nx1000, B=>current_state_5);
   ix1001 : CLKIN1 port map ( Q=>nx1000, A=>start);
   reg_current_state_5 : DF1 port map ( Q=>current_state_5, QN=>nx995, C=>
      clk, D=>nx190);
   ix1004 : AOI211 port map ( Q=>nx1003, A=>time_set, B=>current_state_3, C
      =>current_state_4);
   ix173 : OAI311 port map ( Q=>nx172, A=>nx1007, B=>half_power, C=>nx130, D
      =>nx1014);
   ix1008 : NAND21 port map ( Q=>nx1007, A=>nx1009, B=>current_state_1);
   ix1010 : CLKIN1 port map ( Q=>nx1009, A=>rst);
   reg_current_state_1 : DF1 port map ( Q=>current_state_1, QN=>nx1012, C=>
      clk, D=>full_EXMPLR);
   ix131 : NOR40 port map ( Q=>nx130, A=>s120, B=>s60, C=>s30, D=>half_power
   );
   ix1015 : OAI211 port map ( Q=>nx1014, A=>nx164, B=>nx160, C=>nx1009);
   ix165 : NOR21 port map ( Q=>nx164, A=>time_set, B=>nx1017);
   reg_current_state_3 : DF1 port map ( Q=>current_state_3, QN=>nx1017, C=>
      clk, D=>nx172);
   ix161 : NOR31 port map ( Q=>nx160, A=>nx86, B=>full_power, C=>nx1021);
   ix87 : NOR40 port map ( Q=>nx86, A=>s120, B=>s60, C=>s30, D=>full_power);
   ix99 : OAI221 port map ( Q=>half_EXMPLR, A=>rst, B=>nx1024, C=>nx978, D=>
      nx1007);
   ix1025 : AOI211 port map ( Q=>nx1024, A=>current_state_2, B=>nx86, C=>
      nx72);
   reg_current_state_2 : DF1 port map ( Q=>current_state_2, QN=>nx1021, C=>
      clk, D=>half_EXMPLR);
   ix73 : NOR31 port map ( Q=>nx72, A=>nx978, B=>full_power, C=>nx1028);
   reg_current_state_0 : DF1 port map ( Q=>current_state_0, QN=>nx1028, C=>
      clk, D=>nx58);
   ix27 : NOR31 port map ( Q=>stop_count_EXMPLR, A=>nx1032, B=>rst, C=>
      nx1041);
   ix1033 : AOI2111 port map ( Q=>nx1032, A=>nx1034, B=>current_state_6, C=>
      nx966, D=>current_state_5);
   ix1035 : CLKIN1 port map ( Q=>nx1034, A=>timeout);
   ix183 : OAI211 port map ( Q=>nx966, A=>nx1037, B=>nx1017, C=>nx1039);
   ix1038 : CLKIN1 port map ( Q=>nx1037, A=>time_set);
   reg_current_state_4 : DF1 port map ( Q=>current_state_4, QN=>nx1039, C=>
      clk, D=>stop_count_EXMPLR);
   ix1042 : CLKIN1 port map ( Q=>nx1041, A=>door_open);
   ix1044 : NOR21 port map ( Q=>nx1043, A=>door_open, B=>start);
   reg_current_state_6 : DF1 port map ( Q=>current_state_6, QN=>nx1045, C=>
      clk, D=>start_count_EXMPLR);
   ix35 : XNR21 port map ( Q=>nx34, A=>half_power, B=>full_power);
   ix1049 : CLKIN1 port map ( Q=>nx1048, A=>full_power);
   ix1051 : NAND21 port map ( Q=>nx1050, A=>nx130, B=>nx968);
   ix145 : NOR21 port map ( Q=>nx968, A=>rst, B=>nx1012);
   ix215 : NOR21 port map ( Q=>in_light, A=>rst, B=>nx1054);
   ix1055 : AOI211 port map ( Q=>nx1054, A=>door_open, B=>nx966, C=>nx967);

end behavioral_onehot ;
