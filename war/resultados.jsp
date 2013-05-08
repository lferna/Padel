<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="padel.data.Partido" %>
<%@ page import="padel.data.Sesion" %>
<%@ page import="padel.data.Torneo" %>
<%@ page import="padel.persistence.SesionPersistence" %>
<%@ page import="padel.persistence.PartidoPersistence" %>
<%@ page import="padel.persistence.TorneoPersistence" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="estilos/resultados.css" rel="stylesheet" type="text/css" />
<link href="estilos/cuadros.css" rel="stylesheet" type="text/css" />
<link href="estilos/roland.css" rel="stylesheet" type="text/css" />


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
			<div id="nuevaNoticia">
				<h3 class="clasificacion">Resultados del Campeonato</h3>  
			<form action = "ServletJugador" method = "post">		
			
			</form>
			</div>



<div id="contenido" class="estirar">
<div id="contenedorcuadro">
<h4 class="cintillo"><span class="nombre">TORNEO 1:</span> <span><form name="form1" id="form1" style="width:136px; margin-left:570px;">
</form></span></h4>
<br />
<div class="contenedorCalendarioInt" id="contenedorCalendarioInt" onclick="cambiaEquipo(event)">
<table>

<tr>
<th colspan="4">CUARTOS</th>
<th colspan="4">SEMIFINALES</th>
<th colspan="4">FINAL</th>
</tr>
<tr>

<td rowspan="2" ><span class="equipo_112000001">Serena Williams (USA)</span></td>
<td rowspan="2" class="resultado2">2</td>
<td rowspan="2" class="resultado2">7</td>
<td rowspan="2" class="resultado2">6</td>
<td rowspan="4" class="ganador"><span class="equipo_112000545">Samantha Stosur (AUS)</span></td>
<td rowspan="4" class="resultado2">6</td>
<td rowspan="4" class="resultado2">6</td>
<td rowspan="4" class="resultado2">-</td>

<td rowspan="8" class="gris"><span class="equipo_112000545">Samantha Stosur (AUS)</span></td>
<td rowspan="8" class="resultado">4</td>
<td rowspan="8" class="resultado">6</td>
<td rowspan="8" class="resultado">-</td>
</tr>
<tr>


</tr>
<tr>

<td rowspan="2" class="ganador"><span class="equipo_112000545">Samantha Stosur (AUS)</span></td>
<td rowspan="2" class="resultado2">6</td>
<td rowspan="2" class="resultado2">6</td>
<td rowspan="2" class="resultado2">8</td>

</tr>
<tr>

</tr>
<tr>


<td rowspan="2" class="gris ganador"><span class="equipo_112000196">Jelena Jankovic (SRB)</span></td>
<td rowspan="2" class="resultado">7</td>
<td rowspan="2" class="resultado">6</td>
<td rowspan="2" class="resultado">-</td>
<td rowspan="4" class=""><span class="equipo_112000196">Jelena Jankovic (SRB)</span></td>
<td rowspan="4" class="resultado2">1</td>
<td rowspan="4" class="resultado2">2</td>
<td rowspan="4" class="resultado2">-</td>

</tr>
<tr>

</tr>
<tr>

<td rowspan="2" class="gris"><span class="equipo_112001229">Yaroslava Shvedova (KAZ)</span></td>
<td rowspan="2" class="resultado">5</td>
<td rowspan="2" class="resultado">4</td>
<td rowspan="2" class="resultado">-</td>
</tr>
<tr>

</tr>
<tr>

<td rowspan="2" class="ganador"><span class="equipo_112000041">Francesca Schiavone (ITA)</span></td>
<td rowspan="2" class="resultado2">6</td>
<td rowspan="2" class="resultado2">6</td>

<td rowspan="2" class="resultado2">-</td>
<td rowspan="4" class="gris ganador"><span class="equipo_112000041">Francesca Schiavone (ITA)</span></td>
<td rowspan="4" class="resultado">7</td>
<td rowspan="4" class="resultado"></td>
<td rowspan="4" class="resultado">-</td>
<td rowspan="8" class="ganador"><span class="equipo_112000041">Francesca Schiavone (ITA)</span></td>
<td rowspan="8" class="resultado">6</td>
<td rowspan="8" class="resultado">7</td>
<td rowspan="8" class="resultado">-</td>

</tr>
<tr>

</tr>
<tr>

<td rowspan="2" ><span class="equipo_112002092">Caroline Wozniacki (DEN)</span></td>
<td rowspan="2" class="resultado2">2</td>
<td rowspan="2" class="resultado2">3</td>
<td rowspan="2" class="resultado2">-</td>
</tr>
<tr>

</tr>
<tr>

<td rowspan="2" class="gris ganador"><span class="equipo_112000019">Elena Dementieva (RUS)</span></td>
<td rowspan="2" class="resultado">2</td>
<td rowspan="2" class="resultado">6</td>

<td rowspan="2" class="resultado">6</td>
<td rowspan="4" class="gris"><span class="equipo_112000019">Elena Dementieva (RUS)</span></td>
<td rowspan="4" class="resultado">6</td>
<td rowspan="4" class="resultado">ab</td>
<td rowspan="4" class="resultado">-</td>
</tr>
<tr>

</tr>
<tr>

<td rowspan="2" class="gris"><span class="equipo_112000112">Nadia Petrova (RUS)</span></td>
<td rowspan="2" class="resultado">6</td>
<td rowspan="2" class="resultado">2</td>
<td rowspan="2" class="resultado">0</td>
</tr>
<tr>
</tr>
</table>
</div>

</div>

<!-- // Contenido -->
</div>

		</td>
		<td class="celdaInformacion" align="center" valign="top">
		<jsp:include page="comentarios.jsp"></jsp:include>
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



</body>
</html>