LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY RF_tb IS
END RF_tb;
 
ARCHITECTURE behavior OF RF_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         rst : IN  std_logic;
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         dwr : IN  std_logic_vector(31 downto 0);
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          rst => rst,
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          dwr => dwr,
          crs1 => crs1,
          crs2 => crs2
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <='0';
		rs1 <="00000";
		rs2 <="00001";
		rd  <="00010";
		dwr <=x"00000005";
      wait for 100 ns;	
		
		rst <='0';
		rs1 <="00010";
		rs2 <="00001";
		rd  <="00011";
		dwr <=x"00000015";
      wait for 100 ns;	
		
		rst <='0';
		rs1 <="00011";
		rs2 <="00010";
		rd  <="00100";
		dwr <=x"00000AAA";
      wait for 100 ns;
		
		rst <='1';
		rs1 <="00100";
		rs2 <="00011";
		rd  <="00101";
		dwr <=x"00000005";
      wait for 100 ns;	




      

      -- insert stimulus here 

      wait;
   end process;

END;
