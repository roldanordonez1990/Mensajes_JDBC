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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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




	<div class="card">
		<div class="card-header bg-success text-white">
			<h4 class="mb-0" style="text-align: center">Crea un nuevo
				mensaje</h4>
		</div>

		<div class="container py-3">

			<form action="/Mensajes_JDBC/ServletNuevoMensaje" method="post">

				<div class="card-body">

					<%
					Connection con = null;
					con = Conexion.getConnection();
					Statement s = null;
					s = (Statement) con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
					ResultSet rs;
					rs = s.executeQuery("select * from usuarios");
					
					%>


					Destinatario: <select name="destinatario">
						<%
					while(rs.next()){
						%>
						<option value=<%out.println(rs.getString(1));%>>
							<% out.println(rs.getString(2)); %>
						</option>

						<% 
					}
					rs.close();
					s.close();
					%>

					</select> <br> 
					Emisor: <input name="emisor" type="text" value="<% out.println(session.getAttribute("id")); %>" readonly>
					<br> Mensaje: <input type="text" name="mensajeNuevo">
					<br> <br>

					<%
					s = (Statement) con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
					ResultSet rs1;
					rs1 = s.executeQuery("select * from mensajes ORDER BY id DESC LIMIT 1");
					while(rs1.next()){
						%>
						<input type="hidden" name="idNuevo" value=<% out.println(rs1.getInt(1) +1); %>>
						<%
					}
					
						
					%> 

					<input type="submit" name="crearMen" class="btn-outline-success"
						value="Crear">
				</div>
			</form>
			<form action="vistaLogueo.jsp" method="post">
				<input type="submit" name="" value="Volver">
			</form>
		</div>
	</div>
	<br>

</body>
</html>