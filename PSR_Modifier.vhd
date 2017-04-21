library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PSR_Modifier is
    Port ( ALuResult : in  STD_LOGIC_VECTOR (31 downto 0);
           Ope1 : in  STD_LOGIC;
           Ope2 : in  STD_LOGIC;
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end PSR_Modifier;

architecture Behavioral of PSR_Modifier is

begin




end Behavioral;

