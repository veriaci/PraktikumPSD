library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
	Port (  A,B,C,D : in STD_LOGIC_VECTOR(3 downto 0);
		PA,PB : in STD_LOGIC;
		O: out STD_LOGIC_VECTOR(3 downto 0));
end entity;

architecture plex of mux is
begin 
	process (A,B,C,D,PA,PB) is 
	begin
	if (PA = '0' and PB = '0') then 
		O <= A;
	elsif (PA = '1' and PB = '0') then
		O <= B;
	elsif (PA = '0' and PB = '1') then 
		O <= C;
	else O <= D;
	end if;
	end process;
end architecture;