library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX32_ALU is
port (clk : in std_logic;
			 opcion  : in std_logic_vector(1 downto 0);
          entrada1 : in std_logic_vector(31 downto 0);
          entrada2 : in std_logic_vector(31 downto 0);
			 entrada3 : in std_logic_vector (31 downto 0);
          salida : inout std_logic_vector(31 downto 0));
end MUX32_ALU;

architecture arq_muxalu of MUX32_ALU is

begin
process (opcion, entrada1, entrada2, entrada3, salida)
begin

   if (opcion = "00") then
		salida <= entrada1;
	end if;

	if (opcion = "01") then
		salida <= entrada2;
	end if;

	if (opcion = "10") then
		salida <= entrada3;
	end if;

end process;

end arq_muxalu;
