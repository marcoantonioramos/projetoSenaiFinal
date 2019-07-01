<%@page import="br.com.ebenezer.gestorIBE.modelo.ConectarJDBC"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.ebenezer.gestorIBE.modelo.Painel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>GestorIBE - Sistema de cadastro</title>

<!-- Datatables JS -->

<script src="js/jquery-3.3.1.js"></script>
<script
	src="js/jquery.dataTables.min.js"></script>
<script
	src="js/dataTables.bootstrap4.min.js"></script>

<!-- Datatables CSS -->

<link rel="stylesheet"
	href="css/bootstrap.css">
<link rel="stylesheet"
	href="css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="css/estilo.css">

</head>

<body class="corpo" onload="dataTables()">

	<div class="container-fluid">
		<div class="banner">
			<img class="logo" alt="IBE" src="img/logo.png"><br>
			<nav class="nav justify-content-center">
			<a href="gerenciarPainel.jsp" class="btn btn-info" role="button">Cadastrar</a>
			<a href="painel.jsp" class="btn btn-info" role="button">Pesquisar</a>
			</nav>
			<div class="divLogout">
			<a href="index.html"><img class="imgLogout" src="img/logout.png" alt="logout"></a>
			</div>
		</div>
	</div>
	
	<div class="espaco"></div>
	<div class="container">

		<table id="tabela" class="table table-striped table-bordered"
			style="width: 100%">
			<thead>
				<tr>
					<th width="20%">Código</th>
					<th width="20%">Nome</th>
					<th width="20%">Data de Nascimento</th>
					<th width="20%">Bairro</th>
					<th width="10%">Telefone</th>
					<th width="10%">E-mail</th>
					<th width="0%"></th>
				</tr>
			</thead>
			<tbody>

				<%
				
				
				
					Painel painel = new Painel();
				
					for (Painel p : painel.getLista()) {
						out.print("<tr >");
						out.print("<td>" + p.getCodigo() + "</td>");
						out.print("<td>" + p.getNome() + "</td>");
						out.print("<td id='tdNascimento'>" + p.getNascimento() + "</td>");
						out.print("<td>" + p.getBairro() + "</td>");
						out.print("<td>" + p.getTelefone() + "</td>");
						out.print("<td>" + p.getEmail() + "</td>");
						out.print("<td align='right' onclick='prepararEditar(" + p.getCodigo()
								+ ")'><img src='img/editar.png'></td>");
						out.print("</tr>");
					}
				%>

			</tbody>
		</table>

	</div>
	<!-- Gestor script -->
<script src="js/gestor.js"></script>

</body>
</html>