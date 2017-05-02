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
					when "010000" => AluOp <= "010000"; --Addcc
					when "001000" => AluOp <= "001000"; --Addx
					when "011000" => AluOp <= "011000"; --Addxcc
					
					when "000100" => AluOp <= "000001"; --Sub
					when "010100" => AluOp <= "010100"; --Subcc
					when "001100" => AluOp <= "001100"; --Subx
					when "011100" => AluOp <= "011100"; --Subxcc
					
					when "000001" => AluOp <= "000010"; --And
					when "010001" => AluOp <= "010001"; --Andcc
					
					when "000101" => AluOp <= "000011"; --AndN
					when "010101" => AluOp <= "101010"; --Andncc
					
					when "000010" => AluOp <= "000100"; --Or
					when "010010" => AluOp <= "010010"; --Orcc
					
					when "000110" => AluOp <= "000101"; --OrN
					when "010110" => AluOp <= "010110"; --Orncc
					
					when "000011" => AluOp <= "000110"; --XOr
					when "010011" => AluOp <= "010011"; --XOrcc
					
					when "000111" => AluOp <= "000111"; --XNOr
					when "010111" => AluOp <= "010111"; --XNOrcc
					
					when "100101" => AluOp <= "100101"; --Sll
					when "100110" => AluOp <= "100110"; --Srl
					
					when others => AluOp <= "111111";
				end case;
				
			else
				AluOp <= "111111";
			end if;
	end process;

end Behavioral;

