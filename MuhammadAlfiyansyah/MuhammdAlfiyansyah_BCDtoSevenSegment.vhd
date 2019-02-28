library IEEE;
use IEEE.std_logic_1164.all;

entity BCD_seven is
port (	
	A1 : in std_logic_vector (3 downto 0) := "0000";
	B1 : in std_logic_vector (3 downto 0) := "0001";
	C1 : in std_logic_vector (3 downto 0) := "0010";
	D1 : in std_logic_vector (3 downto 0) := "0011";
	selector : in integer range 0 to 3;
	BCD1 : in std_logic_vector (3 downto 0);
	BCD2: in std_logic_vector (3 downto 0);
	seven_segment : out std_logic_vector (6 downto 0)
	);
end BCD_seven;

architecture structural of BCD_seven is
	Signal M1_OUT : std_logic_vector (3 downto 0);
	Signal M2_OUT : std_logic_vector (3 downto 0);
	begin
		M1 : entity work.Mul_1(behave)
		PORT MAP (
		input_1 => A1,
		input_2 => B1,
		s => selector,
		output_1 => M1_OUT);

		M2 : entity work.Mul_2 (behave)
		PORT MAP (
		input_3 => C1,
		input_4 => D1,
		s => selector,
		output_2 => M2_OUT);

		M3 : entity work.BCD (behave)
		PORT MAP (
		BCD1 => M1_OUT,
		BCD2 => M2_OUT,
		result => seven_segment);
		

End structural;

architecture behave of BCD_seven is
begin
	process (BCD1, BCD2)
	variable BCDtrueinput : std_logic_vector (7 downto 0);
	begin
		BCDtrueinput := BCD1 & BCD2;
		case BCDtrueinput is 
			when "00000010" =>
			seven_segment <= "0010010";
			when "00000011" =>
			seven_segment<= "0000110";
			when others =>
			seven_segment<= "-------";
		end case;
	end process;
end behave;
		
	

	
	

