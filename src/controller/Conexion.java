package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

	// Propiedades
	private static Connection conn = null;
	private String driver;
	private String url;
	private String usuario;
	private String password;

	// Constructor
	private Conexion() throws ClassNotFoundException {

		String url = "jdbc:mysql://localhost/mensajeria?serverTimezone=UTC";
		String driver = "com.mysql.cj.jdbc.Driver";
		String usuario = "java";
		String password = "1234";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, usuario, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // Fin constructor

	// Métodos
	public static Connection getConnection() throws ClassNotFoundException {

		if (conn == null) {
			new Conexion();
		}

		return conn;
	} // Fin getConnection
}