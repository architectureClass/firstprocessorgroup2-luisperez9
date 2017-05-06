library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity ALU is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           c: in	std_logic;
           aluop  : in  STD_LOGIC_VECTOR (5 downto 0);
           dwr : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

	process(crs1,crs2,aluop,c )
	begin
		case (aluop ) is 
			when "000000" => --AND
				dwr <= crs1 and crs2;
			when "000001" => --ANDn
				dwr <= not(crs1 and crs2);
			when "000010" => --OR
				dwr <= crs1 or crs2;
			when "000011" => --ORN
				dwr <= not(crs1 or crs2);
			when "000100" => --XOR
				dwr <= crs1 xor crs2;
			when "000101" => --XNOR
				dwr <= not(crs1 xor crs2);
			when "000110" => --ADD
				dwr <= crs1 + crs2;
			when "000111" => --SUB
				dwr <= crs1 - crs2;
			when "001000" => --ADDcc
				dwr <= crs1 + crs2;
			when "001001" => --ADDxcc
				dwr <= crs1 + crs2 + c;
			when "001010" => --SUBcc
				dwr <= crs1 - crs2;
			when "001011" => --SUBxcc
				dwr <= crs1 - crs2 - c;
			when "001100" => --ANDcc
				dwr <= crs1 and crs2;
			when "001101" => --ANDncc
				dwr <= not(crs1 and crs2);
			when "001110" => --ORcc
				dwr <= crs1 or crs2;
			when "001111" => --ORncc
				dwr <= not(crs1 or crs2);
			when "010000" => --XORcc
				dwr <= crs1 xor crs2;
			when "010001" => --XNORcc
				dwr <= not(crs1 xor crs2);
			when "010010" => --ADDx
				dwr <= crs1 + crs2 + c;
			when "010011" => --SUBx
				dwr <= crs1 - crs2 - c;
			when "010100" => --SLL
				dwr <= to_stdlogicvector(to_bitvector(crs1)sll conv_integer(crs2));
			when "010101" => --SRL
				dwr <= to_stdlogicvector(to_bitvector(crs1)srl conv_integer(crs2));
			when "111110" =>--Save
				dwr <= crs1 + crs2;
			when "110111" =>--Restore
				dwr <= crs1 + crs2;
			when others =>
				dwr <= "11111111111111111111111111111111";
		end case;
	end process;
	
end Behavioral;