library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contring00 is port(
	clkcr: in std_logic;
	encr: in std_logic;
	outcr: out std_logic_vector(3 downto 0));
end contring00;

architecture contring0 of contring00 is
signal sring: std_logic_vector(3 downto 0);
begin
	pring: process(clkcr)
	begin
		if(clkcr'event and clkcr='1') then
		case encr is
		--rotación de izquierda a derecha
			when '0' =>
				sring <= "1000";
				outcr <= "0000";
			when '1' =>
				sring(0) <= sring(3);
				sring(3 downto 1) <= sring(2 downto 0);
				outcr <= sring;
			when others => null;
		end case;
		end if;
	end process pring;
end contring0;