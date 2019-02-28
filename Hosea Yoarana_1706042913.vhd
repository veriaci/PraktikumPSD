library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is

    port(
        clk       	: in STD_LOGIC;
        sevenseg    	: out STD_LOGIC_VECTOR(6 downto 0);
        anode  		: out STD_LOGIC_VECTOR(3 downto 0);
        switch    	: in STD_LOGIC_VECTOR(6 downto 0);
        dp		: in STD_LOGIC
         );

end main;

architecture Behavioral of main is

    signal prescaler		: STD_LOGIC_VECTOR(16 downto 0) := "11000011010100000";
    signal prescaler_counter	: STD_LOGIC_VECTOR(16 downto 0) := (others => '0');
    signal counter		: STD_LOGIC_VECTOR(1 downto 0) 	:= (others => '0');
    signal r_anodes		: STD_LOGIC_VECTOR(3 downto 0);

begin

    anode <= r_anodes;

    -- print output dalam biner
    multiplex: process(counter, switch)
    
    begin
        
        case counter(1 downto 0) is
            when "00" => r_anodes <= "1110"; --  0
            when "01" => r_anodes <= "1101"; --  1
            when "10" => r_anodes <= "1011"; --  2
            when "11" => r_anodes <= "0111"; --  3

            when others => r_anodes <= "1111"; 
        end case;

        -- cek 7segment
        case r_anodes is
            when "1110" => 
                if switch(0) = '1' then
                    sevenseg <= "1111001"; -- 1
                else
                    sevenseg <= "1000000"; -- 0
                end if;
            when "1101" => 
                if switch(1) = '1' then
                    sevenseg <= "1111001"; -- 1
                else
                    sevenseg <= "1000000"; -- 0
                end if;
            when "1011" => 
                if switch(2) = '1' then
                    sevenseg <= "1111001"; -- 1
                else
                    sevenseg <= "1000000"; -- 0
                end if;
            when "0111" => 
                if switch(3) = '1' then
                    sevenseg <= "1111001"; -- 1
                else
                    sevenseg <= "1000000"; -- 0
                end if;

            when others => sevenseg <= "1111111"; 
        end case;

    end process;

    countClk: process(clk, counter)
    begin

        if rising_edge(clk) then
            prescaler_counter <= prescaler_counter + 1;
            if(prescaler_counter = prescaler) then
                
                counter <= counter + 1;

                prescaler_counter <= (others => '0');

            end if;
        end if;
    end process;


end Behavioral;
