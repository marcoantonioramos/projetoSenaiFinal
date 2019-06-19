package br.com.ebenezer.gestorIBE.modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConectarJDBC {

	public Connection getConectar() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost/gestor_ibe", "root", "");

		} catch (Exception e) {
			System.out.println("erro de conexão");
			return null;
		}

	}

}
