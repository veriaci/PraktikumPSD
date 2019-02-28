LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY SEVSEG2 IS
PORT(

	A : out STD_LOGIC;--output sevseg A
	B : OUT STD_LOGIC;--output sevseg b
	C : OUT STD_LOGIC;--output sevseg C
	D : out STD_LOGIC;--output sevseg D
	E : OUT STD_LOGIC;--output sevseg E
	F : OUT STD_LOGIC;--output sevseg F
	G : out STD_LOGIC;--output sevseg G
	pemilih : IN std_logic_vector(1 downto 0) := (others => '0') --input selector
	);
	end SEVSEG2;
	
	
architecture BCD2 of SEVSEG2 is
	signal masukan : std_logic_vector(3 downto 0);
	signal IA :  STD_LOGIC_VECTOR(3 DOWNTO 0) := B"0000";--input switch IA
	SIGNAL IB :  STD_LOGIC_VECTOR(3 DOWNTO 0) := B"0001";--input switch IB
	SIGNAL IC :  STD_LOGIC_VECTOR(3 DOWNTO 0) := B"0010";--input switch IC
	SIGNAL ID :  STD_LOGIC_VECTOR(3 DOWNTO 0) := B"0011";---input switch ID

	begin
		
	process (masukan,PEMILIH)
	begin
		CASE PEMILIH IS --selector function
			WHEN "00" =>
			MASUKAN <= IA;
			WHEN "01" =>
			MASUKAN <= IB;
			WHEN "10" =>
			MASUKAN <= IC;
			WHEN "11" =>
			MASUKAN <= ID;
			WHEN OTHERS =>
			MASUKAN <= "0000";
		END CASE;
		CASE MASUKAN IS --decoder sev seg function
			WHEN "0000" =>
				A <= '1';
				B <= '1';
				C <= '1';
				D <= '1';
				E <= '1';
				F <= '1';
				G <= '0';

				WHEN "0001" =>
				A <= '0';
				B <= '1';
				C <= '1';
				D <= '0';
				E <= '0';
				F <= '0';
				G <= '0';			
				WHEN "0010" =>
				A <= '1';
				B <= '1';
				C <= '0';
				D <= '1';
				E <= '1';
				F <= '0';
				G <= '1';	
				WHEN "0011" =>
				A <= '1';
				B <= '1';
				C <= '1';
				D <= '1';
				E <= '0';
				F <= '0';
				G <= '1';		
				WHEN "0100" =>
				A <= '0';
				B <= '1';
				C <= '1';
				D <= '0';
				E <= '0';
				F <= '1';
				G <= '1';	
				WHEN "0101" =>
				A <= '1';
				B <= '0';
				C <= '1';
				D <= '1';
				E <= '0';
				F <= '1';
				G <= '1';	
				WHEN "0110" =>
				A <= '1';
				B <= '0';
				C <= '1';
				D <= '1';
				E <= '1';
				F <= '1';
				G <= '1';
			WHEN "0111" =>
				A <= '1';
				B <= '1';
				C <= '1';
				D <= '0';
				E <= '0';
				F <= '0';
				G <= '0';		
				WHEN "1000" =>
				A <= '1';
				B <= '1';
				C <= '1';
				D <= '1';
				E <= '1';
				F <= '1';
				G <= '1';	
				WHEN "1001" =>
				A <= '1';
				B <= '1';
				C <= '1';
				D <= '1';
				E <= '0';
				F <= '1';
				G <= '1';
			WHEN OTHERS =>
				A <= '-';
				B <= '-';
				C <= '-';
				D <= '-';
				E <= '-';
				F <= '-';
				G <= '-';	
			END CASE;
	End Process;
	end architecture;
		
