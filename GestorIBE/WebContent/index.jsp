<!DOCTYPE html>
<%@page import="br.com.ebenezer.gestorIBE.modelo.ConectarJDBC"%>
<html>
<head>
<!-- css do bootstrap -->
 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 	<link rel="stylesheet" href="css/estilo.css">
	<meta charset="utf-8">
	<title>GestorIBE - Sistema de cadastro</title>
</head>
<body class="corpo">
	<div class="container">
		<form class="formLogin border border-dark" id="formlogin">
			<img class="imgLogin" alt="logo" src="img/logoIDE.png">
				<div class="d-flex flex-column">
				
					<div class="form-group col-md-12">
						<label for="codigo">Usu�rio:</label> <input type="text"
							class="form-control" id="usuario"
							placeholder="Usu�rio" name="usuario">
					</div>
						
					<div class="form-group col-md-12	">
						<label for="senha">Senha:</label> <input type="password"
							class="form-control" id="senha"
							placeholder="Senha" name="senha">
					</div>
						
						<a class="btn btn-secondary btnLogin" href="gerenciarPainel.jsp" role="button">LogIn</a>			
				</div>
				
				<div class="statusDB">
				<%
				ConectarJDBC conexao = new ConectarJDBC();
				conexao.getConectar();
				if(conexao.getStatus()=="Conectado"){
				out.print("<img src='img/dbOK.png'>");	
				} else {
				out.print("<img src='img/dbError.png'>");
				}
				%>
				</div>
						
			</form>
	</div>	

<!-- Script do bootstrape -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>