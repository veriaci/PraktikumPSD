--Ilham Mulya Rafid
--1706985994
--PSD 02

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity combination is
port (
        clk      : in std_logic;
        bcd      : in std_logic_vector( 3 downto 0 );  
        segment7 : out std_logic_vector( 6 downto 0 ));
end combination;

architecture logic of combination is
    
    component Mux_4to1 is
        port ( 	A3, A2, A1, A0 	: in std_logic;
            SEL		: in std_logic_vector(1 downto 0);
            MX_OUT		: out std_logic );
        end Mux_4to1;
    
    component bin8bcd is
        port (
            bin:    in  std_logic_vector (7 downto 0);
            bcd:    out std_logic_vector (11 downto 0) );
        end bin8bcd;

    component 8bcd_tb is
            signal bin: std_logic_vector (7 downto 0) := (others => '0');
            signal bcd: std_logic_vector (11 downto 0);
        end 8bcd_tb;

    begin
        MX_OUT <= A3 when (SEL(1) = '1' and SEL(0) ='1') else
		A2 when (SEL(1) = '1' and SEL(0) ='0') else
		A1 when (SEL(1) = '0' and SEL(0) ='1') else
		A0 when (SEL(1) = '0' and SEL(0) ='0') else
        '0';
        
        procedure add3 (signal bin: in  std_logic_vector (3 downto 0); 
                    signal bcd: out std_logic_vector (3 downto 0)) is
    variable is_gt_4:  std_logic;
    begin
        is_gt_4 := bin(3) or (bin(2) and (bin(1) or bin(0)));

        if is_gt_4 = '1' then
            bcd <= std_logic_vector(unsigned(bin) + "0011");
        else
            bcd <= bin;
        end if;
    end procedure;

    signal U0bin,U1bin,U2bin,U3bin,U4bin,U5bin,U6bin:
                std_logic_vector (3 downto 0);

    signal U0bcd,U1bcd,U2bcd,U3bcd,U4bcd,U5bcd,U6bcd:
                std_logic_vector (3 downto 0);       
    begin
        U0bin <= '0' & bin (7 downto 5);
        U1bin <= U0bcd(2 downto 0) & bin(4);
        U2bin <= U1bcd(2 downto 0) & bin(3);
        U3bin <= U2bcd(2 downto 0) & bin(2);
        U4bin <= U3bcd(2 downto 0) & bin(1);

        U5bin <= '0' & U0bcd(3) & U1bcd(3) & U2bcd(3);
        U6bin <= U5bcd(2 downto 0) & U3bcd(3);

    U0: add3(U0bin,U0bcd);

    U1: add3(U1bin,U1bcd);

    U2: add3(U2bin,U2bcd);

    U3: add3(U3bin,U3bcd);

    U4: add3(U4bin,U4bcd);

    U5: add3(U5bin,U5bcd);

    U6: add3(U6bin,U6bcd);

    OUTP:
        bcd <= '0' & '0' & U5bcd(3) & U6bcd & U4bcd & bin(0);

begin

    DUT:
    entity work.bin8bcd
        port map (
            bin => bin,
            bcd => bcd
        );

    STIMULUS:
    process

    begin
        for i in 0 to 255 loop
            bin <= std_logic_vector(to_unsigned(i,8));
            wait for 1 ns;
        end loop;
        wait for 1 ns;
        wait;

    process (clk,bcd)
        BEGIN
        if (clk'event and clk='1') then
            case  bcd is
                when "0000"=> segment7 <="0000001";  -- '0'
                when "0001"=> segment7 <="1001111";  -- '1'
                when "0010"=> segment7 <="0010010";  -- '2'
                when "0011"=> segment7 <="0000110";  -- '3'
                when "0100"=> segment7 <="1001100";  -- '4' 
                when "0101"=> segment7 <="0100100";  -- '5'
                when "0110"=> segment7 <="0100000";  -- '6'
                when "0111"=> segment7 <="0001111";  -- '7'
                when "1000"=> segment7 <="0000000";  -- '8'
                when "1001"=> segment7 <="0000100";  -- '9'
                when others=> segment7 <="1111111"; 
            end case;
        end if;
    end process;

end architecture;