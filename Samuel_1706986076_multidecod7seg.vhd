library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity decoder7seg is 
	port ( 	SEL1 : in  STD_LOGIC;
		SEL2 : in STD_logic;
           A   : in  STD_LOGIC_VECTOR (3 downto 0);
           B   : in  STD_LOGIC_VECTOR (3 downto 0);
	   C 	: in STD_LOGIC_VECTOR (3 downto 0);
		D : in STD_logic_vector (3 downto 0);
           X   : out STD_LOGIC_VECTOR (3 downto 0);

		reset : in std_logic;
		
		out7seg : out std_logic_vector  (6 downto 0));
end decoder7seg;

architecture decoder7seg of decoder7seg is

signal indec: std_logic_vector (3 downto 0);
begin

			indec <= A when (SEL1 = '0' and SEL2= '0') else
			 B when (SEL1 = '0' and SEL2= '1') else 
			C when (SEL1 = '1' and SEL2= '0') else
			D when (SEL1 = '1' and SEL2= '1');
			
			
			
	
		
			out7seg <= "0000001" when indec="0000" else
			 	"1001111"  when indec="0001" else
			 	"0010010" when indec="0010" else
				"0000110"  when indec="0011" else
				"1001100"  when indec="0100" else
				"0100100" when indec="0101" else
				"0100000" when indec="0110" else
				"0001111"  when indec="0111" else
				"0000000" when indec="1000" else
				"0100100" when indec="1001" else
				 "1111111";
		
	


end decoder7seg;
