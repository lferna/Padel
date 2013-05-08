<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="padel.data.Jugador" %>
<%@ page import="padel.data.Sesion" %>
<%@ page import="padel.persistence.JugadorPersistence" %>
<%@ page import="padel.persistence.SesionPersistence" %>
<%@ page import="java.util.logging.Logger" %>
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
<script>
function mensajeOK(){
	alert ("Te has inscrito correctamente");
}
function mensajeUsuarioInscrito(){
	alert ("Ya te has inscrito anteriormente");
}

</script>
	


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
				<h3 class="clasificacion">Inscripci&oacute;n de usuario</h3>  
			<form action = "ServletJugador" method = "post">		
					<table cellspacing="19px">
					
						
						<tr><td  colspan="2"></br></td></tr>
						<tr>
							<td class="insertarComentario" align="right" valign="top" width="40%">
								<span class="tituloCabeceraComentario">Nombre:</span>
							</td>
							<td>
								<input type="text" name="nombre" size="30" maxlength="100" />
							</td>
						</tr>
						<tr>
							<td class="insertarComentario" align="right" valign="top">
								<span class="tituloCabeceraComentario">Apellidos:</span>
							</td>
							<td>
								<input type="text" name="apellidos" size="50" maxlength="600" />
							</td>
						</tr>
						<tr>
							<td class="insertarComentario" align="right" valign="top">
								<span class="tituloCabeceraComentario">Línea:</span>
							</td>
							<td>
								<input type="text" name="linea" size="50" maxlength="500" />
							</td>
						</tr>

						<tr>
							<td class="insertarComentario" align="right" valign="top">
								<span class="tituloCabeceraComentario">Pareja:</span>
							</td>
							<td>
								<select name="pareja">
								<option value="vacio" selected="selected"></option>
								<%
								
								JugadorPersistence jugadorPersistence = new JugadorPersistence();
								List<Jugador> jugadores = jugadorPersistence.devolverTodosJugadores();
								if (jugadores==null){
									jugadores = new ArrayList();
								}
								
								Iterator<Jugador> iterador = jugadores.iterator();
							 	while (iterador.hasNext()){
							 	Jugador jugador = (Jugador)iterador.next();
							 	%>		
								<option value="<%=jugador.getNombre()%> <%=jugador.getApellidos()%>"><%=jugador.getNombre()%> <%=jugador.getApellidos()%></option>							
								<%}%>
								</select>
								
							</td>
						</tr>
						<tr>
							<td class="insertarComentario" align="right" valign="top">
								<span class="tituloCabeceraComentario">Equipo:</span>
							</td>
							<td>
								<input type="text" name="equipo" size="50" maxlength="500" />
							</td>
						</tr>
						<tr><td  colspan="2"></br></td></tr>														
						<tr>
							<td colspan="2" align="center">								
								<input type="submit" class="botonComentario"  name="boton" value="Inscribirse" size="20" />
							</td>
						</tr>
					
					</table>
			</form>
			</div>
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