<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="padel.data.Equipo" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="estilos/futbolcap.css" rel="stylesheet" type="text/css" />
<title>I Campeonato de Padel Capgemini Asturias</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<table class="tablaGeneral">
	<tr>
		<td colspan="2">
			<img src="imagenes/banner.jpg" width="100%"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">			
			<jsp:include page="menu.jsp"></jsp:include>
		</td>
	</tr>
	
<tr>
		<td class="columnaIzquierda" valign="top">
			<div id="listaNoticias">
				<h3 class="clasificacion">Reglas del Campeonato</h3>  
				<table>
					<tr>
						<td width="100%" class="datosNoticia" valign="top" align="justify">
							<span class="tituloCabeceraComentario"><b>Inicio del juego</b><br/></span>		
							<br/>- Los jugadores estar�n cada uno en una parte opuesta de la red
							<br/>- El jugador que lance la pelota por primera vez es el que saca, y el que contesta es el que resta.							
							<br/>- La elecci�n del lado, y el derecho a ser el que saque o el que reste en el primer juego, se decidir� por suerte (cara o cruz). El que resulte ganador podr� elegir entre sacar o escoger campo.
							<br/>- El campeonato se jugar� por parejas.
						</td>	
					</tr>
					<tr>
						<td width="100%" class="datosNoticia" valign="top" align="justify">
							<span class="tituloCabeceraComentario"><br/><b>El servicio</b><br/></span>		
							<br/>- El que lo ejecute estar� con ambos pies detr�s de la l�nea de saque y entre la raya central de esta y la pared lateral, y lanzar� la pelota por encima de la red directamente hacia el cuadro situado en el otro campo, en l�nea diagonal, y en primer lugar al que est� situado a su izquierda
							<br/>- El jugador botar� la pelota detr�s de la l�nea de saque. En el momento de golpear la pelota con su paleta, se considerar� el saque efectuado.</br>
							<br/>- Durante toda la ejecuci�n del servicio, el jugador que efect�e el saque queda obligado a:
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Sacar detr�s de la l�nea de saque y entre la raya central de �sta y la pared lateral	
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. Botar la pelota en la misma zona.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. No tocar con los pies la l�nea de saque ni pasarse al lado contrario, pues el saque es cruzado.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. En el momento del saque, el jugador deber� golpear la pelota por debajo de su cintura y tener, al menos, un pie en contacto con el suelo.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.	El jugador no podr� cambiar de posici�n andando o corriendo.
							<br/>- Si un servicio es ejecutado inadvertidamente desde la mitad no correspondiente, todos los tantos marcados en tal situaci�n son correctos, pero el error de posici�n deber� ser corregido tan pronto sea descubierto.
							<br/>- El que resta deber� esperar a que la pelota bote dentro del cuadro, y deber� golpearla antes de que bote por segunda vez.
							<br/>- La pelota podr� botar dos veces seguidas dentro del campo, o hacerlo despu�s de haber dado en una de las paredes; en ambos casos el saque se considera bueno. Se except�a si da en la "esquina" o "canto".
							<br/>- Si la pelota lanzada por el que saca, pasara la red, botara en el campo contrario, y diera en cualquiera de las redes met�licas que delimitan el campo, ser�a considerada como falta.
							<br/>- El que saca, tendr� derecho a un segundo servicio si hubiera cometido falta en el primero.
							<br/>- Todo servicio que sea bueno, pero que haya tocado la red, se considerar� como "net" y deber� repetirse.
							<br/>- Si el "net" se produjera en el segundo servicio, el que saca tendr� derecho s�lo a un saque m�s.
							<br/>- Se considera "net" el servicio que da en la red y bota dos veces en el campo antes de tocar la tela met�lica.
							<br/>- Al terminar el primer juego, el que ha venido restando pasa a sacar, y viceversa. Y as�, alternativamente en todos lo juegos subsiguientes del partido.
							<br/>- Si un jugador saca fuera de turno, el jugador que hubiera debido sacar, debe hacerlo apenas descubierto el error. Todos los tantos contados antes de advertirse el error son v�lidos, pero si ha habido una sola falta del saque antes de apercibirse, �sta no debe contarse. En el caso de que antes de percatarse del error se haya terminado el juego, el orden de saque debe permanecer tal y como ha sido alterado.
							<br/>- Si durante un juego, el orden en que restan el saque es alterado por la pareja que resta, deber� continuar en esta forma hasta el final del juego en que se ha producido la equivocaci�n. Pero en los juegos subsiguientes de aquel set, la pareja adoptar� la colocaci�n escogida al iniciar el mismo.
							<br/>- Si en el transcurso del juego un jugador golpeara al contrario con la pelota, se considerar� que el jugador golpeado (bien haya sido en su cuerpo o en sus ropas), habr� perdido el tanto.
							<br/>- En los dobles, al empezar cada set, la pareja que saca decidir� cu�l de los dos jugadores efectuar� el saque, y de ah� en adelante lo har�n por turno, sacando cada juego uno de ellos.
							<br/>- La pareja que tenga que recibir el servicio en cualquiera de los sets, decidir� cu�l de los dos debe restar el primer servicio, y dicho jugador continuar� recibiendo el primer servicio de cada juego hasta la terminaci�n del set, es decir, que el jugador que resta no podr� cambiar el lado dentro de un mismo set.
							<br/>- Cuando un jugador gana su primer tanto, se le asigna la puntuaci�n de 15; ganando el segundo, su puntuaci�n se eleva a 30; cuando gana el tercero la puntuaci�n alcanza a 40 para dicho jugador, y al cuarto tanto el jugador gana el "juego". Si cada uno de los jugadores ha ganado tres puntos, se le da el nombre de "iguales"; el primer tanto conseguido inmediatamente despu�s se denomina "ventaja" en favor del jugador que lo ha ganado; si el mismo jugador gana el tanto siguiente, gana el "juego"; si, contrariamente lo pierde, se anuncia otra vez "iguales", y as� sucesivamente hasta que uno de los jugadores haya marcado dos puntos m�s que el otro; entonces, gana el juego.
							<br/>- El jugador que gana primero seis juegos, gana un set; a no ser que el contrario haya ganado cinco, en cuyo caso deber� jugarse un juego m�s, y si consigue siete juegos gana el set. Si empatan a seis juegos:
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	ganar� el set el que consiga dos juegos de diferencia.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	se aplicar� la muerte s�bita (m�s abajo).				
							<br/>- Los partidos podr�n ser al mejor de tres o cinco sets.
							<br/>- Los jugadores podr�n descansar cuando se cambie de lado, es decir, en los juegos impares, y podr�n hacerlo teniendo en cuenta que desde la terminaci�n del juego anterior, hasta que el juego est� preparado para el juego siguiente, transcurrir� un tiempo m�ximo de un minuto.
							<br/>- En los partidos jugados al mejor de cinco sets, podr� hacerse un descanso adicional de diez minutos despu�s del tercer set, cuando al menos uno de los jugadores as� lo solicite.
						</td>
					<tr>
						<td width="100%" class="datosNoticia" valign="top" align="justify">
							<span class="tituloCabeceraComentario"><br/><b>Muerte s�bita</b><br/></span>		
							<br/>- Cuando se empata a 6 juegos, puede jugarse una muerte s�bita.
							<br/>- Ganar� el primero que consiga 7 tantos, teniendo en cuenta que deber� hacerlo con 2 de ventaja.
							<br/>- Sacar� en primer lugar el jugador al que le correspondiera, en caso de no haber habido muerte s�bita, y lo har� desde el lado derecho de su pista, sacando una sola vez. A continuaci�n sacar� el contrario 2 veces, empezando a hacerlo desde el lado izquierdo, y as� sucesivamente.
							<br/>- Los jugadores cambiar�n de campo cada 6 tantos.
							<br/>- El vencedor de la muerte s�bita se considera que ha ganado el set por 7-6.
							<br/>- En el set siguiente, empezar� sacando el jugador que no hubiera empezado sacando la muerte s�bita.
						</td>	
					</tr>
					<tr>
						<td width="100%" class="datosNoticia" valign="top" align="justify">
							<span class="tituloCabeceraComentario"><br/><b>Durante el juego</b><br/></span>		
							<br/>- El jugador que golpee dos veces seguidas la pelota, perder� el tanto.
							<br/>- Las pelotas acucharadas o empujadas, se considerar�n buenas siempre que el jugador no las haya golpeado dos veces, y realice un solo "swing".
							<br/>- El jugador perder� el tanto:
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	Si el jugador o su paleta (est� o no en su mano), o cualquier objeto que lleve consigo, toca cualquier parte de la red, incluidos los postes o el terreno de la parte del campo contrario (incluida la malla met�lica), mientras la pelota est� en juego.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	Si devuelve la pelota antes de que �sta haya pasado la red.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.	Si toca la pelota, lanzando contra ella la paleta.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.	Si la pelota que est� en juego le toca a �l o a cualquier objeto que lleve consigo, excepto la paleta.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.	Si salta por encima de la red mientras el punto est� en disputa.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.	Los jugadores est�n autorizados a salir de la pista y golpear la pelota mientras esta no haya botado por segunda vez.
							<br/>- Si un jugador comete un acto, ya sea deliberado o involuntario, que a juicio del Arbitro moleste a su contrincante para efectuar la devoluci�n, el Arbitro, en el primer supuesto, conceder� el tanto al contrincante, y en el segundo, ordenar� que el tanto vuelva a ser jugado cuando el jugador que ha molestado haya ganado el tanto.
							<br/>- Una pelota que bota sobre o rozando la l�nea, se considerar� como ca�da en el campo limitado por aquella l�nea.
							<br/>- Una pelota que bote en el �ngulo (esquina) formado por una de las paredes de la "U" y el suelo, se considerar� buena. (La pelota familiarmente denominada "huevo", es buena).
							<br/>- El jugador podr� lanzar la pelota al campo contrario haciendo que bote en dicho campo, y posteriormente se salga del l�mite de la pista.
							<br/>- Si la pelota considerada en el caso anterior volviera al campo de juego, por haber golpeado un �rbol o cualquier objeto ajeno a la pista, se considerar� que el jugador que lanza fuera, gana el tanto, aunque el contrario pudiera devolv�rsela.
							<br/>- Si una pelota pasara la red, botara en el campo contrario, se saliera de la pista por alg�n hueco o desperfecto de la red met�lica o bien se quedara enganchada en �sta, ser� tanto del jugador que lanz� la pelota.
							<br/>- El jugador podr� devolver la pelota de volea, con excepci�n del saque. (La modalidad saque-fondo, es decir, no poder volearse la devoluci�n del servicio, podr� adoptarse por el pa�s que lo desee).
							<br/>- La pelota no podr� botar m�s de una vez en el suelo. Una vez que la pelota haya botado en el suelo, podr� hacerlo en la pared y/o en la red met�lica ; en cualquier caso, el jugador deber� devolverla antes de que la pelota bote por segunda vez n el campo.
							<br/>- Si un jugador golpeara con violencia una pelota y esta botara en el campo contrario, golpeara en una de las paredes, y volviera al campo del que lanz�, se considerar� "tanto", si el contrario no la hubiera tocado.
							<br/>- Un jugador podr� golpear con la pelota en cualquiera de sus paredes y hacer que esta, posteriormente, pase por encima de la red y que bote en el campo contrario.
							<br/>- Si la pelota lanzada por un jugador tocara la red met�lica antes de pasar la red, y botara en el campo contrario, se considerar� que hab�a sido mala del que la lanz�.
							<br/>- En algunas pistas, entre los postes que sujetan la red y la red met�lica, queda un espacio; si la pelota pasara por dicho espacio, ser� buena s�lo si a juicio del Arbitro ha pasado a una altura superior a la de la red.
						</td>	
					</tr>
	
			</table>
			</div>    
		</td>
		<td class="celdaInformacion" align="center" valign="top">

		</td>
	</tr>
		
	<tr>
		<td colspan="2">
			<div id="piePagina">
				<br/>
			</div>
		</td>
	</tr>
</table>



<table>


</table>



</body>
</html>