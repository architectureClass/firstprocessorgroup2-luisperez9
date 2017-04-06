library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity SEU is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture Behavioral of SEU is

signal temp : std_logic_vector(31 downto 0) := (others => '1');

begin
	process(imm13)
	begin
		--temp (12 downto 0) <= imm13;
		--if(imm13(12) = '0')then
			
			--temp (31 downto 13) <= (others => '0');
		
		--end if;
		--crs2 <= temp;
		crs2 <= std_logic_vector(resize(signed(imm13), crs2'length));
	
	end process;


end Behavioral;

