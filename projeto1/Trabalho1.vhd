LIBRARY ieee;
USE ieee.std_logic_1164.all;

--Leonardo Felipe Pacuola
--Esdras Fernandes da Cruz

ENTITY Trabalho1 is
	PORT (SW: IN std_logic_vector (5 downto 0);
			HEX0: OUT std_logic_vector (6 downto 0);
			Y: OUT std_logic_vector (9 downto 0));
END Trabalho1;

ARCHITECTURE logica OF Trabalho1 IS
SIGNAL X: std_logic_vector (6 downto 0);
SIGNAL YO: std_logic_vector (9 downto 0);
begin
			with SW(4 downto 0) select --Switches para LED de 7 segmentos
			X <= "0000001" WHEN "00000",
			"1001111" WHEN "00001",
			"0010010" WHEN "00010",
			"0000110" WHEN "00011",
			"1001100" WHEN "00100",
			"0100100" WHEN "00101",
			"0100000" WHEN "00110",
			"0001111" WHEN "00111",
			"0000000" WHEN "01000",
			"0000100" WHEN "01001",
			"0000001" WHEN "10000",
			"1001111" WHEN "10001", -- 1
			"0010010" WHEN "10010",
			"0000110" WHEN "10011",
			"1001100" WHEN "10100",
			"0100100" WHEN "10101",
			"0100000" WHEN "10110",
			"0001111" WHEN "10111",
			"0000000" WHEN "11000",
			"0000100" WHEN "11001",
			"0110000" WHEN others;
			
			with SW(4 downto 0) select --Switches para LEDR's
			YO <= "0000000000" WHEN "10000",
			"0000000001" WHEN "10001",
			"0000000011" WHEN "10010",
			"0000000010" WHEN "10011",
			"0000000110" WHEN "10100",
			"0000000111" WHEN "10101",
			"0000000101" WHEN "10110",
			"0000000100" WHEN "10111",
			"0000001100" WHEN "11000",
			"0000001101" WHEN "11001",
			"0000000001" WHEN "00001", --1
			"0000000010" WHEN "00010",
			"0000000011" WHEN "00011",
			"0000000100" WHEN "00100",
			"0000000101" WHEN "00101",
			"0000000110" WHEN "00110",
			"0000000111" WHEN "00111",
			"0000001000" WHEN "01000",
			"0000001001" WHEN "01001",
			"0000000000" WHEN others;
			
			HEX0 <= X when SW(5) = '1' else
			"1111111";
			Y <= YO when SW(5) = '1' else "0000000000";
			
end logica;