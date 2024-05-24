-- Nome Projeto: Trabalho44
-- Data: 16/11/23
-- Nome: Leonardo Felipe Pacuola / 1911406
--       Esdras Fernandes da Cruz / 2097184

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.pacote.all;

entity Trabalho4 IS
  port(SW : IN std_logic_vector(3 downto 0);
    LEDR : OUT std_logic_vector(3 downto 0));
end entity;

architecture teste of Trabalho4 is
begin
	conversor(SW(3), SW(2), SW(1 downto 0), LEDR);
end teste;