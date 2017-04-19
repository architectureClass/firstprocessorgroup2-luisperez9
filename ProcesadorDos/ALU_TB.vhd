
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         crs1 : IN  std_logic_vector(31 downto 0);
         crs2 : IN  std_logic_vector(31 downto 0);
         aluop : IN  std_logic_vector(5 downto 0);
         dwr : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal aluop : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal dwr : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          crs1 => crs1,
          crs2 => crs2,
          aluop => aluop,
          dwr => dwr
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		aluop <="000000";
		crs1  <= "00000000000000010001000001000001";
		crs2  <="00000000000000010001000100000001";
      wait for 100 ns;	
		
		aluop <="000001";
		crs1  <="00000000000000010001000001000001";
		crs2  <="00000000000000010001000100000001";
      wait for 100 ns;	
		
		aluop <="000010";
		crs1  <="00000000000000010001000001000001";
		crs2  <="00000000000000010001000100000001";
      wait for 100 ns;	
		
		aluop <="000011";
		crs1  <="00000000000000010001000001000001";
		crs2  <="00000000000000010001000100000001";
      wait for 100 ns;	
		
		aluop <="000100";
		crs1  <="00000000000000010001000001000001";
		crs2  <="00000000000000010001000100000001";
      wait for 100 ns;	
		
		aluop <="000101";
		crs1  <="00000000000000010001000001000001";
		crs2  <="00000000000000010001000100000001";
      wait for 100 ns;	
		
		aluop <="000110";
		crs1  <="00000000000000010001000001000001";
		crs2  <="00000000000000010001000100000001";
      wait for 100 ns;	
		
		aluop <="000111";
		crs1  <="00000000000000010001000001000001";
		crs2  <="00000000000000010001000100000001";
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
