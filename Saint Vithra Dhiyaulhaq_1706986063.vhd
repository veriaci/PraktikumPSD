library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entitity gabung is
	port ( SEL: in std_logic_vector (1 downto 0);
			A,B,C,D: in std_logic_vector (3 downto 0);
			X: out std_logic);
			LED: out std_logic_vector(6 downto 0);
			bar: in std_logic_vector (3 downto 0);
end gabung;

architecture mux_4ke1 of gabung is
begin
with SEL select
	x <=A(0) when "0000",
		A(1) when "0001",
		A(2) when "0010",
		A(3) when "0011",
		
end mux_4ke1;	

architecture 7segment of all is
begin

led(bar)
begin
    case bar is
    when "0000" => LED <= "0000001";   
    when "0001" => LED <= "1001111";  
    when "0010" => LED <= "0010010";  
    when "0011" => LED <= "0000110"; 
    when "0100" => LED <= "1001100"; 
    when "0101" => LED <= "0100100"; 
    when "0110" => LED <= "0100000"; 
    when "0111" => LED <= "0001111"; 
    when "1000" => LED <= "0000000"; 
    when "1001" => LED <= "0000100"; 
    end case;
end led;

end 7segment;