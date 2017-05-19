library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU22 is
Port ( inme22 : in  STD_LOGIC_VECTOR (21 downto 0);
           seu_out : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU22;

architecture ARq_SEU22 of SEU22 is

signal aux1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
signal aux2 : STD_LOGIC_VECTOR (9 downto 0) := "1111111111";


begin
process(inme22)

	begin
			if(inme22(21)= '0')then
				seu_out <= aux1 & inme22;
			end if;

			if(inme22(21)= '1')then
				seu_out <= aux2 & inme22;
			end if;

end process;



end ARq_SEU22;
