library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit_to_dec is
	Port (  bit_in  : in  STD_LOGIC_VECTOR (3 downto 0);
		dec_out : out integer );
end entity;

architecture convert_bd of bit_to_dec is
begin
	process(bit_in)
	begin
	
	case bit_in is
	when "0000" => dec_out <= 0;  -- 0
	when "0001" => dec_out <= 1;  -- 1
	when "0010" => dec_out <= 2;  -- 2
	when "0011" => dec_out <= 3;  -- 3
	when "0100" => dec_out <= 4;  -- 4
	when "0101" => dec_out <= 5;  -- 5
	when "0110" => dec_out <= 6;  -- 6
	when "0111" => dec_out <= 7;  -- 7
	when "1000" => dec_out <= 8;  -- 8
	when "1001" => dec_out <= 9;  -- 9
	when others => dec_out <= 0;  -- NULL
	end case;
	
	end process;	

end architecture;