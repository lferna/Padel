<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="padel.data.Torneo" %>
<%@ page import="padel.data.Sesion" %>
<%@ page import="padel.data.Equipo" %>
<%@ page import="padel.persistence.TorneoPersistence" %>
<%@ page import="padel.persistence.EquipoPersistence" %>
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
				<h3 class="clasificacion">Puntos</h3>  
			<form action = "ServletResultado" method = "post">		
					<table cellspacing="19px">
						<tr><td  colspan="2"></br></td></tr>
						<tr>
							<td class="insertarComentario" align="right" valign="top" width="40%">
								<span class="tituloCabeceraComentario">Equipo:</span>
							</td>
							<td>
								<select name="equipo">
								 <% 
							    EquipoPersistence equipoPersistence = new EquipoPersistence();
								List<Equipo> equipos = equipoPersistence.getEquipos();
								if (equipos==null){
									equipos = new ArrayList();
								}
		 						Iterator iterador = equipos.iterator();
		 						while (iterador.hasNext()){
		 						Equipo equipo = (Equipo)iterador.next();
		 						%>
		 						<option value="<%=equipo.getNombre()%>" ><%=equipo.getNombre()%></option>
		 						<%}%>
		 						</select>
							</td>
						</tr>						
						<tr>
							<td class="insertarComentario" align="right" valign="top">
								<span class="tituloCabeceraComentario">Puntos:</span>
							</td>
							<td>
								<input type="text" name="puntos" size="3" maxlength="3" />
							</td>
						</tr>	
						<tr><td  colspan="2"></br></td></tr>														
						<tr>
							<td colspan="2" align="center">								
								<input type="submit" class="botonComentario"  name="boton" value="Modificar Puntuacion" size="20" />
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