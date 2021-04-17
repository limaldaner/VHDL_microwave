library IEEE;
use     IEEE.std_logic_1164.all;
use 	IEEE.numeric_std.ALL;

entity ctrl_oven is
port(
	clk, rst, half_power, full_power, start, s30, s60, s120,
	time_set, door_open, timeout : in std_logic;
	full, half, in_light, finished, start_count, stop_count : out std_logic
	);
end ctrl_oven;

architecture behavioral of ctrl_oven is

--definition des signals et des etat
type type_state is (idle,full_power_on,half_power_on,set_timer,operation_disabled,
operation_enabled,operating,complet);
signal new_state : type_state; 
signal current_state : type_state;

begin
-- partie combinationel: calcule de l'etat new_state
process(RST, half_power, full_power, start, s30, s60, s120, time_set, door_open, timeout, current_state)
	begin
	if (RST='1') then
		new_state <= idle;
		full <= '0'; 
		half <= '0';
		in_light <= '0';
		finished <= '0';  
		start_count <= '0'; 
		stop_count <= '0'; 
	else
		case(current_state) is
			when idle =>
				in_light <= '0';
				finished <= '0';  
				start_count <= '0'; 
				stop_count <= '0';
				if (((not(full_power) and not(half_power)) or (half_power and full_power))='1') then 
					new_state <= idle;
					full <= '0';
					half <= '0';
				elsif ((full_power and not(half_power)) = '1') then 
					new_state <= full_power_on;
					full <= '1';
					half <= '0';
				else --if ((half_power and not(full_power)) = '1') then 
					new_state <= half_power_on;
					half <= '1';
					full <= '0';
				end if; 
			when full_power_on =>
				in_light <= '0';
				finished <= '0';  
				start_count <= '0'; 
				stop_count <= '0';
				if ((not(S30) and not(S60) and not(S120) and not(half_power)) = '1') then
					new_state <= full_power_on;
					full <= '1';
					half <= '0';
				elsif (half_power = '1') then
					new_state <= half_power_on;
					half <= '1';
					full <= '0';
				else--if ((S30 or S60 or S120 and not(half_power)) = '1') then
					new_state <= set_timer;
					half <= '0';
					full <= '0';
				end if;
			when half_power_on =>
				in_light <= '0';
				finished <= '0';  
				start_count <= '0'; 
				stop_count <= '0';
				if ((not(S30) and not(S60) and not(S120) and not(full_power)) = '1') then
					new_state <= half_power_on;
					half <= '1';
					full <= '0';
				elsif (full_power = '1') then
					new_state <= full_power_on;
					half <= '0';
					full <= '1';
				else--if ((S30 or S60 or S120 and not(full_power)) = '1') then
					new_state <= set_timer;
					half <= '0';
					full <= '0';
				end if;
			when set_timer =>
				full <= '0'; 
				half <= '0';
				finished <= '0';  
				start_count <= '0'; 
				if (not(time_set) = '1') then
					new_state <= set_timer;
					in_light <= '0';
					stop_count <= '0';
				elsif ((not(door_open) and time_set) = '1') then
					new_state <= operation_enabled;
					in_light <= '0';
					stop_count <= '0';
				else --if (door_open and time_set) then
					new_state <= operation_disabled;
					in_light <= '1';
					stop_count <= '1';
				end if;
			when operation_disabled =>
				full <= '0'; 
				half <= '0';
				finished <= '0';  
				start_count <= '0'; 
				if ((door_open) = '1') then
					new_state <= operation_disabled;
					in_light <= '1';
					stop_count <= '1';
				else --if (not(door_open) = '1') then
					new_state <= operation_enabled;
					in_light <= '0';
					stop_count <= '0';
				end if;
			when operation_enabled =>
				full <= '0'; 
				half <= '0';
				in_light <= '0';
				finished <= '0';  
				stop_count <= '0'; 
				if ((not(door_open) and not(start)) = '1') then
					new_state <= operation_enabled;
					in_light <= '0';
					stop_count <= '0';
					start_count <= '0'; 					
				elsif (door_open = '1') then
					new_state <= operation_disabled;
					in_light <= '1';
					stop_count <= '1';
					start_count <= '0'; 					
				else --if (not(door_open) and start = '1')
					new_state <= operating;
					in_light <= '1';
					stop_count <= '0';
					start_count <= '1'; 					
				end if;
			when operating =>
				full <= '0'; 
				half <= '0';
				in_light <= '0';
				finished <= '0';  
				start_count <= '0'; 
				if ((not(door_open) and not(timeout)) = '1') then
					new_state <= operating;
					in_light <= '1';
					start_count <= '1';
					finished <= '0';
					stop_count <= '0'; 
				elsif (timeout = '1') then
					new_state <= complet;
					in_light <= '0';
					start_count <= '0';
					finished <= '1';
					stop_count <= '0'; 
				else --if(door_open and not(timeout) <= '1') then
					new_state <= operation_disabled;
					in_light <= '1';
					start_count <= '0';
					finished <= '0';
					stop_count <= '1'; 
				end if;
			when complet =>
				full <= '0'; 
				half <= '0';
				in_light <= '0';
				start_count <= '0'; 
				stop_count <= '0'; 
				if ( not(door_open) = '1') then
					new_state <= complet;
					finished <= '1';  
				else --if (door_open <= '1') then
					new_state <= idle;
					finished <= '0';  
				end if;
		end case;
	end if;
end process;
	
-- partie sequenciel: mise a jout de l'etat current_state
process
begin
	wait until clk'event and clk='1';
	current_state <= new_state;
end process;

end behavioral;