library IEEE;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_1164.all;

signal my_sulv1 : std_ulogic_vector(15 downto 0);
signal my_int : integer;
signal my_sulv2 : std_ulogic_vector(15 downto 0);

my_int <= to_integer(unsigned(my_sulv1));

my_sulv2 <= std_ulogic_vector(to_unsigned(my_int, 16));
library.IEEE;
use IEEE.STD_LOGIC_1164.all
entity mux_4_input is
               port (SEL : in STD_LOGIC_VECTOR (1 downto 0);
                             A : in STD_LOGIC_VECTOR (3 downto 0);
                             X : out STD_LOGIC);
end mux_4_input;

architecture behavioral of mux_4_input is
begin
with SEL select
          x <= A(0) when "00",
                  A(1) when "01",
                  A(2) when "10",
                  A(3) when "11",
                  '0' when others;
end behavioral;

abc <= bcd;

	
	output7seg <= 	"0000001" when abc = "0000" else
			"1001111" when abc = "0001" else
			"0010010" when abc = "0010" else
			"0000110" when abc = "0011" else
			"1001100" when abc = "0100" else
			"0100100" when abc = "0101" else
			"0100000" when abc = "0110" else
			"0001111" when abc = "0111" else
			"0000000" when abc = "1000" else
			"0000100" when abc = "1001" else
			"1111111";

end output;