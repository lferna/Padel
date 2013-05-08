<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="padel.persistence.SesionPersistence" %>
<%@ page import="padel.data.Sesion" %>
<%@ page import="java.util.List" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CSS Menus &rsaquo; qrayg.com</title>
<link href="estilos/menu.css" rel="stylesheet" type="text/css" />
<style type="text/css">
* {
margin: 0;
padding: 0;
}
</style>

</head>

<body>
<div id="contenidoMenu"> 
  <ul id="navmenu-h">
    <li><a href="inicio.jsp">Inicio</a></li>
    <li><a href="reglas.jsp">Reglas</a></li>
	<li><a href="clasificacion.jsp">Clasificaci&oacute;n</a></li>
    <li><a href="resultados.jsp">Resultados</a></li>
	<li><a href=<%=request.getContextPath()%>"/ServletEquipo">Equipos</a></li>
	<li><a href=<%=request.getContextPath()%>"/ServletJugador">Inscribirse</a></li>
	<li><a href=<%=request.getContextPath()%>"/ServletResultado">Puntos</a></li>
  </ul>
</div>
</body>
</html>