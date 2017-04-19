library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity Register_File is
    Port ( rst : in std_logic;
			  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Behavioral of Register_File is

type array32 is array (0 to 31) of std_logic_vector(31 downto 0);

signal registers : array32 := (others => x"00000000");


begin

	process(rs1,rs2,rd,dwr)
	begin
		if(rst = '1') then
			crs1 <=(others => '0');
			crs2 <=(others => '0');
			registers <=(others =>x"00000000");
		else
			registers(0)<=x"00000000"; 
			crs1 <= registers(to_integer(unsigned(rs1)));
			crs2 <= registers(to_integer(unsigned(rs2)));
			if(rd /= "00000") then
				registers(to_integer(unsigned(rd))) <= dwr;
			end if;
		end if;
	end process;
		

end Behavioral;

