package br.com.ebenezer.gestorIBE.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ebenezer.gestorIBE.modelo.Painel;

//mapear a classe servlet
@WebServlet(name = "servletPainel", urlPatterns = "/servletPainel")
public class ServletPainel extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {
		// tenho que pegar as informações do formulário
		

		Painel obj = new Painel();
		
		obj.setCodigo(Integer.parseInt(request.getParameter("codigo")));
		obj.setNome(request.getParameter("nome"));
//		obj.setNascimento(request.getParameter("nascimento"));
//		obj.setSexo(request.getParameter("sexo"));
//		obj.setTelefone(request.getParameter("telefone"));
//		obj.setEmail(request.getParameter("email"));
//		obj.setCep(request.getParameter("cep"));		
//		obj.setEndereco(request.getParameter("endereco"));
//		obj.setBairro(request.getParameter("bairro"));
//		obj.setCidade(request.getParameter("cidade"));
//		obj.setUf(request.getParameter("uf"));
//		obj.setProfissao(request.getParameter("profissao"));
//		obj.setEscolaridade(request.getParameter("escolaridade"));
//		obj.setEstadoCivil(request.getParameter("estadoCivil"));
//		obj.setConjuge(request.getParameter("conjuge"));
		
		System.out.println(obj.getCodigo()+" "+obj.getNome()+" "+obj.getNascimento()+" "+obj.getSexo()+" "+obj.getTelefone()+" "+obj.getEmail()
		+" "+obj.getCep()+" "+obj.getEndereco()+" "+obj.getBairro()+" "+obj.getCidade()+" "+obj.getUf()+" "+obj.getProfissao()
		+" "+obj.getEscolaridade()+" "+obj.getEstadoCivil()+" "+obj.getConjuge());
		
		PrintWriter saida = response.getWriter();
		
		int cod = Integer.parseInt(request.getParameter("codigo"));
		
		System.out.println(cod);
		
		boolean sucesso = false;
//		obj.getPainel(cod);
		if(obj.getPainel(cod)!=null) {
			obj.setCodigo(cod);
			if(request.getParameter("apagar")==null) {
				sucesso = obj.atualizar();
			}else {
				sucesso = obj.apagar();
			}
			
		}else {
			sucesso = obj.inserir();
		}
		
		if(sucesso) {
			saida.print("Gravado com sucesso");
		}else {
			saida.print("Erro ao gravar");
		}

	}

}