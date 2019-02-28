library IEEE;
use IEEE.std_logic_1164.all;


architecture mux_4bit of proyek1 is
begin
 Output <= X when (SEL = "0011") else
  Y when (SEL = "0010") else
  Z when (SEL = "0001") else
  W when (SEL = "0000") else
  "0000";
  
end mux_4bit;

entity proyek1 is
port (
 X, Y, Z, W : in std_logic_vector(3 downto 0);
 SEL :in std_logic_vector(3 downto 0);
 Output : out std_logic_vector(3 downto 0);
 XYZ : in std_logic_vector (3 downto 0);
 Segment : out std_logic_vector (6 downto 0));
end proyek1;

architecture xyz_ke7segmen of proyek1 is
begin

process(XYZ)
begin


 case XYZ is
 when "0000" => Segment <= "0000001"; ---0
 when "0001" => Segment <= "1001111"; ---1
 when "0010" => Segment <= "0010010"; ---2
 when "0011" => Segment <= "0000110"; ---3
 when others => Segment <= "1111111"; ---null
 end case;
 
 
end process;
end xyz_ke7segmen;
