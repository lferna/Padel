<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="padel.persistence.SesionPersistence" %>
<%@ page import="java.util.List" %>
<%@ page import="padel.data.Sesion" %>
<html>
<head>
</head>
<body>
<script>
<%
SesionPersistence sesion = new SesionPersistence("conectado");
List objetos = sesion.getObjeto();
String cadena="";
if (objetos!=null && objetos.size()>0){
	Sesion objetoSesion = (Sesion) objetos.get(0);
	cadena =  objetoSesion.objeto;
}
sesion.deleteObjeto();
%>
window.open('<%=cadena%>','_self');		
</script>

</body>
</html>