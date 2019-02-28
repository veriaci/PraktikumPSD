library IEEE;
use IEEE.std_logic_1164.all;

entity combination is
port (
	A, B, C, D : in std_logic_vector(3 downto 0);
	SEL :in std_logic_vector(3 downto 0);
	O : out std_logic_vector(3 downto 0);
	BCD : in std_logic_vector (3 downto 0);
	Seg7 : out std_logic_vector (6 downto 0));
end combination;


architecture mux_4to1 of combination is
begin
	O <= A when (SEL = "0011") else
		B when (SEL = "0010") else
		C when (SEL = "0001") else
		D when (SEL = "0000") else
		"0000";
		
end mux_4to1;

architecture bcd_toSeg7 of combination is
begin

process(BCD)
begin

	case BCD is
	when "0000" => Seg7 <= "0000001"; ---0
	when "0001" => Seg7 <= "1001111"; ---1
	when "0010" => Seg7 <= "0010010"; ---2
	when "0011" => Seg7 <= "0000110"; ---3
WHEN "0100" => Seg7 <= "0110011";
			WHEN "0101" =>	Seg7 <= "1011011";
			WHEN "0110" =>	Seg7 <= "1011111";
			WHEN "0111" =>	Seg7 <= "1110000";
			WHEN "1000" =>	Seg7 <= "1111111";
			WHEN "1001" =>	Seg7 <= "1111011";
	when others => Seg7 <= "1111111"; 
	end case;

end process;
end bcd_toSeg7;