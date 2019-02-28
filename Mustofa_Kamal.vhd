-- Mustofa Kamal

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Seg_7 IS
  PORT (
    Sel : in  std_logic_vector(1 downto 0);
    D0  : in  std_logic_vector(3 downto 0);
    D1  : in  std_logic_vector(3 downto 0);
    D2  : in  std_logic_vector(3 downto 0);
    D3  : in  std_logic_vector(3 downto 0);
    BCDin : inout std_logic_vector(3 downto 0);
    Seg7 : out std_logic_vector(6 downto 0));

END ENTITY Seg_7;
 
ARCHITECTURE fn of Seg_7 IS
BEGIN
	BCDin <= D0 when Sel = "00" else
             	 D1 when Sel = "01" else
             	 D2 when Sel = "10" else
             	 D3;
	process(BCDin)
	begin
	 
	case BCDin is
	when "0000" =>
	Seg7 <= "0000001"; ---0
	when "0001" =>
	Seg7 <= "1001111"; ---1
	when "0010" =>
	Seg7 <= "0010010"; ---2
	when "0011" =>
	Seg7 <= "0000110"; ---3
	when "0100" =>
	Seg7 <= "1001100"; ---4
	when "0101" =>
	Seg7 <= "0100100"; ---5
	when "0110" =>
	Seg7 <= "0100000"; ---6
	when "0111" =>
	Seg7 <= "0001111"; ---7
	when "1000" =>
	Seg7 <= "0000000"; ---8
	when "1001" =>
	Seg7 <= "0000100"; ---9
	when others =>
	Seg7 <= "1111111"; ---null
	end case;
 
	end process;

END ARCHITECTURE fn;