library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer4to1_7segment is
port	( 
	A,B,C,D			: in STD_LOGIC_VECTOR(3 downto 0);
	S			: in STD_LOGIC_VECTOR(1 downto 0);
	clock			: in STD_LOGIC;
	signal output7seg	: out STD_LOGIC_VECTOR(6 downto 0)
	);
end multiplexer4to1_7segment;

architecture output of multiplexer4to1_7segment is
signal bcd : STD_LOGIC_VECTOR(3 downto 0);
signal abc : STD_LOGIC_VECTOR(3 downto 0);
begin
process (A,B,C,D,S) is
begin 
	if(S="00")then
	bcd <= A;
	elsif(S="01")then                  
	bcd <= B;
	elsif(S="10")then
	bcd <= C;
	else
	bcd <= D;
	end if;                                
end process;


	abc <= bcd;

	
	output7seg <= 	"0000001" when abc = "0000" else
			"1001111" when abc = "0001" else
			"0010010" when abc = "0010" else
			"0000110" when abc = "0011" else
			"1001100" when abc = "0100" else
			"0100100" when abc = "0101" else
			"0100000" when abc = "0110" else
			"0001111" when abc = "0111" else
			"0000000" when abc = "1000" else
			"0000100" when abc = "1001" else
			"1111111";

end output;
