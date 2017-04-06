
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux is
    Port ( input_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           input_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           s : in  STD_LOGIC;
           mux_out : inout  STD_LOGIC_VECTOR (31 downto 0));
end Mux;

architecture Behavioral of Mux is

begin

	process(input_1,input_2,s)
		begin
			if(s = '0')then
				mux_out<=input_1;
			else
				mux_out<=input_2;
			end if;
		end process;
end Behavioral;

