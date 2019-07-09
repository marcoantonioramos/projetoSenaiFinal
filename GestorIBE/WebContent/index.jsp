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

	<%
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		String status = "";

		if (request.getParameter("sair") != null) {
			session.setAttribute("login", null);
		}
		
		boolean testeLogin = false;
		if (usuario != null && senha != null) {
			if (usuario.equals("admin") && senha.equals("admin")) {
				session.setAttribute("login", "login-ok");
				response.sendRedirect("gerenciarPainel.jsp");
			} 
		}
	%>

	<div class="container">
		<form method="post" class="formLogin border border-dark" id="formlogin">
			<img class="imgLogin" alt="logo" src="img/logoIDE.png">
			<div class="d-flex flex-column">

				<div class="form-group col-md-12">
					<label for="codigo">Usuário:</label> <input type="text"
						class="form-control" id="usuario" placeholder="Usuário = admin"
						name="usuario">
				</div>

				<div class="form-group col-md-12">
					<label for="senha">Senha:</label> <input type="password"
						class="form-control" id="senha" placeholder="Senha = admin" name="senha">
				</div>
				<div class="statusLogin" id="statusLogin">
				<%
				if (usuario != null && senha != null) {
					if (!usuario.equals("admin") && !senha.equals("admin")) {
						out.print("Usuário ou senha incorretos!!! Tente novamente.");
					} 
				}
				%>
				</div>
				<button type="submit" class="btn btn-secondary btnLogin">Entrar</button>
				<!--<a type="submit" class="btn btn-secondary btnLogin" href="gerenciarPainel.jsp"
					role="button">Clique para entrar</a>-->
			</div>
			<div class="statusDB">
				<%
					ConectarJDBC conexao = new ConectarJDBC();
					conexao.getConectar();
					if (conexao.getStatus() == "Conectado") {
						out.print("<img src='img/dbOK.png'>");
					} else {
						out.print("<img src='img/dbError.png'>");
					}
				%>
			</div>
		</form>
	</div>

	<!-- Script do bootstrape -->
	<script src="js/jquery-3.3.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- Gestor script -->
	<script type="text/javascript" src="js/gestor.js"></script>
</body>
</html>