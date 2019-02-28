library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxbcd7 is 
	port ( A, B, C, D : in std_logic_vector(3 downto 0); 
	selector  : in std_logic_vector(2 downto 0);
	BCDin : in std_logic_vector (3 downto 0);
	result, Seven_Segment : out std_logic_vector (2 downto 0));
	end muxbcd7;

architecture mux of muxbcd7 is
begin
	process (A, B, C, D, selector)
	begin
		if (selector = "0000") then result <= D;
		elsif (selector = "0001") then result <= C;
		elsif (selector = "0010") then result <= B;
		else result <= A;
		end if;
	end process;

architecture bcd of muxbcd7 is
begin	
	process(result)
	begin
		if (result = A) then BCDin <= "0000";
		elsif (result = B) then BCDin <= "0001";
		elsif (result = C) then BCDin <= "0010";
		elsif (result = D) then BCDin <= "0011";
		end if;
	end process;

architecture final of muxbcd7 is
begin
	process(BCDin)
	begin
		case BCDin is 
			when "0000" => Seven_Segment <= "0000001"; ---0 
			when "0001" => Seven_Segment <= "1001111"; ---1 
			when "0010" => Seven_Segment <= "0010010"; ---2 
			when "0011" => Seven_Segment <= "0000110"; ---3 
		end case;
	end process;
