library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ALU is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
			  c	:	in	std_logic;
           dwr : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is



begin

	process(crs1,crs2,aluop)
	begin
		
		
		case aluop is
			
			--ADD
			when "000000" => dwr <= std_logic_vector(signed(crs1) + signed(crs2)); 	--Add
			
			when "010000" => dwr <= std_logic_vector(signed(crs1) + signed(crs2)); 	--Addcc
			
			when "001000" => dwr <= std_logic_vector(signed(crs1) + signed(crs2) + signed(c)); 	--Addx
			
			when "011000" => dwr <= std_logic_vector(signed(crs1) + signed(crs2) + signed(c)); 	--Addxcc
			
			--SUB
			when "000001" => dwr <= std_logic_vector(signed(crs1) - signed(crs2)); 	--Sub
			
			when "010001" => dwr <= std_logic_vector(signed(crs1) - signed(crs2)); 	--Subcc
			
			when "001001" => dwr <= std_logic_vector(signed(crs1) - signed(crs2) - signed(c)); 	--Subx
			
			when "011001" => dwr <= std_logic_vector(signed(crs1) - signed(crs2) - signed(c)); 	--Subxcc
			
			--AND
			when "000010" => dwr <= crs1 and crs2; 			 								--And
			
			when "010010" => dwr <= crs1 and crs2; 			 								--Andcc
			
			--ANDN
			when "000011" => dwr <= crs1 and (not(crs2));									--AndN
			
			when "010011" => dwr <= crs1 and (not(crs2));									--AndNcc
			
			--OR
			when "000100" => dwr <= crs1 or crs2;												--Or
			
			when "010100" => dwr <= crs1 or crs2;												--Orcc
			
			--ORN
			when "000101" => dwr <= crs1 or (not(crs2));										--OrN
			
			when "010101" => dwr <= crs1 or (not(crs2));										--OrNcc
			
			--XOR
			when "000110" => dwr <= crs1 xor crs2;												--XOr
			
			when "010110" => dwr <= crs1 xor crs2;												--XOrcc
			
			--XNOR
			when "000111" => dwr <= not(crs1 xor crs2);										--XNOr
			
			when "010111" => dwr <= not(crs1 xor crs2);										--XNOrcc
			
			when others => dwr <= (others => '0');
		end case;
	end process;

end Behavioral;

