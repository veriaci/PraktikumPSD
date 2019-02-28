Library IEEE;
use ieee.std_logic_1164.all;

entity Mul_2 is
Port (
	input_3 : in std_logic_vector (3 downto 0) := "0010";
	input_4 : in std_logic_vector (3 downto 0):= "0011";
	s	: in integer range 0 to 3;
	output_2: out std_logic_vector (3 downto 0)
	);

end Mul_2;


architecture behave of Mul_2 is
begin
	process (s)
	begin
		case (s) is
		when 2 =>
		output_2 <= input_3;
		when 3 =>
		output_2 <= input_4;
		when others =>
		output_2 <= "1111";
		end case;
	end process;
end behave;
