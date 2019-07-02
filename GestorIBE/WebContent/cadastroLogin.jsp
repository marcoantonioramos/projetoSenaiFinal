<%@page import="br.com.ebenezer.gestorIBE.modelo.ConectarJDBC"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>GestorIBE - Sistema de cadastro</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/estilo.css">
</head>
<body class="corpo">

	<div class="container-fluid">
		<div class="banner">
			<img class="logo" alt="IBE" src="img/logo.png"><br> 
			<nav class="nav justify-content-center">
			<a href="gerenciarPainel.jsp" class="btn btn-info" role="button">Cadastrar</a>
			<a href="painel.jsp" class="btn btn-info" role="button">Pesquisar</a>
		
				<div class="btn-group">
	  				<button type="button" class="btnOpcoes btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Opções</button>
	  				<div class="dropdown-menu">
	    				<a class="dropdown-item" href="cadastroLogin.jsp">Cadastrar usuário</a>
	    				<a class="dropdown-item" href="index.jsp">Sair</a>
	   				</div>
	   			</div>	
			</nav>
			<div class="divLogout">
			<a href="index.jsp"><img class="imgLogout" src="img/logout.png" alt="logout"></a>
			</div>		
		</div>
	</div>

	<div class="container">

		<form class="formCadastro" id="formuCadastro">

			<div id="msg" class="form-group col-md-12"></div>

			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="usuario">Usuário:</label> <input type="text"
						class="form-control" id="codigo"
						placeholder="Insira um usuário" name="usuario">
				</div>

				<div class="form-group col-md-12">
					<label for="senha">Nome:</label> <input type="password"
						class="form-control" id="senha"
						placeholder="Insira uma senha" name="senha">
				</div>
				
				<div align="right"	>
					<div class="btn-group">
						<button type="button" class="btn btn-primary" id="btnGravar"
							onclick="gravar()">Gravar</button>
						<button type="button" class="btn btn-warning" id="btnAtualizar"
							onclick="apagarAtualizar()">Atualizar</button>
						<button type="button" class="btn btn-danger" data-toggle="modal"
							data-target="#confirm" id="btnApagar">Apagar</button>
					</div>
				</div>
				<div class="modal fade" id="confirm" role="dialog">
					<div class="modal-dialog modal-md">
						<div class="modal-content">
							<div class="modal-body">
								<p>Realmente deseja apagar esse registro?!?</p>
							</div>
							<div class="modal-footer">
								<a href="gerenciarPainel.jsp" onclick="apagar();" type="button"
									class="btn btn-danger" id="delete">Apagar</a>
								<button type="button" data-dismiss="modal"
									class="btn btn-default">Cancelar</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- Script do bootstrape -->
	<script src="js/jquery-3.3.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- Script JMask -->
	<script type="text/javascript" src="js/jquery.mask.js"></script>
	<!-- Gestor script -->
	<script type="text/javascript" src="js/gestor.js"></script>
	<script type="text/javascript" src="js/cep.js"></script>
</body>
</html>