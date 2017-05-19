
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU32 is
    Port ( inme13 : in  STD_LOGIC_VECTOR (12 downto 0);
           seu_out : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU32;

architecture ARq_SEU32 of SEU32 is

signal aux1 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
signal aux2 : STD_LOGIC_VECTOR (18 downto 0) := "1111111111111111111";

begin

process(inme13)

	begin
			if(inme13(12)= '0')then
				seu_out <= aux1 & inme13;
			end if;

			if(inme13(12)= '1')then
				seu_out <= aux2 & inme13;
			end if;

end process;


end ARq_SEU32;
