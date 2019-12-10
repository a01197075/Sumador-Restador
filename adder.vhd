-- Code your design here
library IEEE;
use IEEE.numeric_bit.all;

entity adder is
	port(A, B, Ci: in bit; Co, S: out bit);
end adder;

architecture behavioral of adder is 
begin 
	S <= (A xor B) xor Ci;
	Co <= (A and B) or ((A xor B) and Ci);
end behavioral;

library IEEE;
use IEEE.numeric_bit.all;

entity sum_rest is 
	port(X, Y: in unsigned (7 downto 0); Z:out unsigned (7 downto 0); Cin: in bit; Ovf: out bit; Cout: OUT bit);
end sum_rest;

architecture arch of sum_rest is
component adder
	port(A, B, Ci: in bit; Co, S: out bit);
end component;
signal R0, R1, R2, R3, R4, R5, R6, R7, C1, C2, C3, C4, C5, C6, C7: bit;
begin
	R0 <= Y(0) xor Cin;
	R1 <= Y(1) xor Cin;
	R2 <= Y(2) xor Cin;
	R3 <= Y(3) xor Cin;
	R4 <= Y(4) xor Cin;
	R5 <= Y(5) xor Cin;
	R6 <= Y(6) xor Cin;
	R7 <= Y(7) xor Cin;
	F0: adder port map(X(0), R0, Cin, C1, Z(0));
	F1: adder port map(X(1), R1, C1, C2, Z(1));
	F2: adder port map(X(2), R2, C2, C3, Z(2));
	F3: adder port map(X(3), R3, C3, C4, Z(3));
	F4: adder port map(X(4), R4, C4, C5, Z(4));
	F5: adder port map(X(5), R5, C5, C6, Z(5));
	F6: adder port map(X(6), R6, C6, C7, Z(6));
	F7: adder port map(X(7), R7, C7, Cout, Z(7));
   
end arch;


	
