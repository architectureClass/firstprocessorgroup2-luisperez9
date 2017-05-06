
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_p4 IS
END Test_p4;
 
ARCHITECTURE behavior OF Test_p4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processor4
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         sout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal sout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processor4 PORT MAP (
          clk => clk,
          rst => rst,
          sout => sout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst<='1';
      wait for 100 ns;	
		rst<='0';

      wait;
   end process;

END;
