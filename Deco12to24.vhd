library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Deco12to24 is
    Port (
        BinInput   : in STD_LOGIC_VECTOR(11 downto 0);  -- Entrada binaria de 12 bits
        BCDOutput  : out STD_LOGIC_VECTOR(23 downto 0)  -- Salida BCD de 24 bits
    );
end Deco12to24;

architecture Behavioral of Deco12to24 is
    signal TempDecena, TempUnidad, HumDecena, HumUnidad, Co2Decena, Co2Unidad, Temp, Hum, CO2 : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(BinInput)
    begin
        -- Decodificar Temperatura
        Temp <= BinInput(11 downto 8);
        Hum <= BinInput(7 downto 4);
		  CO2 <= BinInput(3 downto 0);
        
        -- Convertir Decena y Unidad a BCD
        TempDecena <= "0000";
        TempUnidad <= "0000";
		  HumDecena <= "0000";
        HumUnidad <= "0000";
		  Co2Decena <= "0000";
        Co2Unidad <= "0000"; 
        case Temp is
            when "0000" =>
                TempDecena <= "0000";
            when "0001" =>
                TempDecena <= "0000";
			   when "0010" =>
                TempDecena <= "0000";
            when "0011" =>
                TempDecena <= "0000";
			   when "0100" =>
                TempDecena <= "0000";
            when "0101" =>
                TempDecena <= "0000";
            when "0110" =>
                TempDecena <= "0000";
            when "0111" =>
                TempDecena <= "0000";
				when "1000" =>
                TempDecena <= "0000";
            when "1001" =>
                TempDecena <= "0000";
				when "1010" =>
                TempDecena <= "0001";
            when "1011" =>
                TempDecena <= "0001";
				when "1100" =>
                TempDecena <= "0001";
            when "1101" =>
                TempDecena <= "0001";
				when "1110" =>
                TempDecena <= "0001";
            when "1111" =>
                TempDecena <= "0001";

        end case;
        
        case Temp is
            when "0000" =>
                TempUnidad <= "0000";
            when "0001" =>
                TempUnidad <= "0001";
			   when "0010" =>
                TempUnidad <= "0010";
            when "0011" =>
                TempUnidad <= "0011";
			   when "0100" =>
                TempUnidad <= "0100";
            when "0101" =>
                TempUnidad <= "0101";
            when "0110" =>
                TempUnidad <= "0111";
            when "0111" =>
                TempUnidad <= "1000";
				when "1000" =>
                TempUnidad <= "1001";
            when "1001" =>
                TempUnidad <= "1001";
				when "1010" =>
                TempUnidad <= "0000";
            when "1011" =>
                TempUnidad <= "0001";
				when "1100" =>
                TempUnidad <= "0010";
            when "1101" =>
                TempUnidad <= "0011";
				when "1110" =>
                TempUnidad <= "0100";
            when "1111" =>
                TempUnidad <= "0101";
				
        end case;
		  
		  case Hum is
            when "0000" =>
                HumDecena <= "0000";
            when "0001" =>
                HumDecena <= "0000";
			   when "0010" =>
                HumDecena <= "0000";
            when "0011" =>
                HumDecena <= "0000";
			   when "0100" =>
                HumDecena <= "0000";
            when "0101" =>
                HumDecena <= "0000";
            when "0110" =>
                HumDecena <= "0000";
            when "0111" =>
                HumDecena <= "0000";
				when "1000" =>
                HumDecena <= "0000";
            when "1001" =>
                HumDecena <= "0001";
				when "1010" =>
                HumDecena <= "0001";
            when "1011" =>
                HumDecena <= "0001";
				when "1100" =>
                HumDecena <= "0001";
            when "1101" =>
                HumDecena <= "0001";
				when "1110" =>
                HumDecena <= "0001";
            when "1111" =>
                HumDecena <= "0001";

        end case;
        
        case Hum is
            when "0000" =>
                HumUnidad <= "0000";
            when "0001" =>
                HumUnidad <= "0001";
			   when "0010" =>
                HumUnidad <= "0010";
            when "0011" =>
                HumUnidad <= "0011";
			   when "0100" =>
                HumUnidad <= "0100";
            when "0101" =>
                HumUnidad <= "0101";
            when "0110" =>
                HumUnidad <= "0111";
            when "0111" =>
                HumUnidad <= "1000";
				when "1000" =>
                HumUnidad <= "1001";
            when "1001" =>
                HumUnidad <= "1001";
				when "1010" =>
                HumUnidad <= "0000";
            when "1011" =>
                HumUnidad <= "0001";
				when "1100" =>
                HumUnidad <= "0010";
            when "1101" =>
                HumUnidad <= "0011";
				when "1110" =>
                HumUnidad <= "0100";
            when "1111" =>
                HumUnidad <= "0101";
				
        end case;
		  
		  case CO2 is
            when "0000" =>
                Co2Decena <= "0000";
            when "0001" =>
                Co2Decena <= "0000";
			   when "0010" =>
                Co2Decena <= "0000";
            when "0011" =>
                Co2Decena <= "0000";
			   when "0100" =>
                Co2Decena <= "0000";
            when "0101" =>
                Co2Decena <= "0000";
            when "0110" =>
                Co2Decena <= "0000";
            when "0111" =>
                Co2Decena <= "0000";
				when "1000" =>
                Co2Decena <= "0000";
            when "1001" =>
                Co2Decena <= "0001";
				when "1010" =>
                Co2Decena <= "0001";
            when "1011" =>
                Co2Decena <= "0001";
				when "1100" =>
                Co2Decena <= "0001";
            when "1101" =>
                Co2Decena <= "0001";
				when "1110" =>
                Co2Decena <= "0001";
            when "1111" =>
                Co2Decena <= "0001";

        end case;
        
        case CO2 is
            when "0000" =>
                Co2Unidad <= "0000";
            when "0001" =>
                Co2Unidad <= "0001";
			   when "0010" =>
                Co2Unidad <= "0010";
            when "0011" =>
                Co2Unidad <= "0011";
			   when "0100" =>
                Co2Unidad <= "0100";
            when "0101" =>
                Co2Unidad <= "0101";
            when "0110" =>
                Co2Unidad <= "0111";
            when "0111" =>
                Co2Unidad <= "1000";
				when "1000" =>
                Co2Unidad <= "1001";
            when "1001" =>
                Co2Unidad <= "1001";
				when "1010" =>
                Co2Unidad <= "0000";
            when "1011" =>
                Co2Unidad <= "0001";
				when "1100" =>
                Co2Unidad <= "0010";
            when "1101" =>
                Co2Unidad <= "0011";
				when "1110" =>
                Co2Unidad <= "0100";
            when "1111" =>
                Co2Unidad <= "0101";
				
        end case;

        -- Construir la salida BCD de 24 bits
        BCDOutput <= TempDecena & TempUnidad & HumDecena & HumUnidad & Co2Decena & Co2Unidad;
    end process;
end Behavioral;