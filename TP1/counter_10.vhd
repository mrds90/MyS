--------------------------------------------------------------------
-- Nombre del componente: counter_10
-- 
-- Descripcion: Contador BCD de un digito
--
-- Autor: Microarquitecturas y Softcores (CESE)
-- Fecha: 10/03/2020
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Inclusion de librerias y paquetes
--------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--------------------------------------------------------------------
-- Declaracion de la entidad
-------------------------------------------------------------------- 
entity counter_10 is
  port(
    clk: in std_logic;
    rst: in std_logic;    -- resetea la cuenta
    ena: in std_logic;    -- habilita la cuenta
    sal: out std_logic_vector(3 downto 0);
    cout: out std_logic   -- indica que se ha llegado al final de la cuenta
  );
end entity;

--------------------------------------------------------------------
-- Arquitectura
--------------------------------------------------------------------
architecture beh of counter_10 is
begin
	process(clk, rst)
		variable cuenta: unsigned(3 downto 0);
	begin
		if rst = '1' then
			cuenta := (others => '0');
			cout <= '0';
		elsif rising_edge(clk) then
			if ena = '1' then
				cuenta := cuenta + 1;
				if cuenta =  then			-- Completar el codigo faltante
					cuenta := ;				-- en estas lineas
					cout <= ;				--
				elsif cuenta =  then		--
					cout <= ;				--
				else
					cout <= '0';
				end if;
			end if;
		end if;
		sal <= std_logic_vector(cuenta);
	end process;

end;