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
							<br/>- Los jugadores estarán cada uno en una parte opuesta de la red
							<br/>- El jugador que lance la pelota por primera vez es el que saca, y el que contesta es el que resta.							
							<br/>- La elección del lado, y el derecho a ser el que saque o el que reste en el primer juego, se decidirá por suerte (cara o cruz). El que resulte ganador podrá elegir entre sacar o escoger campo.
							<br/>- El campeonato se jugará por parejas.
						</td>	
					</tr>
					<tr>
						<td width="100%" class="datosNoticia" valign="top" align="justify">
							<span class="tituloCabeceraComentario"><br/><b>El servicio</b><br/></span>		
							<br/>- El que lo ejecute estará con ambos pies detrás de la línea de saque y entre la raya central de esta y la pared lateral, y lanzará la pelota por encima de la red directamente hacia el cuadro situado en el otro campo, en línea diagonal, y en primer lugar al que esté situado a su izquierda
							<br/>- El jugador botará la pelota detrás de la línea de saque. En el momento de golpear la pelota con su paleta, se considerará el saque efectuado.</br>
							<br/>- Durante toda la ejecución del servicio, el jugador que efectúe el saque queda obligado a:
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Sacar detrás de la línea de saque y entre la raya central de ésta y la pared lateral	
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. Botar la pelota en la misma zona.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. No tocar con los pies la línea de saque ni pasarse al lado contrario, pues el saque es cruzado.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. En el momento del saque, el jugador deberá golpear la pelota por debajo de su cintura y tener, al menos, un pie en contacto con el suelo.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.	El jugador no podrá cambiar de posición andando o corriendo.
							<br/>- Si un servicio es ejecutado inadvertidamente desde la mitad no correspondiente, todos los tantos marcados en tal situación son correctos, pero el error de posición deberá ser corregido tan pronto sea descubierto.
							<br/>- El que resta deberá esperar a que la pelota bote dentro del cuadro, y deberá golpearla antes de que bote por segunda vez.
							<br/>- La pelota podrá botar dos veces seguidas dentro del campo, o hacerlo después de haber dado en una de las paredes; en ambos casos el saque se considera bueno. Se exceptúa si da en la "esquina" o "canto".
							<br/>- Si la pelota lanzada por el que saca, pasara la red, botara en el campo contrario, y diera en cualquiera de las redes metálicas que delimitan el campo, sería considerada como falta.
							<br/>- El que saca, tendrá derecho a un segundo servicio si hubiera cometido falta en el primero.
							<br/>- Todo servicio que sea bueno, pero que haya tocado la red, se considerará como "net" y deberá repetirse.
							<br/>- Si el "net" se produjera en el segundo servicio, el que saca tendrá derecho sólo a un saque más.
							<br/>- Se considera "net" el servicio que da en la red y bota dos veces en el campo antes de tocar la tela metálica.
							<br/>- Al terminar el primer juego, el que ha venido restando pasa a sacar, y viceversa. Y así, alternativamente en todos lo juegos subsiguientes del partido.
							<br/>- Si un jugador saca fuera de turno, el jugador que hubiera debido sacar, debe hacerlo apenas descubierto el error. Todos los tantos contados antes de advertirse el error son válidos, pero si ha habido una sola falta del saque antes de apercibirse, ésta no debe contarse. En el caso de que antes de percatarse del error se haya terminado el juego, el orden de saque debe permanecer tal y como ha sido alterado.
							<br/>- Si durante un juego, el orden en que restan el saque es alterado por la pareja que resta, deberá continuar en esta forma hasta el final del juego en que se ha producido la equivocación. Pero en los juegos subsiguientes de aquel set, la pareja adoptará la colocación escogida al iniciar el mismo.
							<br/>- Si en el transcurso del juego un jugador golpeara al contrario con la pelota, se considerará que el jugador golpeado (bien haya sido en su cuerpo o en sus ropas), habrá perdido el tanto.
							<br/>- En los dobles, al empezar cada set, la pareja que saca decidirá cuál de los dos jugadores efectuará el saque, y de ahí en adelante lo harán por turno, sacando cada juego uno de ellos.
							<br/>- La pareja que tenga que recibir el servicio en cualquiera de los sets, decidirá cuál de los dos debe restar el primer servicio, y dicho jugador continuará recibiendo el primer servicio de cada juego hasta la terminación del set, es decir, que el jugador que resta no podrá cambiar el lado dentro de un mismo set.
							<br/>- Cuando un jugador gana su primer tanto, se le asigna la puntuación de 15; ganando el segundo, su puntuación se eleva a 30; cuando gana el tercero la puntuación alcanza a 40 para dicho jugador, y al cuarto tanto el jugador gana el "juego". Si cada uno de los jugadores ha ganado tres puntos, se le da el nombre de "iguales"; el primer tanto conseguido inmediatamente después se denomina "ventaja" en favor del jugador que lo ha ganado; si el mismo jugador gana el tanto siguiente, gana el "juego"; si, contrariamente lo pierde, se anuncia otra vez "iguales", y así sucesivamente hasta que uno de los jugadores haya marcado dos puntos más que el otro; entonces, gana el juego.
							<br/>- El jugador que gana primero seis juegos, gana un set; a no ser que el contrario haya ganado cinco, en cuyo caso deberá jugarse un juego más, y si consigue siete juegos gana el set. Si empatan a seis juegos:
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	ganará el set el que consiga dos juegos de diferencia.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	se aplicará la muerte súbita (más abajo).				
							<br/>- Los partidos podrán ser al mejor de tres o cinco sets.
							<br/>- Los jugadores podrán descansar cuando se cambie de lado, es decir, en los juegos impares, y podrán hacerlo teniendo en cuenta que desde la terminación del juego anterior, hasta que el juego está preparado para el juego siguiente, transcurrirá un tiempo máximo de un minuto.
							<br/>- En los partidos jugados al mejor de cinco sets, podrá hacerse un descanso adicional de diez minutos después del tercer set, cuando al menos uno de los jugadores así lo solicite.
						</td>
					<tr>
						<td width="100%" class="datosNoticia" valign="top" align="justify">
							<span class="tituloCabeceraComentario"><br/><b>Muerte súbita</b><br/></span>		
							<br/>- Cuando se empata a 6 juegos, puede jugarse una muerte súbita.
							<br/>- Ganará el primero que consiga 7 tantos, teniendo en cuenta que deberá hacerlo con 2 de ventaja.
							<br/>- Sacará en primer lugar el jugador al que le correspondiera, en caso de no haber habido muerte súbita, y lo hará desde el lado derecho de su pista, sacando una sola vez. A continuación sacará el contrario 2 veces, empezando a hacerlo desde el lado izquierdo, y así sucesivamente.
							<br/>- Los jugadores cambiarán de campo cada 6 tantos.
							<br/>- El vencedor de la muerte súbita se considera que ha ganado el set por 7-6.
							<br/>- En el set siguiente, empezará sacando el jugador que no hubiera empezado sacando la muerte súbita.
						</td>	
					</tr>
					<tr>
						<td width="100%" class="datosNoticia" valign="top" align="justify">
							<span class="tituloCabeceraComentario"><br/><b>Durante el juego</b><br/></span>		
							<br/>- El jugador que golpee dos veces seguidas la pelota, perderá el tanto.
							<br/>- Las pelotas acucharadas o empujadas, se considerarán buenas siempre que el jugador no las haya golpeado dos veces, y realice un solo "swing".
							<br/>- El jugador perderá el tanto:
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	Si el jugador o su paleta (esté o no en su mano), o cualquier objeto que lleve consigo, toca cualquier parte de la red, incluidos los postes o el terreno de la parte del campo contrario (incluida la malla metálica), mientras la pelota esté en juego.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	Si devuelve la pelota antes de que ésta haya pasado la red.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.	Si toca la pelota, lanzando contra ella la paleta.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.	Si la pelota que está en juego le toca a él o a cualquier objeto que lleve consigo, excepto la paleta.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.	Si salta por encima de la red mientras el punto está en disputa.
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.	Los jugadores están autorizados a salir de la pista y golpear la pelota mientras esta no haya botado por segunda vez.
							<br/>- Si un jugador comete un acto, ya sea deliberado o involuntario, que a juicio del Arbitro moleste a su contrincante para efectuar la devolución, el Arbitro, en el primer supuesto, concederá el tanto al contrincante, y en el segundo, ordenará que el tanto vuelva a ser jugado cuando el jugador que ha molestado haya ganado el tanto.
							<br/>- Una pelota que bota sobre o rozando la línea, se considerará como caída en el campo limitado por aquella línea.
							<br/>- Una pelota que bote en el ángulo (esquina) formado por una de las paredes de la "U" y el suelo, se considerará buena. (La pelota familiarmente denominada "huevo", es buena).
							<br/>- El jugador podrá lanzar la pelota al campo contrario haciendo que bote en dicho campo, y posteriormente se salga del límite de la pista.
							<br/>- Si la pelota considerada en el caso anterior volviera al campo de juego, por haber golpeado un árbol o cualquier objeto ajeno a la pista, se considerará que el jugador que lanza fuera, gana el tanto, aunque el contrario pudiera devolvérsela.
							<br/>- Si una pelota pasara la red, botara en el campo contrario, se saliera de la pista por algún hueco o desperfecto de la red metálica o bien se quedara enganchada en ésta, será tanto del jugador que lanzó la pelota.
							<br/>- El jugador podrá devolver la pelota de volea, con excepción del saque. (La modalidad saque-fondo, es decir, no poder volearse la devolución del servicio, podrá adoptarse por el país que lo desee).
							<br/>- La pelota no podrá botar más de una vez en el suelo. Una vez que la pelota haya botado en el suelo, podrá hacerlo en la pared y/o en la red metálica ; en cualquier caso, el jugador deberá devolverla antes de que la pelota bote por segunda vez n el campo.
							<br/>- Si un jugador golpeara con violencia una pelota y esta botara en el campo contrario, golpeara en una de las paredes, y volviera al campo del que lanzó, se considerará "tanto", si el contrario no la hubiera tocado.
							<br/>- Un jugador podrá golpear con la pelota en cualquiera de sus paredes y hacer que esta, posteriormente, pase por encima de la red y que bote en el campo contrario.
							<br/>- Si la pelota lanzada por un jugador tocara la red metálica antes de pasar la red, y botara en el campo contrario, se considerará que había sido mala del que la lanzó.
							<br/>- En algunas pistas, entre los postes que sujetan la red y la red metálica, queda un espacio; si la pelota pasara por dicho espacio, será buena sólo si a juicio del Arbitro ha pasado a una altura superior a la de la red.
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