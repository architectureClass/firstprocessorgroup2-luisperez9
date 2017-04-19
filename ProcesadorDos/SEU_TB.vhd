LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SEU_TB IS
END SEU_TB;
 
ARCHITECTURE behavior OF SEU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         imm13 : IN  std_logic_vector(12 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          imm13 => imm13,
          crs2 => crs2
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		imm13 <= "0000000000001";
      wait for 100 ns;	
		
		imm13 <= "1111111111111";
      wait for 100 ns;	
		
		imm13 <= "0000000000011";
      wait for 100 ns;	
		
		imm13 <= "1111111111101";
      wait for 100 ns;	
		
		imm13 <= "0000000000111";
      wait for 100 ns;	
		
		imm13 <= "1111111111001";
      wait for 100 ns;	

      

      -- insert stimulus here 

      wait;
   end process;

END;
