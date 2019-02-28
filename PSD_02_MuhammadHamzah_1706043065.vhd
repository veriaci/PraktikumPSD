--Muhammad Hamzah 1706043065
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity combined is
 port(
	D0,D1,D2,D3 : in STD_LOGIC;
	S0,S1 : in STD_LOGIC;
	Z : out STD_LOGIC;
	BCDin : in STD_LOGIC_VECTOR (3 downto 0);
	Seven_Segment : out STD_LOGIC_VECTOR (6 downto 0)
 );
end combined;

architecture mux4x1 of combined is
begin
process (D0,D1,D2,D3,S0,S1) is
begin
	if (S0 = '0' and S1 = '0') then
		Z <= D0;
	elsif (S0 = '1' and S1 = '0') then
		Z <= D1;
	elsif (S0 = '0' and S1 = '1') then
		Z <= D2;
	else
		Z <= D3;
	end if;

end process;
end mux4x1;

architecture bcdx7s of combined is
begin
 process(BCDin)
 begin
 case BCDin is
 when "0000" => Seven_Segment <= "0000001"; ---0
 when "0001" => Seven_Segment <= "1001111"; ---1
 when "0010" => Seven_Segment <= "0010010"; ---2
 when "0011" => Seven_Segment <= "0000110"; ---3
 when "0100" => Seven_Segment <= "1001100"; ---4
 when "0101" => Seven_Segment <= "0100100"; ---5
 when "0110" => Seven_Segment <= "0100000"; ---6
 when "0111" => Seven_Segment <= "0001111"; ---7
 when "1000" => Seven_Segment <= "0000000"; ---8
 when "1001" => Seven_Segment <= "0000100"; ---9
 when others => Seven_Segment <= "1111111"; ---undefined
 end case;
 end process;
 end bcdx7s;