<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style> 
body{

background-image: url("https://fondosmil.com/fondo/20940.jpg");
}

</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

</head>
<body>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>



		
	<h4 style="margin: 18px;">Introduce tus datos de usuario</h4>
	
	<%
		if (session.getAttribute("logueado") == null || request.getParameter("cerrarSesion") != null) {
			
			session.setAttribute("logueado", null);
		%>

	<form class="form-inline" action="/Mensajes_JDBC/ServletLogueo" method="post">

		<div class="form-group mx-sm-3">

			<input class="form-control" name="usuario" placeholder="User">
			
		</div>
		<div class="form-group mx-sm-3">

			<input type="password" class="form-control" name="pass" placeholder="Pass">
		</div>
		<button type="submit" class="btn btn-outline-primary">Confirm</button>
	</form>

	<%
		} else {
			response.sendRedirect("vistaLogueo.jsp");
		}
	%>
</body>
</html>