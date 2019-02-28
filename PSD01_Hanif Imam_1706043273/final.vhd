library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.all;

entity final is
	port (  FA,FB,FC,FD : in STD_LOGIC_VECTOR(3 downto 0);
		FPA,FPB : in STD_LOGIC;
		FO7 : out STD_LOGIC_VECTOR(6 downto 0);
		FO1 : out INTEGER);		
end entity;

architecture form of final is
	signal MA,MB,MC,MD : STD_LOGIC_VECTOR(3 downto 0);
	signal MPA,MPB : STD_LOGIC;
	signal MO : STD_LOGIC_VECTOR(3 downto 0);
	signal MO7 : STD_LOGIC_VECTOR(6 downto 0);
	signal MO1 : INTEGER;	
	
	component mux is
		port (  A,B,C,D : in STD_LOGIC_VECTOR(3 downto 0);
			PA,PB : in STD_LOGIC;
			O: out STD_LOGIC_VECTOR(3 downto 0));
	end component;

	component bit_to_dec is
		Port (  bit_in  : in  STD_LOGIC_VECTOR (3 downto 0);
			dec_out : out integer );
	end component;

	component bcd_to_7seg is
		Port (  bcd_in  : in  STD_LOGIC_VECTOR (3 downto 0);
			sev_seg : out STD_LOGIC_VECTOR (6 downto 0));
	end component;

	begin

	multi: mux
	port map(
		A  => FA,
		B  => FB, 
		C  => FC, 
		D  => FD,
		PA => FPA,
		PB => FPB,
		O  => MO
	);
			
	decim: bit_to_dec
	port map(
		bit_in  => MO,
		dec_out => FO1
	);

	seven: bcd_to_7seg
	port map(
		bcd_in  => MO,
		sev_seg => FO7
	);
	

end architecture;