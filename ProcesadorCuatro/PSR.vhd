library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           ncwp : in  STD_LOGIC_vector (0 downto 0);
           cwp : out  STD_LOGIC_vector (0 downto 0);
           icc : out  STD_LOGIC_vector (0 downto 0));
end PSR;

architecture Behavioral of PSR is

begin

process(clk,rst, nzvc)
begin
	if(rising_edge(clk))then
		if(rst='0')then
			icc(0) <= nzvc(0);
			cwp <= "0";
		else
			icc <= "0";
			cwp <= ncwp;
		end if;
	end if;
end process;
end Behavioral;
