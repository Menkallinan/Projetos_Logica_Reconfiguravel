LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE pacote IS
FUNCTION funcao(SEL: STD_LOGIC; 
	AX : STD_LOGIC_VECTOR(1 downto 0))  
RETURN STD_LOGIC_VECTOR;
	
	
PROCEDURE conversor(SIGNAL EN, SEL: IN STD_LOGIC;
	SIGNAL AX : IN STD_LOGIC_VECTOR(1 downto 0);
	SIGNAL SAIDA : OUT STD_LOGIC_VECTOR(3 downto 0));
END pacote;

PACKAGE BODY pacote IS 
FUNCTION funcao(SEL: STD_LOGIC; 
AX : STD_LOGIC_VECTOR(1 downto 0))  
RETURN STD_LOGIC_VECTOR IS 
VARIABLE var : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
IF(SEL = '0') THEN
	case AX(1 downto 0) is 
		when "00" => var := "0001";  
      when "01" => var := "0010";  
      when "10" => var := "1000";
		when "11" => var := "0100";
   end case;
ELSE
   case AX(1 downto 0) is 
        when "00" => var := "1000";  
        when "01" => var := "0100";   
        when "10" => var := "0001";
		  when "11" => var := "0010"; 
	end case;
END IF; 
RETURN var;
END funcao;
	
	
PROCEDURE conversor(SIGNAL EN, SEL: IN STD_LOGIC;
	SIGNAL AX : IN STD_LOGIC_VECTOR(1 downto 0);
	SIGNAL SAIDA : OUT STD_LOGIC_VECTOR(3 downto 0)) IS

BEGIN
	IF(EN = '1') THEN
		SAIDA <= funcao(SEL, AX);
			
	ELSE 
		SAIDA <="ZZZZ";
	END IF;		
END conversor;
END pacote;