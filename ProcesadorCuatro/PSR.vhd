library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           ncwp : in  STD_LOGIC;
           cwp : out  STD_LOGIC;
           icc : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

begin

process(clk,rst, nzvc)
begin
	if(rising_edge(clk))then
		if(rst='0')then
			icc <= nzvc(0);
			cwp <= '0';
		else
			icc <= '0';
			cwp <= ncwp;
		end if;
	end if;
end process;
end Behavioral;

