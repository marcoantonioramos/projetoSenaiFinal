<%@page import="br.com.ebenezer.gestorIBE.modelo.Painel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>GestorIBE - Sistema de cadastro</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/estilo.css">

</head>
<body>
	<div class="container">
		<div class="banner">
			<img class="logo" alt="IBE" src="img/logo.png"><br>
			
			<a href="gerenciarPainel.jsp" class="btn btn-info" role="button">Gravar</a>
			<a href="painel.jsp" class="btn btn-info" role="button">Pesquisar</a>
			
		</div>
		
	</div>
	<div class="espaco"></div>
	<div class="container">
	<table class="table table-striped">
		<thead>
			<tr>
				<th width="20%">Código</th>
				<th width="20%">Nome</th>
				<th width="10%">Endereço</th>
				<th width="10%">Telefone</th>
				<th width="10%">E-mail</th>
				<th width="10%">Sexo</th>
			</tr>
		</thead>
		<tbody>
		
		<script>
		
		function prepararEditar(codigo){
			//alert("editar "+cod);
			if(codigo!=0){
			window.location.replace('gerenciarPainel.jsp?codigo='+codigo);
			}
		}
		
		</script>
		
			<%
				Painel painel = new Painel();
				for (Painel p : painel.getLista()) {
					out.print("<tr onclick='prepararEditar("+p.getCodigo()+")'>");
					out.print("<td>" + p.getCodigo() + "</td>");
					out.print("<td>" + p.getNome() + "</td>");
					out.print("<td>" + p.getEndereco() + "</td>");
					out.print("<td>" + p.getTelefone() + "</td>");
					out.print("<td>" + p.getEmail() + "</td>");
					out.print("<td>" + p.getSexo() + "</td>");
					out.print("</tr>");
				}
			%>
		</tbody>
	</table>
</div>
<!-- Script do bootstrape -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
</body>
</html>