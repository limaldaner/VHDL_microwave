-------------
-- Memento --
-------------


-- Conversion integer <=> std_logic_vector
library ieee;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.ALL;

MyVector  <= TO_INTEGER(UNSIGNED( MyVector ));
MyInteger <= STD_LOGIC_VECTOR(TO_UNSIGNED(MyInteger, MyVector'length));








