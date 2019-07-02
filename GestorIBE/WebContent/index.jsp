<!DOCTYPE html>
<%@page import="br.com.ebenezer.gestorIBE.modelo.ConectarJDBC"%>
<html>
<head>
<!-- css do bootstrap -->
 	<link rel="stylesheet" href="css/bootstrap.min.css">
 	<link rel="stylesheet" href="css/estilo.css">
	<meta charset="utf-8">
	<title>GestorIBE - Sistema de cadastro</title>
</head>
<body class="corpo">

	<span>
	<%
	ConectarJDBC conexao = new ConectarJDBC();
	conexao.getConectar();
	conexao.getStatus();
	%>
	</span>
			
	<div class="container">
		<form class="formLogin border border-dark" id="formlogin">
			<img class="imgLogin" alt="logo" src="img/logoIDE.png">
				<div class="d-flex flex-column">
				
					<div class="form-group col-md-12">
						<label for="codigo">Usuário:</label> <input type="text"
							class="form-control" id="usuario"
							placeholder="Usuário" name="usuario">
					</div>
						
					<div class="form-group col-md-12">
						<label for="senha">Senha:</label> <input type="password"
							class="form-control" id="senha"
							placeholder="Senha" name="senha">
					</div>
						
						<a class="btn btn-secondary btnLogin" href="gerenciarPainel.jsp" role="button">LogIn</a>			
				</div>	
			</form>
	</div>	

<!-- Script do bootstrape -->
	<script src="js/jquery-3.3.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>