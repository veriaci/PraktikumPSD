library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_to_7seg is
	Port (  bcd_in  : in  STD_LOGIC_VECTOR (3 downto 0);
		sev_seg : out STD_LOGIC_VECTOR (6 downto 0));
end entity;

architecture convert_b7 of bcd_to_7seg is
begin
	process(bcd_in)
	begin
	
	case bcd_in is
	when "0000" => sev_seg <= "0000001";  -- 0
	when "0001" => sev_seg <= "1001111";  -- 1
	when "0010" => sev_seg <= "0010010";  -- 2
	when "0011" => sev_seg <= "0000110";  -- 3
	when "0100" => sev_seg <= "1001100";  -- 4
	when "0101" => sev_seg <= "0100100";  -- 5
	when "0110" => sev_seg <= "0100000";  -- 6
	when "0111" => sev_seg <= "0001111";  -- 7
	when "1000" => sev_seg <= "0000000";  -- 8
	when "1001" => sev_seg <= "0000100";  -- 9
	when others => sev_seg <= "1111111";  -- NULL
	end case;
	
	end process;	

end architecture;
