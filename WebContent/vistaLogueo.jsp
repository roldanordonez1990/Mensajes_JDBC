
<%@page import="controller.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>logueo</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	type="text/css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

	<h3 class="bg-warning text-center">Desde Vista Usuarios</h3>
		
		<%
		if (session.getAttribute("logueado") != null) {
			
			
		%>
		<h3 class="text-center"><% out.println("Welcome, " + session.getAttribute("logueado") + " ¿Qué deseas hacer?");  %></h3>	
		
		
		<% 

		} else {

			response.sendRedirect("index.jsp");

		}
	%>

	<%
		Connection con = null;
		con = Conexion.getConnection();
		Statement s = null;
		s = (Statement) con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		ResultSet rs;
		rs = s.executeQuery("select * from mensajes where id_receptor='"+ session.getAttribute("id") +"'");
	%>


	<div class="container">
		<h4 style="text-align: start">Listado de mensajes</h4>
		<table class="table table-hover">
			<thead class="thead bg-success text-white">
				<tr>
				
					<th>Emisor</th>
					<th>Receptor</th>
					<th>Mensaje</th>

				</tr>
			</thead>
			<tbody>

				<%
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("<td>" + rs.getString(4) + "</td>");
						
						out.println("</tr>");

					}
				%>

			</tbody>
		</table>

		<br> <br>
		<div class="btn-group">

			<br> <br>
			<form action="vistaNuevoMensaje.jsp" method="post">
				<input type="submit" class="btn btn-outline-success"
					name="crearNuevo" value="Crear nuevo">
			</form>
			
		</div>

			<form action="index.jsp" method="post">
				<input type="submit" name="cerrarSesion" value="Cerrar Sesión">
			</form>
</body>
</html>