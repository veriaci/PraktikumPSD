Library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.All;
use ieee.std_logic_unsigned.All;

ENTITY Mux IS
PORT(
B : IN BIT_VECTOR (0 to 3);
sel : IN BIT_VECTOR(0 to 1);
clk : IN BIT;
e : in std_logic_vector(3 downto 0);
output : OUT BIT;
s : out std_logic_vector(7 downto 0)
);
end Mux;

ARCHITECTURE example OF Mux IS
BEGIN
PROCESS (clk)
    VARIABLE temp : BIT;
    BEGIN
        IF(clk = '1') THEN
            IF sel = "00" THEN
                temp := B (0);
            ELSIF sel = "01" THEN
                temp := B (1);
            ELSIF sel = "10" THEN
                temp := B (2);
            ELSE
                temp := B (3);
            END IF;
            output <= temp AFTER 5ns;
        END IF;
    END PROCESS;
END example;

architecture Behavioral of Mux is
begin
s <= "00000110" when e="0001" else --1
"01011011" when e="0010" else --2
"01001111" when e="0011" else --3
"01100110" when e="0100" else --4
"01101101" when e="0101" else --5
"01111101" when e="0110" else --6
"00000111" when e="0111" else --7
"01111111" when e="1000" else --8
"01101111" when e="1001" else --9
"01110111" when e="1010" else --A
"01111100" when e="1011" else --B
"00111001" when e="1100" else --C
"01011110" when e="1101" else --D
"01111001" when e="1110" else --E
"01110001" when e="1111" else --F
"00111111"; --0
end Behavioral;