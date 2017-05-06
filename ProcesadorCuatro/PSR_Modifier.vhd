library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR_Modifier is
    Port (ALuResult : in  STD_LOGIC_VECTOR (31 downto 0);
           Ope1 : in  STD_LOGIC; 
           Ope2 : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           nzvc : out std_logic_vector(3 downto 0));
end PSR_Modifier;

architecture Behavioral of PSR_Modifier is

--signal snzvc : std_logic_vector (3 downto 0);

begin
	process(ALuResult, ALUOP, Ope1, Ope2,rst)
	begin
		if rst = '1' then
			nzvc <="0000";
		else

			if(ALUOP = "001000" or ALUOP = "001001")then   --ADDcc ADDxcc
				nzvc(3) <=ALuResult(31);
				if(ALuResult = x"00000000")then
					nzvc(2) <= '1';
				else
					nzvc(2) <= '0';
				end if;
				nzvc(1) <= (Ope1 and Ope2 and (not ALuResult(31))) or ((Ope1) and (not Ope2) and ALuResult(31));
				nzvc(0) <= (Ope1 and Ope2) or ((not ALuResult(31)) and (Ope1 or Ope2));
			else
				if(ALUOP = "001010" or ALUOP = "001011")then --SUBcc SUBxcc
					nzvc(3) <=ALuResult(31);
					if(ALuResult = x"00000000")then
						nzvc(2) <= '1';
					else
						nzvc(2) <= '0';
					end if;
					nzvc(1) <= ((Ope1 and (not Ope2) and (not ALuResult(31))) or ((not Ope1) and Ope2 and ALuResult(31)));
					nzvc(0) <= ((not Ope1) and Ope2) or (ALuResult(31) and ((not Ope1) or Ope2));
				else
					if(ALUOP = "001100" or ALUOP = "001101" or ALUOP = "001110" or ALUOP = "001111" or ALUOP = "010000" or ALUOP = "010001")then
						--ANDcc ANDncc ORcc ORncc XORcc XNORcc
						nzvc(3) <=ALuResult(31);
						if (ALuResult = x"00000000") then
							nzvc(2) <= '1';
						else
							nzvc(2) <= '0';
						end if;
						nzvc(1) <= '0';
						nzvc(0) <= '0';
					end if;
				end if;
			end if;
		end if;
	--	nzvc <= snzvc;
	end process;
	
	
	
end Behavioral;
