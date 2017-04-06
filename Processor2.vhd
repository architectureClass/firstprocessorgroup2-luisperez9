library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processor2 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ein : in  STD_LOGIC_vector(31 downto 0);
			  sout: out std_logic_vector(31 downto 0));
end Processor2;

architecture Behavioral of Processor2 is

component SEU is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux is
    Port ( input_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           input_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           s : in  STD_LOGIC;
           mux_out : inout  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ALU is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           dwr : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Adder is
    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component CU is
    Port ( op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0));
end component;

component PC is
    Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
		
end component;

component Register_File is
    Port ( rst : in std_logic;
			  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component IM is
    Port ( reset : in  STD_LOGIC;
           IM_in : in  STD_LOGIC_VECTOR (31 downto 0);
           IM_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


Signal AtNP : std_logic_vector (31 downto 0);
Signal NPtP : std_logic_vector (31 downto 0);
Signal PtIM : std_logic_vector (31 downto 0);
Signal Inst : std_logic_vector (31 downto 0);
Signal Ope : std_logic_vector (5 downto 0);
Signal AtR : std_logic_vector (31 downto 0);
Signal M1 : std_logic_vector (31 downto 0);
Signal M2 : std_logic_vector (31 downto 0);
Signal MtA : std_logic_vector (31 downto 0);
Signal FtM : std_logic_vector (31 downto 0);

begin

	Adder1 : Adder
	port map(op1 => ein,
				op2 => NPtP,
				result => AtNP);

	NPC : PC
	port map(Data => AtNP,
				rst => rst,
				clk => clk,
				DataOut => NPtP);
				
	PC1 : PC
	port map(Data => NPtP,
				rst => rst,
				clk => clk,
				DataOut => PtIM);

	IM1 : IM
	port map(reset => rst,
				IM_in => PtIM,
				IM_out => Inst);
				
	CU1 : CU
	port map(op3 => Inst(24 downto 19),
				op => Inst(31 downto 30),
				AluOp => Ope);
				
	RF1 : Register_File
	port map(rst => rst,
				rs1 => Inst(18 downto 14),
				rs2 => Inst(4 downto 0),
				rd  => Inst(29 downto 25),
				dwr => AtR,
				crs1 => FtM,
				crs2 => M1);
				
	SEU1 : SEU
	port map(imm13 => Inst(12 downto 0),
				crs2 => M2);
				
	MUX1 : Mux
	port map(input_1 => M1,
				input_2 => M2,
				s => Inst(13),
				mux_out => MtA);
				
	ALU1 : ALU
	port map(crs1 => FtM,
				crs2 => MtA,
				aluop => Ope,
				dwr => AtR);
				
	Sout <= AtR;
	
end Behavioral;

