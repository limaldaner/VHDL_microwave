
-- 
-- Definition of  ctrl_oven
-- 
--      Mon 04 Jan 2021 03:45:21 PM CET
--      
--      LeonardoSpectrum Level 3, 2014a.12
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library c35_CORELIB;
use c35_CORELIB.vcomponents.all;

architecture behavioral_onehot of ctrl_oven is
   signal stop_count_EXMPLR, finished_EXMPLR, start_count_EXMPLR, 
      half_EXMPLR, full_EXMPLR, current_state_5, current_state_4, nx966, 
      current_state_6, nx967, current_state_3, current_state_2, nx34, 
      current_state_0, current_state_7, nx58, nx72, nx86, nx968, nx130, 
      nx160, nx164, nx172, nx190, nx976, nx978, nx982, nx986, nx988, nx992, 
      nx995, nx997, nx1001, nx1003, nx1005, nx1009, nx1011, nx1014, nx1016, 
      nx1019, nx1023, nx1026, nx1030, nx1034, nx1036, nx1043, nx1047, nx1049, 
      nx1053: std_logic ;

begin
   full <= full_EXMPLR ;
   half <= half_EXMPLR ;
   finished <= finished_EXMPLR ;
   start_count <= start_count_EXMPLR ;
   stop_count <= stop_count_EXMPLR ;
   ix135 : OAI311 port map ( Q=>full_EXMPLR, A=>nx976, B=>rst, C=>nx1047, D
      =>nx1049);
   ix977 : AOI211 port map ( Q=>nx976, A=>nx978, B=>current_state_0, C=>
      current_state_2);
   ix979 : CLKIN1 port map ( Q=>nx978, A=>half_power);
   ix59 : NAND21 port map ( Q=>nx58, A=>nx982, B=>nx1011);
   ix983 : AOI221 port map ( Q=>nx982, A=>door_open, B=>current_state_7, C=>
      current_state_0, D=>nx34);
   ix47 : OAI311 port map ( Q=>finished_EXMPLR, A=>nx986, B=>rst, C=>
      door_open, D=>nx988);
   reg_current_state_7 : DF1 port map ( Q=>current_state_7, QN=>nx986, C=>
      clk, D=>finished_EXMPLR);
   ix989 : NAND31 port map ( Q=>nx988, A=>current_state_6, B=>nx1011, C=>
      timeout);
   ix7 : NOR31 port map ( Q=>start_count_EXMPLR, A=>nx992, B=>rst, C=>
      door_open);
   ix993 : CLKIN1 port map ( Q=>nx992, A=>nx967);
   ix207 : OAI211 port map ( Q=>nx967, A=>timeout, B=>nx995, C=>nx997);
   reg_current_state_6 : DF1 port map ( Q=>current_state_6, QN=>nx995, C=>
      clk, D=>start_count_EXMPLR);
   ix998 : OAI211 port map ( Q=>nx997, A=>door_open, B=>start, C=>
      current_state_5);
   reg_current_state_5 : DF1 port map ( Q=>current_state_5, QN=>OPEN, C=>clk, 
      D=>nx190);
   ix191 : AOI2111 port map ( Q=>nx190, A=>nx1001, B=>nx1005, C=>rst, D=>
      door_open);
   ix1002 : NAND21 port map ( Q=>nx1001, A=>nx1003, B=>current_state_5);
   ix1004 : CLKIN1 port map ( Q=>nx1003, A=>start);
   ix1006 : AOI211 port map ( Q=>nx1005, A=>time_set, B=>current_state_3, C
      =>current_state_4);
   ix173 : OAI311 port map ( Q=>nx172, A=>nx1009, B=>half_power, C=>nx130, D
      =>nx1016);
   ix1012 : CLKIN1 port map ( Q=>nx1011, A=>rst);
   reg_current_state_1 : DF1 port map ( Q=>OPEN, QN=>nx1014, C=>clk, D=>
      full_EXMPLR);
   ix131 : NOR40 port map ( Q=>nx130, A=>s120, B=>s60, C=>s30, D=>half_power
   );
   ix1017 : OAI211 port map ( Q=>nx1016, A=>nx164, B=>nx160, C=>nx1011);
   ix165 : NOR21 port map ( Q=>nx164, A=>time_set, B=>nx1019);
   reg_current_state_3 : DF1 port map ( Q=>current_state_3, QN=>nx1019, C=>
      clk, D=>nx172);
   ix161 : NOR31 port map ( Q=>nx160, A=>nx86, B=>full_power, C=>nx1023);
   ix87 : NOR40 port map ( Q=>nx86, A=>s120, B=>s60, C=>s30, D=>full_power);
   ix99 : OAI221 port map ( Q=>half_EXMPLR, A=>rst, B=>nx1026, C=>nx978, D=>
      nx1009);
   ix1027 : AOI211 port map ( Q=>nx1026, A=>current_state_2, B=>nx86, C=>
      nx72);
   reg_current_state_2 : DF1 port map ( Q=>current_state_2, QN=>nx1023, C=>
      clk, D=>half_EXMPLR);
   ix73 : NOR31 port map ( Q=>nx72, A=>nx978, B=>full_power, C=>nx1030);
   reg_current_state_0 : DF1 port map ( Q=>current_state_0, QN=>nx1030, C=>
      clk, D=>nx58);
   ix27 : NOR31 port map ( Q=>stop_count_EXMPLR, A=>nx1034, B=>rst, C=>
      nx1043);
   ix1035 : AOI2111 port map ( Q=>nx1034, A=>nx1036, B=>current_state_6, C=>
      nx966, D=>current_state_5);
   ix1037 : CLKIN1 port map ( Q=>nx1036, A=>timeout);
   reg_current_state_4 : DF1 port map ( Q=>current_state_4, QN=>OPEN, C=>clk, 
      D=>stop_count_EXMPLR);
   ix1044 : CLKIN1 port map ( Q=>nx1043, A=>door_open);
   ix35 : XNR21 port map ( Q=>nx34, A=>half_power, B=>full_power);
   ix1048 : CLKIN1 port map ( Q=>nx1047, A=>full_power);
   ix1050 : NAND21 port map ( Q=>nx1049, A=>nx130, B=>nx968);
   ix145 : NOR21 port map ( Q=>nx968, A=>rst, B=>nx1014);
   ix215 : NOR21 port map ( Q=>in_light, A=>rst, B=>nx1053);
   ix1054 : AOI211 port map ( Q=>nx1053, A=>door_open, B=>nx966, C=>nx967);
   ix1010 : CLKIN1 port map ( Q=>nx1009, A=>nx968);
   ix183 : CLKIN1 port map ( Q=>nx966, A=>nx1005);
end behavioral_onehot ;

