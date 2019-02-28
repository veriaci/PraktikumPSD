-- Test
library IEEE;
use IEEE.std_logic_1164.all;

entity circuit is
port (
	A, B, C, D : in std_logic_vector(3 downto 0);
	SEL :in std_logic_vector(3 downto 0);
	Output : out std_logic_vector(3 downto 0);
	BCD : in std_logic_vector (3 downto 0);
	Seven7 : out std_logic_vector (6 downto 0));
end circuit;

architecture mux4 of circuit is
begin
	Output <= A when (SEL = "0011") else
	     B when (SEL = "0010") else
             C when (SEL = "0001") else
	     D when (SEL = "0000") else
	     "0000";
end mux4;

architecture BCD_ke_S7 of circuit is
begin

process(BCD)
begin

	case BCD is
	when "0000" => Seven7 <= "0000001"; ---0
	when "0001" => Seven7 <= "1001111"; ---1
	when "0010" => Seven7 <= "0010010"; ---2
	when "0011" => Seven7 <= "0000110"; ---3
	when others => Seven7 <= "1111111"; ---null
	end case;

end process;

end BCD_ke_S7;
