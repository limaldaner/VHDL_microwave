library IEEE;
use     IEEE.std_logic_1164.all;
use 	IEEE.numeric_std.ALL;

architecture dataflow of alu_comb is
signal AInteger,BInteger,R1Integer, R0Integer: integer;

begin
process(A,B,SEL)
begin
	AInteger <= to_integer(UNSIGNED( A ));
	BInteger <= to_integer(UNSIGNED( B ));
	R0Integer  <= AInteger - BInteger;
	R1Integer  <= AInteger + BInteger;
	case SEL is 
		when '1' =>
			R <= std_logic_vector(TO_UNSIGNED(R0Integer, N)); 
		when '0' =>
			R <= std_logic_vector(TO_UNSIGNED(R1Integer, N));
	end case;
end process;
end dataflow;
