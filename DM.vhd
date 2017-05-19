library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DM is
    Port ( reset : in  STD_LOGIC;
           WEnable : in  STD_LOGIC;
			     RDEnable : in  STD_LOGIC;
           Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           DMout : out  STD_LOGIC_VECTOR (31 downto 0));
end DM;

architecture Behavioral of DM is

	type ram_type is array (0 to 31) of std_logic_vector (31 downto 0);
	signal Memori : ram_type:=(others => x"00000000");

begin

	process(reset, WEnable, RDEnable, Address, Data)
	begin
		if(reset = '1')then
			DMout <= (others => '0');
			Memori <= (others => x"00000000");
		else
			if(WEnable = '0')then
				DMout <= Memori(conv_integer(Address(4 downto 0)));
			else
				DMout <= Memori(conv_integer(Address(4 downto 0)));
				Memori(conv_integer(Address(4 downto 0))) <= Data;
			end if;
		end if;
	end process;
end Behavioral;
