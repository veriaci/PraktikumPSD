library IEEE;
use IEEE.std_logic_1164.all;


architecture multiplexer of works is
begin
 Output <= I when (SEL = "0011") else
  J when (SEL = "0010") else
  K when (SEL = "0001") else
  L when (SEL = "0000") else
  "0000";
  
end multiplexer;

entity works is

port (
 I, J, K, L : in std_logic_vector(3 downto 0);
 SEL :in std_logic_vector(3 downto 0);
 Output : out std_logic_vector(3 downto 0);
 IJK : in std_logic_vector (3 downto 0);
 Segment : out std_logic_vector (6 downto 0));
end works;


architecture ijk_segment7 of works is
begin


process(IJK)
begin


 case IJK is

 when "0000" => Segment <= "0000001"; ---0
 when "0001" => Segment <= "1001111"; ---1
 when "0010" => Segment <= "0010010"; ---2
 when "0011" => Segment <= "0000110"; ---3
 when others => Segment <= "1111111"; ---null
 end case;
 
 
end process;


end ijk_segment7;
