-- Muhamamd Ilham Akbar 1706042970

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity sevenseg is
  Port (
    A0   		: in  std_logic_vector(3 downto 0);
    A1   		: in  std_logic_vector(3 downto 0);
    A2   		: in  std_logic_vector(3 downto 0);
    A3   		: in  std_logic_vector(3 downto 0);
    BCDM	 	: inout std_logic_vector(3 downto 0);
    Selector		: in  std_logic_vector(1 downto 0);
    Seg7 		: out std_logic_vector(6 downto 0)
);

End Entity sevenseg;

Architecture behavioral of sevenseg is

Begin
	BCDM <=  	 A0 when Selector = "00" else
             	 A1 when Selector = "01" else
             	 A2 when Selector = "10" else
             	 A3;
	process(BCDM)
	
	begin
		case BCDM is
		when "0000" => Seg7 <= "0000001"; ---0
		when "0001" => Seg7 <= "1001111"; ---1
		when "0010" => Seg7 <= "0010010"; ---2
		when "0011" => Seg7 <= "0000110"; ---3
		when "0100" => Seg7 <= "1001100"; ---4
		when "0101" => Seg7 <= "0100100"; ---5
		when "0110" => Seg7 <= "0100000"; ---6
		when "0111" => Seg7 <= "0001111"; ---7
		when "1000" => Seg7 <= "0000000"; ---8
		when "1001" => Seg7 <= "0000100"; ---9
		when others => Seg7 <= "1111111"; ---null
	end case;
	
	end process;

END ARCHITECTURE behavioral;