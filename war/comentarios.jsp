<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="padel.data.Comentario" %>
<%@ page import="padel.persistence.ComentarioPersistence" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CSS Menus &rsaquo; qrayg.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="estilos/comentarios.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="col_dcha">
<div id="nuevaNoticia">
<h3>¡Comenta! </h3>
</div>
<img src='/imagenes/hr_mini.png' class='hr_mini'>
<div class="divcomentar">
<form action = "ServletComentario" method = "post" style="margin-left: 10px;">	
	<b>JUGADOR:</b><br/><input class="cajanick" type="text" name="usuario">
	<br/>
    <b>COMENTARIO:</b><br/>	
	<textarea class="cajacomentar" name="comentario"></textarea><br/>
	<input type="submit" name="boton" value="Comenta"><br>    
</form>
</div>
<h3>Últimos comentarios</h3>
<img src='/imagenes/hr_mini.png' class='hr_mini'>

            	<%
            	ComentarioPersistence comentarioPersistence = new ComentarioPersistence();
            	List<Comentario> comentarios = comentarioPersistence.getComentarios();            	
            	Iterator iteradorComentarios = comentarios.iterator();
            	int numero = comentarios.size();
            	while (iteradorComentarios.hasNext()){
            	Comentario comentario = (Comentario)iteradorComentarios.next();            	
            	%>
            	
	  					<div  class='comentario'>
	  					
						<em>#<%=numero%>&nbsp;<%=comentario.getUsuario()%> el día <%=comentario.getFecha()%><span> :</span></em><br/><br/>
						<p><%=comentario.getComentario()%><p><br/>						
						</div>
						<hr class='barra'>
						<br/>
  			<%
  			numero--;
  			} 
  			%> 

</div>
</body>
</html>