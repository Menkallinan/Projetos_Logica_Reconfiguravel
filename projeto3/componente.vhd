LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY componente IS
PORT (num : IN INTEGER RANGE 0 TO 8;
		saida : OUT STD_LOGIC_VECTOR(0 TO 6) );
END componente;

ARCHITECTURE funcao OF componente IS
BEGIN
	saida <= "0000001" WHEN NUM = 0 ELSE
				"1001111" WHEN NUM = 1 ELSE
				"0010010" WHEN NUM = 2 ELSE
				"0000110" WHEN NUM = 3 ELSE
				"1001100" WHEN NUM = 4 ELSE
				"0100100" WHEN NUM = 5 ELSE
				"0100000" WHEN NUM = 6 ELSE
				"0001111" WHEN NUM = 7 ELSE
				"0000000" WHEN NUM = 8;
END funcao;