library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity wm is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rsd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC_vector (0 downto 0);
           ncwp : out  STD_LOGIC_vector (0 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0));
end wm;

architecture Behavioral of wm is

signal n_rs1: integer range 0 to 39:=0;
signal n_rs2: integer range 0 to 39:=0;
signal n_rsd: integer range 0 to 39:=0;


begin
process(cwp,rs1,rs2,rsd,op,op3)
begin

	if (op="10" and op3="111100") then -- Save
		ncwp <= "0";
	else
		if (op="10" and op3="111101")then --Restore
			ncwp <= "1";
		end if;
	end if;
	
	----Determinar el registro rs2
	if(rs2>="00000" and rs2<="00111")then --Evalua registros globales
		n_rs2 <= to_integer(unsigned(rs2));
	else
		if(rs2 >= "11000" and rs2 <= "11111")then -- Evalua registros de entrada
			n_rs2 <= to_integer(unsigned(rs2)) - (to_integer(unsigned(cwp))*16);
		else
			if(rs2 >= "10000" and rs2 <= "10111")then -- Evalua registros locales
				n_rs2 <= to_integer(unsigned(rs2))+(to_integer(unsigned(cwp))*16);
			else
				if(rs2 >= "01000" and rs2 <= "01111")then -- Evalua registros de salida
					n_rs2 <= to_integer(unsigned(rs2)) + (to_integer(unsigned(cwp))*16);
				end if;
			end if;
		end if;
	end if;

  ---Determinar el registro rs1
	if(rs1>="00000" and rs1<="00111")then --Evalua registros globales
		n_rs1 <= to_integer(unsigned(rs1));
	else
		if(rs1 >= "11000" and rs1 <= "11111")then -- Evalua registros de entrada
			n_rs1 <= to_integer(unsigned(rs1)) - (to_integer(unsigned(cwp))*16);
		else
			if(rs1 >= "10000" and rs1 <= "10111")then -- Evalua registros locales
				n_rs1 <= to_integer(unsigned(rs1))+(to_integer(unsigned(cwp))*16);
			else
				if(rs1 >= "01000" and rs1 <= "01111")then -- Evalua registros de salida
					n_rs1 <= to_integer(unsigned(rs1)) + (to_integer(unsigned(cwp))*16);
				end if;
			end if;
		end if;
	end if;


	----Determinar registro rsd
	if(rsd>="00000" and rsd<="00111")then --Evalua registros globales
		n_rsd <= to_integer(unsigned(rsd));
	else
		if(rsd >= "11000" and rsd <= "11111")then -- Evalua registros de entrada
			n_rsd <= to_integer(unsigned(rsd)) - (to_integer(unsigned(cwp))*16);
		else
			if(rsd >= "10000" and rsd <= "10111")then -- Evalua registros locales
				n_rsd <= to_integer(unsigned(rsd))+(to_integer(unsigned(cwp))*16);
			else
				if(rsd >= "01000" and rsd <= "01111")then -- Evalua registros de salida
					n_rsd <= to_integer(unsigned(rsd)) + (to_integer(unsigned(cwp))*16);
				end if;
			end if;
		end if;
	end if;

end process;

nrs1 <= std_logic_vector(to_unsigned(n_rs1,6));
nrs2 <= std_logic_vector(to_unsigned(n_rs2,6));
nrd <= std_logic_vector(to_unsigned(n_rsd,6));

end Behavioral;
