--Nome Projeto: Trabalho 2
--Data: 21/09/2023
--Nome: Leonardo Felipe Pacuola/1911406

LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY Trabalho2 IS
	GENERIC(N: integer:= 8);
	PORT(SW: IN std_logic_vector(N+1 downto 0);
		  KEY: IN std_logic_vector (0 downto 0);
		  LEDR: OUT std_logic_vector(N-1 downto 0)
	    );
END Trabalho2;

ARCHITECTURE exec OF Trabalho2 IS
SIGNAL Xtemp: std_logic_vector(N-1 downto 0);
begin

G: FOR i in N-1 downto 0 GENERATE

PROCESS(KEY, SW)
begin

if(SW(8)='1') then
LEDR(i) <= '0';
elsif(KEY(0)'event AND KEY(0) = '1' AND SW(9) = '1') then
Xtemp(i) <= SW(i);
LEDR(i) <= Xtemp(i);
end if;

end PROCESS;

end GENERATE G;

end exec;