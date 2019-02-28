Library IEEE;
use ieee.std_logic_1164.all;

entity Mul_1 is
Port (
	input_1 : in std_logic_vector (3 downto 0) := "0000";
	input_2 : in std_logic_vector (3 downto 0) := "0001";
	s	: in integer range 0 to 3;
	output_1: out std_logic_vector (3 downto 0)
	);
end Mul_1;

architecture behave of Mul_1 is
begin
	process (s)
	begin
		case (s) is
		when 0 =>
		output_1 <= input_1;
		when 1 =>
		output_1 <= input_2;
		when others =>
		output_1 <= "1111";
		end case;
	end process;
end behave;
	
	
