package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import controller.Conexion;


/**
 * Servlet implementation class ServletLogueo
 */
@WebServlet(name = "/ServletLogueo", urlPatterns = { "/ServletLogueo" })
public class ServletLogueo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletLogueo() {
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
		String nombre = request.getParameter("usuario");
		String pass = request.getParameter("pass");
		
		Connection con = null;
		try {
			con = Conexion.getConnection();
			
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Statement s = null;
		try {
			s = (Statement) con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResultSet rs;
		try {
			rs = s.executeQuery("select * from usuarios where nombre='" + nombre + "' AND password = '" + pass + "'");
			if (rs != null && rs.next()) {

				if (nombre.equals("admin") && pass.equals("admin")) {
					request.getSession().setAttribute("logueado", rs.getString(2));
//					request.getSession().setAttribute("administrador", rs.getString(2) + " " + rs.getString(4));
					response.sendRedirect("vistaAdministrador.jsp");

				} else {
					request.getSession().setAttribute("logueado", rs.getString(2));
					request.getSession().setAttribute("id", rs.getString(1));
					response.sendRedirect("vistaLogueo.jsp");
					
					
				}

			} else {
				response.sendRedirect("index.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		

	}

}
