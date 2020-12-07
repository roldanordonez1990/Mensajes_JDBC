package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Conexion;

/**
 * Servlet implementation class ServletNuevoMensaje
 */
@WebServlet("/ServletNuevoMensaje")
public class ServletNuevoMensaje extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletNuevoMensaje() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();

		out.println("<html>");
		out.println("<body>");
		out.println("Los datos se están mandando por el método post, no por aquí");
		out.println("</body>");
		out.println("</html>");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		int id = Integer.parseInt(request.getParameter("idNuevo"));

		int receptor = Integer.parseInt(request.getParameter("destinatario"));

		int emisor = Integer.parseInt(request.getParameter("emisor"));

		String mensaje = request.getParameter("mensajeNuevo");

		Connection con = null;
		try {
			con = Conexion.getConnection();

		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Statement s = null;
		try {
			s = (Statement) con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//ResultSet rs;
		try {
			String sentencia = "INSERT INTO mensajes values(?,?,?,?)";
			PreparedStatement i = con.prepareStatement(sentencia);
			i.setInt(1, id);
			i.setInt(2, emisor);
			i.setInt(3, receptor);
			i.setString(4, mensaje);
			i.executeUpdate();
			response.sendRedirect("vistaLogueo.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
