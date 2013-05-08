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
<style type="text/css">

* {
margin: 0;
padding: 0;
}
</style>
</head>
<body>
<form action = "ServletComentario" method = "post">	
<table width="88%">
    <tr><td></br></td></tr>
     	<tr>
     		<td width="90%">
     	   <div id="resultados">
						<h2 id="proximosPartidos"></h2>			 
            	<tr class="finalizado">  
								<td width="80%" class="local">
								<table>
									<tr class="partidos">
										<td width="10%" align="center" style="padding-left:10px;">
										<span>Nombre:</span>
										<input type="text" name="nombre" size="10" maxlength="10" />
										</td>
									</tr>
									<tr class="partidos">
										<td width="35%" align="center" style="padding-left:10px;">
										<span>Comentario:</span>
										<input type="text" name="nombre" size="30" maxlength="300" />
										</td>										
									</tr>
								</table>
  						</tr> 
						</table> 
					</div>
	  	  </td>
  	  </tr>
    </table>
</form>
  </br>



	<table width="88%">
    <tr><td></br></td></tr>
     	<tr>
     		<td width="90%">
     	   <div id="resultados">
						<h2 id="clasificacion"></h2>			 
            <table>  
            	<%
            	ComentarioPersistence comentarioPersistence = new ComentarioPersistence();
            	List<Comentario> comentarios = comentarioPersistence.getComentarios();
            	Iterator iteradorComentarios = comentarios.iterator();
            	int numero = 0;
            	while (iteradorComentarios.hasNext()){
            	Comentario comentario = (Comentario)iteradorComentarios.next();
            	numero++;
            	%>
	  						<tr class="clasificacion">  
									<td width="10%" style="padding-left:5px;"><p><%=numero%></p></td>
									<td width="80%" class="equipo"><%=comentario.getUsuario()%></td>  
  									<td width="10%"><p><%=comentario.getComentario()%></p></td> 
  							</tr>
  			<%} %> 
						</table> 
					</div>
	  	  </td>
  	  </tr>
    </table>
		<br/>
</body>
</html>