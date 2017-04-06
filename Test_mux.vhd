
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Test_mux IS
END Test_mux;
 
ARCHITECTURE behavior OF Test_mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux
    PORT(
         input_1 : IN  std_logic_vector(31 downto 0);
         input_2 : IN  std_logic_vector(31 downto 0);
         s : IN  std_logic;
         mux_out : INOUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal input_2 : std_logic_vector(31 downto 0) := (others => '0');
   signal s : std_logic := '0';

	--BiDirs
   signal mux_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux PORT MAP (
          input_1 => input_1,
          input_2 => input_2,
          s => s,
          mux_out => mux_out
        );



   -- Stimulus process
   stim_proc: process
   begin		
      
		s<='1';
		input_1<="00110100000100010001000000000011";
		input_2<="10000010100010010001000101000110";
      wait for 100 ns;	
		
		s<='0';
		input_1<="00110100000100010001000000000011";
		input_2<="10000010100010010001000101000110";
		wait for 100 ns;
		
      wait;
   end process;

END;
