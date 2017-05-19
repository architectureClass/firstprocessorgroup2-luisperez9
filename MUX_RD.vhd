library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_RD is
port ( clk : in std_logic;
       entrada1 : in std_logic_vector(5 downto 0);
       entrada2 : in std_logic_vector(5 downto 0);
			 RF_DEST : in std_logic;
       salida : inout std_logic_vector(5 downto 0));
end MUX_RD;

architecture Behavioral of MUX_RD is

begin
process (RF_DEST, entrada1, entrada2, salida)
begin

	if (RF_DEST = '0') then
		salida <= entrada1;
	end if;

	if (RF_DEST = '1') then
		salida <= entrada2;
	end if;
end process;
end Behavioral;
