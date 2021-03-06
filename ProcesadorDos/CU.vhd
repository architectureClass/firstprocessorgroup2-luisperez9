library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CU is
    Port ( op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture Behavioral of CU is

begin
	process(op3, op)
		begin
			if (op = "10") then
				case op3 is
					when "000000" => AluOp <= "000000"; --Add
					when "000100" => AluOp <= "000001"; --Sub
					when "000001" => AluOp <= "000010"; --And
					when "000101" => AluOp <= "000011"; --AndN
					when "000010" => AluOp <= "000100"; --Or
					when "000110" => AluOp <= "000101"; --OrN
					when "000011" => AluOp <= "000110"; --XOr
					when "000111" => AluOp <= "000111"; --XNOr
					when others => AluOp <= "111111";
				end case;
				
			else
				AluOp <= "111111";
			end if;
	end process;

end Behavioral;

