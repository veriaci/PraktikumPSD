library IEEE;
use IEEE_STD_LOGIC_1164.ALL;

entity Mux_4to1 is
	port(
		V, W, X, Y				:	in STD_LOGIC_VECTOR (3 downto 0);
		S0, S1					:	in STD_LOGIC_VECTOR (3 downto 0);
		B0, B1, B2, B3			:	in STD_LOGIC_VECTOR (3 downto 0);
		A, B, C, D, E, F, G	:	out STD_LOGIC_VECTOR (3 downto 0);
		Z							:	out STD_LOGIC_VECTOR (3 downto 0)
	);
end Mux_4to1;

architecture bhv of Mux_4to1 is
begin

	process (V, W, X, Y, S0, S1) is
	begin

		if (S0 ='0' and S1 = '0') then
			Z <= V;
		elsif (S0 ='1' and S1 = '0') then
			Z <= W;
		elsif (S0 ='0' and S1 = '1') then
			Z <= X;
		else
			Z <= Y;
		end if;
		
	end process;
	
end bhv;

architecture Behavioral of bcd_7seg is
begin

A <= B0 OR B2 OR (B1 AND B3) OR (NOT B1 AND NOT B3);
B <= (NOT B1) OR (NOT B2 AND NOT B3) OR (B2 AND B3);
C <= B1 OR NOT B2 OR B3;
D <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3) OR (B1 AND NOT B2 AND B3) OR (NOT B1 AND B2) OR B0;
E <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3);
F <= B0 OR (NOT B2 AND NOT B3) OR (B1 AND NOT B2) OR (B1 AND NOT B3);
G <= B0 OR (B1 AND NOT B2) OR ( NOT B1 AND B2) OR (B2 AND NOT B3);

end Behavioral;

