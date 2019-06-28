<%@page import="br.com.ebenezer.gestorIBE.modelo.Painel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>GestorIBE - Sistema de cadastro</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/estilo.css">

</head>
<body onload="limpaCodigo()">

	<%
		// meu java rolar
		Painel painel = new Painel();
		if (request.getParameter("codigo") != null) {
			int cod = Integer.parseInt(request.getParameter("codigo"));
			painel = painel.getPainel(cod);
		}
	%>


	<div class="container-fluid">
		<div class="banner">
			<img class="logo" alt="IBE" src="img/logo.png"><br> <a
				href="gerenciarPainel.jsp" class="btn btn-info" role="button">Cadastrar</a>
			<a href="painel.jsp" class="btn btn-info" role="button">Pesquisar</a>
		</div>
	</div>

	<div class="container">

		<form class="formulario" id="formulario">

			<div id="msg" class="form-group col-md-12"></div>
			<div class="form-row">
				<div class="form-group col-md-3">
					<label for="codigo">Código:</label> <input type="number"
						class="form-control" id="codigo"
						value="<%out.print(painel.getCodigo());%>"
						placeholder="Insira um código" name="codigo" onkeyup="validaCodigo()">
				</div>

				<div class="form-group col-md-6">
					<label for="nome">Nome:</label> <input type="text"
						class="form-control" id="nome"
						value="<%out.print(painel.getNome());%>"
						placeholder="Nome Completo" name="nome">
				</div>

				<div class="form-group col-md-3">
					<label for="nascimento">Data de Nascimento:</label> <input
						type="date" class="form-control" id="nascimento"
						value="<%out.print(painel.getNascimento());%>"
						placeholder="data de Nascimento" name="nascimento">
				</div>

				<div class="form-group col-md-3">
					<label for="sexo">Sexo:</label> <select class="form-control" name="sexo" placeholder="Escolha uma opção"
						id="sexo">
						<option>Masculino</option>
						<option>Feminino</option>
					</select>

					<script>
					document.getElementById("sexo").value = 
						"<%out.print(painel.getSexo());%>"
					</script>
				</div>

				<div class="form-group col-md-3">
					<label for="telefone">Telefone:</label> <input type="number"
						class="form-control" value="<%out.print(painel.getTelefone());%>"
						id="telefone" name="telefone" placeholder="Insira apenas os números">
				</div>

				<div class="form-group col-md-3">
					<label for="email">E-mail:</label> <input type="email"
						class="form-control" value="<%out.print(painel.getEmail());%>"
						id="email" name="email" placeholder="E-mail">
				</div>

				<div class="form-group col-md-3">
					<label>Cep:</label> <input class="form-control"
						value="<%out.print(painel.getCep());%>" name="cep" type="number"
						id="cep" placeholder="Insira apenas os números"
						onkeyup="pesquisacep(this.value);" />
				</div>

				<div class="form-group col-md-5">
					<label>Endereço:</label> <input class="form-control"
						value="<%out.print(painel.getEndereco());%>" name="rua" placeholder="Rua, Avenida, Alameda ou Praça"
						type="text" id="rua" />
				</div>

				<div class="form-group col-md-3">
					<label>Bairro:</label> <input class="form-control"
						value="<%out.print(painel.getBairro());%>" name="bairro" placeholder="Bairro"
						type="text" id="bairro" />
				</div>

				<div class="form-group col-md-3">
					<label>Cidade:</label> <input class="form-control"
						value="<%out.print(painel.getCidade());%>" name="cidade" placeholder="Cidade"
						type="text" id="cidade" />
				</div>

				<div class="form-group col-md-1">
					<label>Estado:</label> <input class="form-control text-uppercase"
						value="<%out.print(painel.getUf());%>" name="uf" type="text" placeholder="UF"
						id="uf" />
				</div>

				<div class="form-group col-md-3">
					<label for="profissao">Profissão:</label> <input type="text"
						class="form-control" value="<%out.print(painel.getProfissao());%>"
						id="profissao" placeholder="Profissão">
				</div>

				<div class="form-group col-md-3">
					<label for="escolaridade">Escolaridade:</label> <input type="text"
						class="form-control"
						value="<%out.print(painel.getEscolaridade());%>" id="escolaridade"
						placeholder="Escolaridade">
				</div>

				<div class="form-group col-md-3">
					<label for="estadoCivil">Estado Civil:</label> <input type="text"
						class="form-control"
						value="<%out.print(painel.getEstadoCivil());%>" id="estadoCivil"
						placeholder="Estado Civil">
				</div>

				<div class="form-group col-md-3">
					<label for="conjuge">Cônjuge:</label> <input type="text"
						class="form-control" value="<%out.print(painel.getConjuge());%>"
						id="conjuge" placeholder="Cônjuge">
				</div>

			</div>
		
			<button type="button" class="btn btn-primary"  id="btnGravar" onclick="gravar()">Gravar</button>
			<button type="button" class="btn btn-warning" id="btnAtualizar" onclick="apagarAtualizar()">Atualizar</button>
			<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirm" id="btnApagar">Apagar</button>

			<div class="modal fade" id="confirm" role="dialog">
  				<div class="modal-dialog modal-md">
    				<div class="modal-content">
      					<div class="modal-body">
            				<p>Realmente deseja apagar esse registro?!?</p>
      					</div>
      				<div class="modal-footer">
        				<a href="gerenciarPainel.jsp" onclick="apagar();" type="button" class="btn btn-danger" id="delete">Apagar</a>
            			<button type="button" data-dismiss="modal" class="btn btn-default">Cancelar</button>
      			</div>
   		 			</div>
				</div>
			</div>		

		</form>
	</div>
	<!-- Script do bootstrape -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<!-- Gestor script -->
	<script type="text/javascript" src="js/gestor.js"></script>
	<script type="text/javascript" src="js/cep.js"></script>
</body>
</html>