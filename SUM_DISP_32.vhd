library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SUM_DISP_32 is
    port(A,B : in std_logic_vector(31 downto 0);
         SUM : out std_logic_vector(31 downto 0));
end SUM_DISP_32;

architecture arq_sum32 of SUM_DISP_32 is
begin
    SUM <= (A + B);
end arq_sum32;
