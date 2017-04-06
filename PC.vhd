library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity PC is
    Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
		
end PC;

architecture Behavioral of PC is

begin

process (clk)

begin
	
		if(rising_edge(clk)) then
			if(rst = '1') then
				DataOut <="00000000000000000000000000000000";
				
			else 
				DataOut <=  Data;
				
			end if;
		end if;
end process;
end Behavioral;

