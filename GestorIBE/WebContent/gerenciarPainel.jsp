<%@page import="br.com.ebenezer.gestorIBE.modelo.Painel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gerenciar Painel</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/estilo.css">

</head>
<body>
	<script type="text/javascript">
	
	function dadosForm() {
		var dados = "";
		dados += "codigo="+document.getElementById("codigo").value;
		dados += "&nome="+document.getElementById("nome").value;
		dados += "&nascimento="+document.getElementById("nascimento").value;		
		//dados += "&sexo="+document.getElementById("sexo").value;
		dados += "&telefone="+document.getElementById("telefone").value;
		dados += "&email="+document.getElementById("email").value;
		dados += "&cep="+document.getElementById("cep").value;
		dados += "&endereco="+document.getElementById("endereco").value;
		dados += "&bairro="+document.getElementById("bairro").value;
		dados += "&cidade="+document.getElementById("cidade").value;
		dados += "&uf="+document.getElementById("uf").value;
		dados += "&profissao="+document.getElementById("profissao").value;
		dados += "&escolaridade="+document.getElementById("escolaridade").value;
		dados += "&estadoCivil="+document.getElementById("estadoCivil").value;
		dados += "&conjuge="+document.getElementById("conjuge").value;
		dados += "&cod="+document.getElementById("cod").value;
		return dados;
	}
		function gravar() {
									
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			       var msg = xhttp.responseText;
			       document.getElementById("msg").innerHTML = msg;
			       if(msg == "Gravado com sucesso"){
			    	   document.getElementById("msg").className = "alert alert-info";
			       }else{
			    	   document.getElementById("msg").className = "alert alert-danger";
			       }
			    }
			};
			xhttp.open("GET", "servletPainel?"+dadosForm(), true);
			xhttp.send();
			
		}
		
		function apagar(){
			if(confirm("Realmente deseja apagar esse registro??")){
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			       var msg = xhttp.responseText;
			       
			       if(msg == "Gravado com sucesso"){
			    	   document.getElementById("msg").className = "alert alert-info";
			    	   document.getElementById("msg").innerHTML = "Informação apagada";
			    	   document.getElementById("formulario").reset();
			       }else{
			    	   document.getElementById("msg").className = "alert alert-danger";
			    	   document.getElementById("msg").innerHTML = "Erro ao apagar";
			       }
			    }
			};
			xhttp.open("GET", "servletPainel?"+dadosForm()+"&apagar", true);
			xhttp.send();
			}
		}
		
		
		function novo(){
			window.location.replace('gerenciarPainel.jsp');
		}
	</script>


	<%
		// meu java rolar
		Painel painel = new Painel();

		if (request.getParameter("cod") != null) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			painel = painel.getPainel(cod);
		}
	%>


	<div class="container">
		<div class="banner">
			<img class="logo" alt="IBE" src="img/logo.png"><br>
			
			<a href="gerenciarPainel.jsp" class="btn btn-info" role="button">Gravar</a>
			<a href="painel.jsp" class="btn btn-info" role="button">Pesquisar</a>
			
		</div>
		
	</div>

	<div class="container">
		
		<form class="formulario" id="formulario">
			<input type="hidden" value="<%out.print(painel.getCod());%>" id="cod" />
			<div id="msg"></div>
			<div class="form-row">
			<div class="form-group col-md-3">
					<label for="codigo">Código:</label> <input type="number"
						class="form-control" id="codigo"
						value="<%out.print(painel.getCodigo());%>"
						placeholder="Código" name="codigo">
				</div>
				<div class="form-group col-md-6">
					<label for="nome">Nome:</label> <input type="text"
						class="form-control" id="nome"
						value="<%out.print(painel.getNome());%>"
						placeholder="Nome Completo" name="nome">
				</div>
				
				<div class="form-group col-md-3">
					<label for="nascimento">Data de Nascimento:</label> <input type="date"
						class="form-control" id="nascimento"
						value="<%out.print(painel.getNascimento());%>"
						placeholder="data de Nascimento" name="nascimento">
				</div>

				<div class="form-group col-md-3">
					<label for="sexo">Sexo:</label> <select class="form-control"
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
					<label for="telefone">Telefone:</label> <input type="text"
						class="form-control" value="<%out.print(painel.getTelefone());%>"
						id="telefone" placeholder="telefone">
				</div>
			

		
				<div class="form-group col-md-3">
					<label for="email">E-mail:</label> <input type="text"
						class="form-control"
						value="<%out.print(painel.getEmail());%>" id="email" placeholder="E-mail">
				</div>
				<div class="form-group col-md-3">
					<label for="cep">CEP:</label> <input type="text"
						class="form-control"
						value="<%out.print(painel.getCep());%>" id="cep" placeholder="CEP">
				</div>
				<div class="form-group col-md-3">
					<label for="endereco">Endereço:</label> <input type="text"
						class="form-control"
						value="<%out.print(painel.getEndereco());%>" id="endereco" placeholder="Endereço">
				</div>
				<div class="form-group col-md-3">
					<label for="bairro">Bairro:</label> <input type="text"
						class="form-control"
						value="<%out.print(painel.getBairro());%>" id="bairro" placeholder="Bairro">
				</div>
				<div class="form-group col-md-3">
					<label for="cidade">Cidade:</label> <input type="text"
						class="form-control"
						value="<%out.print(painel.getCidade());%>" id="cidade" placeholder="Cidade">
				</div>
				<div class="form-group col-md-3">
					<label for="uf">UF:</label> <input type="text"
						class="form-control"
						value="<%out.print(painel.getUf());%>" id="uf" placeholder="UF">
				</div>
				<div class="form-group col-md-3">
					<label for="profissao">Profissão:</label> <input type="text"
						class="form-control"
						value="<%out.print(painel.getProfissao());%>" id="profissao" placeholder="Profissão">
				</div>
				<div class="form-group col-md-3">
					<label for="escolaridade">Escolaridade:</label> <input type="text"
						class="form-control"
						value="<%out.print(painel.getEscolaridade());%>" id="escolaridade" placeholder="Escolaridade">
				</div>
				<div class="form-group col-md-3">
					<label for="estadoCivil">Estado Civil:</label> <input type="text"
						class="form-control"
						value="<%out.print(painel.getEstadoCivil());%>" id="estadoCivil" placeholder="Estado Civil">
				</div>
				<div class="form-group col-md-3">
					<label for="conjuge">Cônjuge:</label> <input type="text"
						class="form-control"
						value="<%out.print(painel.getConjuge());%>" id="conjuge" placeholder="Cônjuge">
				</div>
		</div>
			<button type="button" class="btn btn-secondary" onclick="novo()">Novo</button>
			<button type="button" class="btn btn-primary" onclick="gravar()">Gravar</button>
			<button type="button" class="btn btn-danger" onclick="apagar()">Apagar</button>
		</form>
	</div>
	<!-- Script do bootstrape -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>