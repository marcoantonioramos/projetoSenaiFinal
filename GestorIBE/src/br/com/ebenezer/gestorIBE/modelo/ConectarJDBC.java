package br.com.ebenezer.gestorIBE.modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConectarJDBC {
	
	private String status = "";
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Connection getConectar() {
		
		try {
			setStatus("Conectado");
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost/gestor_ibe", "root", "");
			
		} catch (Exception e) {
			setStatus("Desconectado");
			return null;
		}
				
	}

}
