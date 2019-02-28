library IEEE;

use IEEE.STD_LOGIC_1164.ALL;


entity bcd_7_segment is
    Port (
           output : out  STD_LOGIC_VECTOR (6 downto 0));
end bcd_7_segment;

architecture Behavioral of bcd_7_segment is
	signal bcd : STD_LOGIC_VECTOR(3 downto 0);
	signal sel : STD_LOGIC_VECTOR(1 downto 0) := (OTHERS => '0');
 
	component multiplexer is
    	Port ( 
		i0 : in  STD_LOGIC_VECTOR(3 downto 0) := "0000";
		i1 : in  STD_LOGIC_VECTOR(3 downto 0) := "0001";
		i2 : in  STD_LOGIC_VECTOR(3 downto 0) := "0010";
		i3 : in  STD_LOGIC_VECTOR(3 downto 0) := "0011";
		s0 : in  STD_LOGIC_VECTOR(1 downto 0);
		outt : out  STD_LOGIC_VECTOR(3 downto 0));
	end component;

	begin
	
	selecter : multiplexer
	port map(
	        outt => bcd,
		s0 => sel);

	process (bcd)
	begin
	
	output <= "0000000";
	case bcd is
	when "0000" =>
		output <= "0111111";
	when "0001" =>
		output <= "0000110";
	when "0010" =>
		output <= "1011011";
	when "0011" =>
		output <= "1001111";
	when "0100" =>
		output <= "1100110";
	when "0101" =>
		output <= "1101101";
	when "0110" =>
		output <= "1111101";
	when "0111" =>
		output <= "0000111";
	when "1000" =>
		output <= "1111111";
	when "1001" =>
		output <= "1101111";
	when "1010" =>
		output <= "1011111";
	when "1011" =>
		output <= "1111100";
	when "1100" =>
		output <= "0111001";
	when "1101" =>
		output <= "1011110";
	when "1110" =>
		output <= "1111001";
	when "1111" =>
		output <= "1110001";
	when others =>
		null;		

	end case;
	end process;
	
	--process (sel)
	--begin
	--sel <= "01" after 100ps;
	--end process;

end Behavioral;