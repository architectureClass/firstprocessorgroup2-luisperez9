--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:14:50 03/22/2017
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/Arq/PC/PC_Tb.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PC_Tb IS
END PC_Tb;
 
ARCHITECTURE behavior OF PC_Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         Data : IN  std_logic_vector (31 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Data : std_logic_vector := x"00000000";
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal DataOut : std_logic_vector;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          Data => Data,
          rst => rst,
          clk => clk,
          DataOut => DataOut
        );

	--process
   begin		
      -- hold reset state for 100 ns.
      	rst <= '0';
		Data <= "01010101010101010100110101001101";
      wait for 100 ns;	
		rst <= '1';
		Data <= "01010101010101010100110101001101";
      wait for 100 ns;	
		rst <= '0';
		Data <= "01010101010101010100110101001001";
      wait for 100 ns;		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
