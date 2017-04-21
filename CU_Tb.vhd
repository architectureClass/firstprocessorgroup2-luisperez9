LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY CU_Tb IS
END CU_Tb;
 
ARCHITECTURE behavior OF CU_Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU
    PORT(
         op3 : IN  std_logic_vector(5 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         AluOp : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal AluOp : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          op3 => op3,
          op => op,
          AluOp => AluOp
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		op <= "10";
		op3 <= "000000";
      wait for 100 ns;	
		
		op <= "10";
		op3 <= "000001";
      wait for 100 ns;	
		
		op <= "10";
		op3 <= "000010";
      wait for 100 ns;	
		
		op <= "10";
		op3 <= "000011";
      wait for 100 ns;	
		
		op <= "10";
		op3 <= "000110";
      wait for 100 ns;	
		
		op <= "10";
		op3 <= "000100";
      wait for 100 ns;	
		
		op <= "10";
		op3 <= "000101";
      wait for 100 ns;
		
		op <= "11";
		op3 <= "000000";
      wait for 100 ns;
		
		op <= "01";
		op3 <= "000000";
      wait for 100 ns;
		
		op <= "00";
		op3 <= "000000";
      wait for 100 ns;



      -- insert stimulus here 

      wait;
   end process;

END;
