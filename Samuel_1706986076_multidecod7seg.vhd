entity  helloworld1 is 
end entity;


architecture sim of helloworld1 is 
begin
	process is 
	begin 
		report "HELLO WORLD";
		wait;
	end process;
end architecture;