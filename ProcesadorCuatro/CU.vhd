library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CU is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture Behavioral of CU is

begin

	process(op,op3)
	begin
		if(op = "10")then
			case(op3) is
				when "000001" => --AND
					AluOp <= "000000";
				when "000101" => --ANDn
					AluOp <= "000001";
				when "000010" => --OR
					AluOp <= "000010";
				when "000110" => --ORN
					AluOp <= "000011";
				when "000011" =>  --XOR
					AluOp <= "000100";
				when "000111" => --XNOR
					AluOp <= "000101";
				when "000000" => --ADD
					AluOp <= "000110";		
				when "000100" => --SUB
					AluOp <= "000111";
				when "010000" => --ADDcc
					AluOp <= "001000";
				when "011000" => --ADDXcc
					AluOp <= "001001";
				when "010100" => --SUBcc
					AluOp <= "001010";
				when "011100" => --SUBXcc
					AluOp <= "001011";
				when "010001" => --ANDcc
					AluOp <= "001100";
				when "010101" => --ANDncc
					AluOp <= "001101";
				when "010010" => --ORcc
					AluOp <= "001110";
				when "010110" => --ORncc
					AluOp <= "001111";
				when "010011" => --XORcc
					AluOp <= "010000";
				when "010111" => --XNORcc
					AluOp <= "010001";
				when "001000" => --ADDx
					AluOp <= "010010";
				when "001100" => --SUBx
					AluOp <= "010011";
				when "100101" => --SLL
					AluOp <= "010100";
				when "100110" => --SRL
					AluOp <= "010101";
				when "111100" =>--Save
					AluOp <= "111110";
				when "111101" =>--Restore
					AluOp <= "110111";
				when others => 
					AluOp <= "111111";
			end case;
		end if;	
	end process;
					

end Behavioral;