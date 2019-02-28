library IEEE;
use ieee.std_logic_1164.all;

entity BCD is
	PORT (
		BCD1 : in std_logic_vector (3 downto 0);
		BCD2 : in std_logic_vector (3 downto 0);
		result : out std_logic_vector (6 downto 0)
		);
end BCD;

architecture behave of BCD is
begin
	process (BCD1, BCD2)
	variable BCDtrueinput1 : std_logic_vector (7 downto 0);
	begin
		BCDtrueinput1 := BCD1 & BCD2;
		case BCDtrueinput1 is 
			when "00000000" =>
			result <= "0000001";
			when "00000001" =>
			result <= "1001111";
			when "00000010" =>
			result <= "0010010";
			when "00000011" =>
			result <= "0000110";
			when others =>
			result <= "-------";
			end case;
	end process;
end behave;
