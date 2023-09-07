library ieee;
use ieee.std_logic_1164.all;

--Entity
entity MSS is
	port(
		start, resetn, clk, x, tecla, BotonRegistro,tiempo_final, TC1, TC2, CC1, CC2, air_off, cal_on, cal_off, HC1, faldas_fro_pos, roci_off: in std_logic;
		En_D, En_U, leer_registro, En_Ram, W_R, En_T2, En_CO2, En_H, Ld3, Ld4, Ld2, En_T1, Ld1: out std_logic);
end MSS;

--Architecture
architecture solve of MSS is
	type estado is (Ta, Tb, Tc, Td, Te, Tf, Tg, Th, Ti, Tj, Tk, Tl, Tm, Tn, Tp, Tq, Tr, Ts, Tu, Tv, Tw, Tx, Ty, Tz, T0, T2, T3);
	signal y: estado;
	begin
	process(resetn,clk)
		begin
			if resetn = '0' then y<= Ta;
			elsif (clk'event and clk = '1') then
				case y is
					when Ta => if start='1' then y<=Tb;
								  else y<= Ta; end if;			
					when Tb => if start='0' then y<=Tc;
								  else y<= Tb; end if;	
					when Tc => if tecla='1' then y<=Td;
								  else y<= Tc; end if;	
					when Td => if tecla='1' then y<=Te;
								  else y<= Td; end if;	
					when Te => if x='1' then y<=Tf;
								  else y<= Te; end if;	
					when Tf => if BotonRegistro='1' then y<=Ty;
								  else y<= Tg; end if;	
					when Tg => if x='1' then y<=Th;
								  else y<= Tg; end if;	
					when Th => if tiempo_final='1' then y<=Ti;
								  else y<= Th; end if;	
					when Ti => y<=Tj;
					when Tj => if TC1='0' and TC2='1' then y<=Tn;
								  elsif TC1='0' and TC2='0' then y<=Tm;
								  else y<=Tk; end if;	  
					when Tk => if cal_off='1' then y<=Tl;
								  else y<=Tk; end if;
					when Tl => y<=Tm;
					when Tm => if HC1='0' and faldas_fro_pos='1' then y<=Ts;
								  elsif HC1='0' and faldas_fro_pos='0' then y<=Tr;
								  else y<=Tp; end if;
					when Tn => if cal_on='1' then y<=T0;
								  else y<=Tn; end if;
					when T0 => y<=Tm;		  
					when Tp => if roci_off='1' then y<=Tq;
								  else y<=Tp; end if;
					when Tq => y<=Tr;
					when Tr => if CC1='0' and CC2='1' then y<=Tw;
					           elsif CC1='0' and CC2='0' then y<=Tx;
								  else y<=Tu; end if;
					when Ts => y<=Tr;
					when Tu => if air_off='1' then y<=Tv;
					           else y<=Tu; end if;
					when Tv => y<=Tx;
					when Tw => y<=Tx;
					when Tx => y<=Tf;
					when Ty => if tecla='1' then y<=Tz;
								  else y<= T2; end if;
					when Tz => if tecla='1' then y<=T2;
								  else y<= Tl; end if;	
					when T2 => y<=T3;
					when T3 => y<=Tf;
					end case;
			end if;			
	end process;
	process(y)
		begin
			En_D<='0';
			En_U<='0';
			leer_registro<='0';
			En_Ram<='0';
			W_R<='0';
			En_T1<='0';
			En_T2<='0';
			En_CO2<='0';
			En_H<='0';
			Ld1<='0';
			Ld2<='0';
			Ld3<='0';
			Ld4<='0';
			case y is
					when Ta => 			
					when Tb => 
					when Tc => 
					when Td => En_D<='1';
					when Te => En_U<='1';
					when Tf => 
					when Tg => W_R<='1';	
					when Th => 
					when Ti => En_Ram<='1';	
					when Tj => En_Ram<='1';
					when Tk => En_T2<='1';
					when Tl => En_T2<='1'; Ld2<='1';
					when Tm => 
					when Tn => En_T1<='1';
					when T0 => En_T1<='1'; Ld1<='1';
					when Tp => En_H<='1';
					when Tq => En_H<='1'; Ld3<='1';
					when Tr => 
					when Ts => 
					when Tu => En_CO2<='1';
					when Tv => En_CO2<='1'; Ld4<='1';
					when Tw => 
					when Tx => 
					when Ty => 
					when Tz => En_D<='1';
					when T2 => En_U<='1';							  
					when T3 => leer_registro<='1';
			end case;
	end process; 
end solve;	
