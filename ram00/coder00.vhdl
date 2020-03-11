library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity coder00 is port(
	clkcd: in std_logic;
	encd, rwcd: in std_logic;
	inkeycd: in std_logic_vector(3 downto 0);
	incontcd: in std_logic_vector(3 downto 0);
	outcd: out std_logic_vector(6 downto 0);
	outcontwcd: inout std_logic_vector(4 downto 0);
	outflagcd: out std_logic);
end coder00;

architecture coder0 of coder00 is
signal scontrolcd: std_logic_vector(1 downto 0);

begin
scontrolcd <= (encd)&(rwcd);
	pcoder: process(clkcd)
	variable aux: bit:='0';
	begin
		if(clkcd'event and clkcd='1') then
			case scontrolcd is
				when "00" => --inicialización
					outcd <= "1111111";
					outcontwcd <= "00000";
					outflagcd <= '0';
				when "01" => --escritura
--////////////////////////////////////////////////////////////////////////////////
					case incontcd is
						when "1000" =>
		----------------------------------------------------------------------------------				
							case inkeycd is	
								when "0000" =>
									aux :='0';
								when "0001" =>
								--al presionar uno no se debe tomar en cuenta otro botón
								if(aux = '0') then
									aux := '1';
									outcd <= "0110000"; --1
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when "0010" =>
								if(aux = '0') then
									aux := '1';
									outcd <= "1101101"; --2
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when "0100" =>
								if(aux = '0') then
									aux := '1';
									outcd <= "1111001"; --3
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when "1000" =>
								if(aux = '0') then
									aux := '1';
									outcd <= "1110111"; --A
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when others => null;
							end case;
		-------------------------------------------------------------------------------					
						when "0100" =>
							case inkeycd is	
								when "0000" =>
									aux :='0';
								when "0001" =>
								--al presionar uno no se debe tomar en cuenta otro botón
								if(aux = '0') then
									aux := '1';
									outcd <= "0110011"; --4
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when "0010" =>
								if(aux = '0') then
									aux := '1';
									outcd <= "1011011"; --5
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when "0100" =>
								if(aux = '0') then
									aux := '1';
									outcd <= "1011111"; --6
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when "1000" =>
								if(aux = '0') then
									aux := '1';
									outcd <= "0011111"; --b
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when others => null;
							end case;
		----------------------------------------------------------------------------------					
						when "0010" =>
							case inkeycd is	
								when "0000" =>
									aux :='0';
								when "0001" =>
								--al presionar uno no se debe tomar en cuenta otro botón
								if(aux = '0') then
									aux := '1';
									outcd <= "1110000"; --7
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when "0010" =>
								if(aux = '0') then
									aux := '1';
									outcd <= "1111111"; --8
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when "0100" =>
								if(aux = '0') then
									aux := '1';
									outcd <= "1110011"; --9
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when "1000" =>
								if(aux = '0') then
									aux := '1';
									outcd <= "1001110"; --C
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when others => null;
							end case;
		----------------------------------------------------------------------------------				
						when "0001" =>
							case inkeycd is	
								when "0000" =>
									aux :='0';
								when "0001" =>
								--al presionar uno no se debe tomar en cuenta otro botón
								if(aux = '0') then
									aux := '1';
									outcd <= "1111110"; --0
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when "0010" =>
								if(aux = '0') then
									aux := '1';
									outcd <= "1100011"; --*
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when "0100" =>
								if(aux = '0') then
									aux := '1';
									outcd <= "0011101"; --+
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when "1000" =>
								if(aux = '0') then
									aux := '1';
									outcd <= "0000001"; -- -
									outcontwcd <= outcontwcd + '1';
									outflagcd <= '1';
								else
									outflagcd <= '0';
								end if;
								when others => null;
							end case;
		----------------------------------------------------------------------------------				
						when others => null;
					end case;				
--////////////////////////////////////////////////////////////////////////////////					
				when others => null;
			end case;
		end if;
	end process pcoder;
end coder0;