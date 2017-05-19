library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR_M is
port (	 rst : in std_logic;
			 CRS1 : in std_logic;
			 operando2  : in std_logic;
          AluResult : in std_logic_vector(31 downto 0);
          AluOP : in std_logic_vector(5 downto 0);
          nzvc : out std_logic_vector(3 downto 0));
end PSR_M;

architecture Behavioral of PSR_M is
begin
process(CRS1, operando2, AluResult, AluOP, rst)
	begin
		if (rst = '1') then
			nzvc <= "0000";
		else

			--Instrucciones L�gicas
			if(AluOp = "010010" or AluOp = "010100" or AluOp = "010001" or AluOp = "010101" or AluOp = "010011" or AluOp = "010110")then
				nzvc(3) <= AluResult(31);
				if(AluResult = x"00000000" )then
						nzvc(2) <= '1';
					else
						nzvc(2) <= '0';

				end if;
				nzvc(1) <= '0';
				nzvc(0) <= '0';
			end if;

			-- Instrucciones addcc & addxcc

			if( AluOp = "001000" or AluOp = "001011")then
				nzvc(3) <= AluResult(31);
				if(AluResult = x"00000000" )then
					nzvc(2) <= '1';
					else
						nzvc(2) <= '0';

				end if;
				nzvc(1) <= ((CRS1 and operando2 and not(AluResult(31))) or ( not(CRS1) and not(operando2) and AluResult(31)));
				nzvc(0) <= ((CRS1 and operando2) or (not(AluResult(31)) and (CRS1 or operando2)));
			end if;

			-- Instrucciones Subcc & subxcc

			if( AluOp = "001001" or AluOp = "010000")then
				nzvc(3) <= AluResult(31);
				if(AluResult = x"00000000" )then
					nzvc(2) <= '1';
					else
						nzvc(2) <= '0';

				end if;
				nzvc(1) <= ((CRS1 and not(operando2) and not(AluResult(31))) or ( not(CRS1) and operando2 and AluResult(31)));
				nzvc(0) <= ((not(CRS1) and operando2 ) or ( AluResult(31) and (not(CRS1) or operando2)));
			end if;
			--
		end if;

end process;
end Behavioral;
