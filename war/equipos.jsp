<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="padel.persistence.EquipoPersistence" %>
<%@ page import="padel.data.Equipo" %>
<%@ page import="padel.data.Sesion" %>
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
			<div id="nuevaNoticia">
				<h3 class="clasificacion">Equipos del Campeonato</h3>  
			<form action = "ServletJugador" method = "post">		

					
					<table cellspacing="19px">
									
					 <% 
					    EquipoPersistence equipoPersistence = new EquipoPersistence();
						List<Equipo> equipos = equipoPersistence.getEquipos();
						if (equipos==null){
							equipos = new ArrayList();
						}
 						Iterator iterador = equipos.iterator();
 						int i = -1;
 						while (iterador.hasNext()){
 						i++;
 						Equipo equipo = (Equipo)iterador.next();
 					%>
					<%if (i==0){ 						
 					%>
					<tr>
					<%
 						}
					%>
					<td>
					<table align="center" border="1" class="sample">
						<tr>
							<td class="insertarComentario" align="right" valign="top" width="40%">
								<span class="tituloCabeceraComentario">Equipo:</span>
							</td>
							<td>
								<%=equipo.getNombre()%>
							</td>
							</tr>

						<tr>
							<td class="insertarComentario" align="right" valign="top" width="40%">
								<span class="tituloCabeceraComentario">Jugador 1:</span>
							</td>
							<td>
								<%=equipo.getJugador1()%>
							</td>
						</tr>

						<tr>
							<td class="insertarComentario" align="right" valign="top" width="40%">
								<span class="tituloCabeceraComentario">Jugador 2:</span>
							</td>
							<td>
								<%=equipo.getJugador2()%>
							</td>
						</tr>

						<tr>
							<td class="insertarComentario" align="right" valign="top" width="40%">
								<span class="tituloCabeceraComentario">Linea:</span>
							</td>
							<td>
								<%=equipo.getLinea()%>
							</td>
						</tr>
					</table>
					</td>
					<%if (i==1){ %>
					</tr>
					<%i=-1;} %>
					<%}	%>
													
					</table>
					
					

			</form>
			</div>
		</td>
		<td class="celdaInformacion" align="center" valign="top">
			<?php include('informacion.php'); ?>
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