package br.com.ebenezer.gestorIBE.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ebenezer.gestorIBE.modelo.Login;
import br.com.ebenezer.gestorIBE.modelo.Painel;

//mapear a classe servlet
@WebServlet(name = "servletLogin", urlPatterns = "/servletLogin")
public class ServletLogin extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {
		// tenho que pegar as informações do formulário
		
		Login login = new Login();
		
		login.setUsuario(request.getParameter("usuario"));
		login.setSenha(request.getParameter("senha"));
		
		System.out.println(login.getUsuario()+" "+login.getSenha());
		
	}
}