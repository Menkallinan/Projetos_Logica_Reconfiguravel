-- Nome Projeto: Trabalho3
-- Data: 05/10/2023
-- Nome: Leonardo Felipe Pacuola/1911406
--			Esdras Fernandes da Cruz/2097184
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY trabalho_logic IS
	PORT (
		SW: IN STD_LOGIC_VECTOR(7 downto 0);
		HEX0, HEX1, HEX2: OUT STD_LOGIC_VECTOR(0 TO 6)
	);
END trabalho_logic;

ARCHITECTURE logica OF trabalho_logic IS
	COMPONENT componente IS
		PORT (
			num: IN INTEGER RANGE 0 TO 8;
			saida: OUT STD_LOGIC_VECTOR(0 TO 6)
		);
	END COMPONENT;

	SIGNAL LSB, MSB, um: INTEGER RANGE 0 TO 8;
BEGIN
	PROCESS (SW)
		VARIABLE contador_menos, contador_um, contador_maior: INTEGER RANGE 0 TO 8 := 0;
	BEGIN
	
		contador_menos:=0;contador_um:=0;contador_maior:=0;
	
		for i in 0 to 7 loop
		IF SW(i) = '0' THEN
				EXIT;
			ELSE
				contador_maior := contador_maior + 1;
			END IF;
			end loop;
	
		for i in 7 downto 0 loop
			IF SW(i) = '1' THEN
				EXIT;
			ELSE
				contador_menos := contador_menos + 1;
			END IF;
		END LOOP;
		
		for i in 0 to 7 loop
			IF SW(i) = '1' THEN
				contador_um := contador_um + 1;
			END IF;
		END LOOP;
		
		MSB <= contador_maior;
		LSB <= contador_menos;
		um <= contador_um;
	END PROCESS;

	U1: componente PORT MAP(LSB, HEX0);
	U2: componente PORT MAP(MSB, HEX1);
	U3: componente PORT MAP(um, HEX2);
	
END logica;
