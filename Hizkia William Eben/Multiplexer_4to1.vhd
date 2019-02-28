
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer is

    Port ( 
	i0 : in  STD_LOGIC_VECTOR(3 downto 0) := "0000";
	i1 : in  STD_LOGIC_VECTOR(3 downto 0) := "0001";
	i2 : in  STD_LOGIC_VECTOR(3 downto 0) := "0010";
	i3 : in  STD_LOGIC_VECTOR(3 downto 0) := "0011";
	s0 : in  STD_LOGIC_VECTOR(1 downto 0);
	outt : out  STD_LOGIC_VECTOR(3 downto 0));

end multiplexer;

architecture Behavioral of multiplexer is
begin
outt <= 

	i0 when s0 = "00" else 

	i1 when s0 = "01" else 

	i2 when s0 = "10" else  

	i3 when s0 = "11";

end Behavioral;