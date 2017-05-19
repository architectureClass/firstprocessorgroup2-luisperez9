library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity UC is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
		     op2 : in  STD_LOGIC_VECTOR (2 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           icc : in STD_LOGIC_VECTOR (3 downto 0);
		     cond : in STD_LOGIC_VECTOR (3 downto 0);
		     ucout : out  STD_LOGIC_VECTOR (5 downto 0);
		     rfdest : out STD_LOGIC;
		     wrenmem : out STD_LOGIC;
		     rdenmem : out STD_LOGIC;
		     rfsource : out  STD_LOGIC_VECTOR (1 downto 0);
		     we: out STD_LOGIC;
		     pcsource : out  STD_LOGIC_VECTOR (1 downto 0));
end UC;

architecture ARq_UC of UC is

begin
	process(op,op2,op3,icc,cond)
		begin

-------------------------------------------------------------------------------------------------------------
-- Aritmeticas & logicas

		if(op = "10")then

			if(op3 = "000000")then --add
				ucout <= "000000";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "000001")then --and
				ucout <= "000001";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "000101")then --nand
				ucout <= "000010";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "000010")then --or
				ucout <= "000011";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "000110")then --nor
				ucout <= "000100";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "000011")then --xor
				ucout <= "000101";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "000111")then --xnor
				ucout <= "000110";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "000100")then --sub
				ucout <= "000111";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "010000")then --addcc
				ucout <= "001000";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "010100")then --subcc
				ucout <= "001001";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "001000")then --addx
				ucout <= "001010";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "011000")then --addxcc
				ucout <= "001011";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "001100")then --subx
				ucout <= "001111";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "011100")then --subxcc
				ucout <= "010000";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "010010")then --orcc
				ucout <= "010001";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "010001")then --andcc
				ucout <= "010010";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "010011")then --xorcc
				ucout <= "010011";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "010101")then --andncc
				ucout <= "010100";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "010110")then --orncc
				ucout <= "010101";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "010111")then --xnorcc
				ucout <= "010110";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "100101")then --SLL
				ucout <= "010111";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "100110")then --SRL
				ucout <= "011000";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "111100")then --Save
				ucout <= "011001";
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;


			if(op3 = "111101")then --Restore
				ucout <= "011010"; ---26
				pcsource <= "10";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;

			if(op3 = "111000")then --Jump and link
				ucout <= "011011"; ---27
				pcsource <= "11";
				rfsource <= "01";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';
			end if;



		end if;

----------------------------------------------------------------------------------------------------
-- CALL

		if (op = "01")then	-- CALL
			ucout <= "111111";
			pcsource <= "00"; -- PC = PC + (1* disp30)
			rfsource <= "10";
			we <= '1';
			rfdest <= '1';
			wrenmem <= '0';
			end if ;





	 if (op= "00") then
----------------------------------------------------------------------------------------------------
--BRANCH
		if (op2 = "010")then

			if (cond = "1000")then	-- BA
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			end if;

			if (cond = "1001")then -- BNE
				if (not(icc(2)) = '1')then	-- not z
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;

			if (cond = "0001")then -- BE
				if (icc(2) = '1')then	--  z
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;


			if (cond = "1010")then -- BG
				if (not(icc(2) or (icc(3) xor icc(1))) = '1')then	-- not(z or (N xor V))
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;


			if (cond = "1001")then -- BLE
				if ((icc(2) or (icc(3) xor icc(1))) = '1')then	-- z or (N xor V))
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;

			if (cond = "1011")then -- BGE
				if (not(icc(3) xor icc(1)) = '1')then	-- Not (N xor V)
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;


			if (cond = "0011")then -- BL
				if ((icc(3) xor icc(1)) = '1')then	-- N xor V
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;



			if (cond = "1100")then -- BGU
				if (not(icc(0) or icc(2)) = '1')then	-- Not (C or Z)
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;



			if (cond = "0100")then -- BLEU
				if ((icc(0) or icc(2)) = '1')then	-- C or Z
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;


			if (cond = "1101")then -- BCC
				if (not(icc(0)) = '1')then	-- Not c
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;

			if (cond = "0101")then -- BCS
				if (icc(0) = '1')then	--  c
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;

			if (cond = "1110")then -- BPOS
				if (not(icc(3)) = '1')then	-- Not N
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;

			if (cond = "0110")then -- BNEG
				if (icc(3) = '1')then	-- N
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;

			if (cond = "1111")then -- BVC
				if (not(icc(1)) = '1')then	-- Not V
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;

			if (cond = "1101")then -- BVS
				if (icc(1) = '1')then	-- V
				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
			else
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';
				end if;
			end if;

			if (cond = "0000")then -- BN
												-- 0
				ucout <= "111111";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';

			end if;



		end if;
		----------------------------------------------------------------------------------------------------
--SETHI

		if (op2 = "100")then

				ucout <= "111111";
				pcsource <= "01";
				rfsource <= "01";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';

		end if;

	end if;
----------------------------------------------------------------------------------------------------
--LOAD y STORE

	if (op= "11") then
		if(OP3="000000") then --load

				ucout <= "000000";
				pcsource <= "10";
				rfsource <= "00";
				we <= '1';
				rfdest <= '0';
				wrenmem <= '0';


		end if;

		if(OP3="000100") then --store

				ucout <= "000000";
				pcsource <= "10";
				rfsource <= "00";
				we <= '0';
				rfdest <= '0';
				wrenmem <= '0';

		end if;


	end if;
	end process;

end ARq_UC;
