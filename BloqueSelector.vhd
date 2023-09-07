library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BloqueSelector is
    Port (
        Decena        : in STD_LOGIC_VECTOR(3 downto 0);
        Unidad        : in STD_LOGIC_VECTOR(3 downto 0);
        Switch        : in STD_LOGIC_VECTOR(2 downto 0);
        BotonAuto     : in STD_LOGIC;
        BotonRegistro : in STD_LOGIC;
        Registro      : in STD_LOGIC_VECTOR(23 downto 0);
        D_T           : out STD_LOGIC_VECTOR(3 downto 0);
        U_T           : out STD_LOGIC_VECTOR(3 downto 0);
        D_H           : out STD_LOGIC_VECTOR(3 downto 0);
        U_H           : out STD_LOGIC_VECTOR(3 downto 0);
        D_CO2         : out STD_LOGIC_VECTOR(3 downto 0);
        U_CO2         : out STD_LOGIC_VECTOR(3 downto 0)
    );
end BloqueSelector;

architecture Behavioral of BloqueSelector is
begin
    process(Decena, Unidad, Switch, BotonAuto, BotonRegistro, Registro)
    begin
        if BotonAuto = '1' and BotonRegistro = '0' then
            case Switch is
                when "100" =>
                    D_T <= "0010";
                    U_T <= "0101";
                when "010" =>
                    D_H <= "0010";
                    U_H <= "0101";
                when "001" =>
                    D_CO2 <= "0010";
                    U_CO2 <= "0101";
                when others =>
                    D_T <= (others => '0');
                    U_T <= (others => '0');
                    D_H <= (others => '0');
                    U_H <= (others => '0');
                    D_CO2 <= (others => '0');
                    U_CO2 <= (others => '0');
            end case;
        elsif BotonAuto = '0' and BotonRegistro = '1' then
            D_T <= Registro(23 downto 20);
            U_T <= Registro(19 downto 16);
            D_H <= Registro(15 downto 12);
            U_H <= Registro(11 downto 8);
            D_CO2 <= Registro(7 downto 4);
            U_CO2 <= Registro(3 downto 0);
        else
            case Switch is
                when "100" =>
                    D_T <= Decena;
                    U_T <= Unidad;
                when "010" =>
                    D_H <= Decena;
                    U_H <= Unidad;
                when "001" =>
                    D_CO2 <= Decena;
                    U_CO2 <= Unidad;
                when others =>
                    D_T <= (others => '0');
                    U_T <= (others => '0');
                    D_H <= (others => '0');
                    U_H <= (others => '0');
                    D_CO2 <= (others => '0');
                    U_CO2 <= (others => '0');
            end case;
        end if;
    end process;
end Behavioral;
