<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="padel.data.Equipo" %>
<%@ page import="padel.data.Sesion" %>
<%@ page import="padel.persistence.EquipoPersistence" %>
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
			<div id="contenido"> 
				<h3 class="clasificacion">Clasificaci&oacute;n</h3>  
				<table id="primera" class="clasificacion"> 
					<tr> 
						<th class="posicion"></th> 
						<th class="equipo" align="left" width="90%" style="padding-left:15px;">Equipo</th> 						
						<th class="puntos" width="5%">Puntos</th> 
					</tr> 
					
					 <% 
					 	EquipoPersistence equipoPersistence = new EquipoPersistence();
						List<Equipo> equipos = equipoPersistence.getEquipos();
						if (equipos==null){
							equipos = new ArrayList();
						}
						Iterator iterador = equipos.iterator();
 						int i=0;
 						while (iterador.hasNext()){
 						i++;
 						
 						Equipo equipo = (Equipo)iterador.next();
 					%>
					<tr>		
						<td class="primero"><%=i%></td>				
						<td class="equipos"><%=equipo.getNombre()%> </td>						
						<td class="puntos"><%=equipo.getPuntos()%></td> 
					</tr>

					<%}	%>
				</table>
				</div>
			</br>
			
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



<table>


</table>



</body>
</html>