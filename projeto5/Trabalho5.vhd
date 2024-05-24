-- Project Name: Trabalho5
-- Date: 06/12/23
-- Name: Leonardo Felipe Pacuola / 1911406
--       Esdras Fernandes da Cruz / 2097184

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Trabalho5 is
    port(CLOCK_50: in std_logic;
        SW : in  std_logic_vector(0 to 0);
        LEDR : out std_logic_vector (9 downto 0);
        HEX0: out std_logic_vector (6 downto 0);
		  HEX1: out std_logic_vector (6 downto 0);
		  HEX2: out std_logic_vector (6 downto 0);
		  HEX3: out std_logic_vector (6 downto 0);
		  HEX4: out std_logic_vector (6 downto 0);
		  HEX5: out std_logic_vector (6 downto 0));
end Trabalho5;

-------------------------------------------------------------------

architecture funcao of Trabalho5 is

    type state_type is (A, B, C, D, E, F, G);
    signal state : state_type := A;
    signal countdown : integer range -2 to 9 := -1;
    signal aceso : BOOLEAN;
    signal seg: integer range 0 to 50000000 := 0;
	 signal flag : integer range 0 to 1 := 0;

--A: S1>=Verde S2=Vermelho S3 Verde Count<=9 8s
--B: S1>=Amarelo S2=Vermelho S3 Verde        2s
--C: S1>=Vermelho S2=Vermelho S3 Vermelho    1s
--D: S1>=Vermelho S2=Verde S3 Vermelho       8s
--E: S1>=Vermelho S2=Amarelo S3 Vermelho     2s
--F: S1>=Vermelho S2=Vermelho S3 Vermelho    1s
--G: S1>=Amarelo S2=Amarelo S3 Desligado  Todo mundo pisca a cada 2S;

	 
begin

    process (countdown)
    begin
        case countdown is
            when 0 => HEX0 <= "1000000";
				HEX5 <= "1111111";
            HEX4 <= "1111111";
            HEX3 <= "1111111";
            HEX2 <= "1111111";
            HEX1 <= "1111111";
            when 1 => HEX0 <= "1111001";
				HEX5 <= "1111111";
            HEX4 <= "1111111";
            HEX3 <= "1111111";
            HEX2 <= "1111111";
            HEX1 <= "1111111";
           
            when 2 => HEX0 <= "0100100";
				HEX5 <= "1111111";
            HEX4 <= "1111111";
            HEX3 <= "1111111";
            HEX2 <= "1111111";
            HEX1 <= "1111111";
           
            when 3 => HEX0 <= "0110000";
				HEX5 <= "1111111";
            HEX4 <= "1111111";
            HEX3 <= "1111111";
            HEX2 <= "1111111";
            HEX1 <= "1111111";
           
            when 4 => HEX0 <= "0011001";
				HEX5 <= "1111111";
            HEX4 <= "1111111";
            HEX3 <= "1111111";
            HEX2 <= "1111111";
            HEX1 <= "1111111";
            
            when 5 => HEX0 <= "0010010";
				HEX5 <= "1111111";
            HEX4 <= "1111111";
            HEX3 <= "1111111";
            HEX2 <= "1111111";
            HEX1 <= "1111111";
            
            when 6 => HEX0 <= "0000010";
				HEX5 <= "1111111";
            HEX4 <= "1111111";
            HEX3 <= "1111111";
            HEX2 <= "1111111";
            HEX1 <= "1111111";
          
            when 7 => HEX0 <= "1011000";
				HEX5 <= "1111111";
            HEX4 <= "1111111";
            HEX3 <= "1111111";
            HEX2 <= "1111111";
            HEX1 <= "1111111";
           
            when 8 => HEX0 <= "0000000";
				HEX5 <= "1111111";
            HEX4 <= "1111111";
            HEX3 <= "1111111";
            HEX2 <= "1111111";
            HEX1 <= "1111111";
     
            when 9 => HEX0 <= "0010000";
				HEX5 <= "1111111";
            HEX4 <= "1111111";
            HEX3 <= "1111111";
            HEX2 <= "1111111";
            HEX1 <= "1111111";
           
            when -1 =>
            HEX5 <= "0001001";
            HEX4 <= "1000000";
            HEX3 <= "0001001";
            HEX2 <= "1000000";
            HEX1 <= "0001001";
            HEX0 <= "1000000";
				
				WHEN OTHERS =>
				HEX5 <= "1111111";
            HEX4 <= "1111111";
            HEX3 <= "1111111";
            HEX2 <= "1111111";
            HEX1 <= "1111111";
				HEX0 <= "1111111";
            
        end case;
    end process;
	 

    process (state)
    begin
        case state is
            when A => 
                LEDR(2 downto 0) <="001";
                LEDR(6 downto 4) <="100";
                LEDR(9 downto 8) <="01";

            when B => 
                LEDR(2 downto 0) <="010";
                LEDR(6 downto 4) <="100";
                LEDR(9 downto 8) <="01";

            when C =>
                LEDR(2 downto 0) <="100";
                LEDR(6 downto 4) <="100";
                LEDR(9 downto 8) <="10";

            when D => 
                LEDR(2 downto 0) <="100";
                LEDR(6 downto 4) <="001";
                LEDR(9 downto 8) <="10";

            when E => 
                LEDR(2 downto 0) <="100";
                LEDR(6 downto 4) <="010";
                LEDR(9 downto 8) <="10";

            when F => 
                LEDR(2 downto 0) <="100";
                LEDR(6 downto 4) <="100";
                LEDR(9 downto 8) <="10";

            when G =>
                if aceso then
                    LEDR(2 downto 0) <="010";
                    LEDR(6 downto 4) <="010";
                    LEDR(9 downto 8) <="00";
                else
                    LEDR(2 downto 0) <="000";
                    LEDR(6 downto 4) <="000";
                    LEDR(9 downto 8) <="00"; 
                end if;

        end case;

    end process;

    process (CLOCK_50)
        variable espera : integer range 0 to 10 := 0;
        variable second : integer range 0 to 60 := 0;
    begin
        if rising_edge(CLOCK_50) then
            if SW(0) = '1' then
                state <= G;
                espera := 0;
                countdown <= -2;
            end if;

            if seg = 50000000 then

                if second >= espera then
                    second := 0;

                    case state is
                        when A =>
                            espera := 2;
                            state <= B;
									

                        when B =>  
                            espera := 1;
                            state <= C;

                        when C =>  
                            espera := 8;
                            state <= D;
									

                        when D =>  
                            espera := 2;
                            state <= E;

                        when E =>  
                            espera := 1;
                            state <= F;

                        when F =>
									 flag <= 0;
                            espera := 8;
                            countdown <= 9;
                            state <= A;

                        when G =>
                            if SW(0) = '0' then
                                espera := 8;
                                countdown <= 9;
                                state <= A;
                            else
                                aceso <= not aceso;
                                state <= G;
                            end if;
                    end case;
                end if;

                seg <= 0;

                second := second + 1;

                if countdown >= 0 then
                    countdown <= countdown - 1;
                end if;

            else
                seg <= seg+1;
            end if;

        end if;
    end process;

end funcao;
