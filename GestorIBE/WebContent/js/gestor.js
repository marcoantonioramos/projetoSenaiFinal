//Limpa valor do input Código ao iniciar e atva/desativa botões
function limpaCodigo() {
	document.getElementById("codigo").focus();
	if (document.getElementById("codigo").value == 0) {
		document.getElementById("codigo").value = "";
		document.getElementById("codigo").readOnly = false;
	} else {
		document.getElementById("codigo").readOnly = true;
		document.getElementById("btnAtualizar").disable = true;
	}
	if ((document.getElementById("codigo").value < 0)
			|| (document.getElementById("codigo").value == "")) {
		document.getElementById("btnAtualizar").disabled = "disabled";
		document.getElementById("btnApagar").disabled = "disabled";
	} else {
		document.getElementById("btnGravar").disabled = "disabled";
		document.getElementById("btnAtualizar").disabled = "";
		document.getElementById("btnApagar").disabled = "";
	}
}

// Verifica se código é > 0
function validaCodigo() {
	if (document.getElementById("codigo") <= 0) {
		document.getElementById("codigo").className = "form-control border border-danger";
		document.getElementById("msg").className = "alert alert-danger";
		document.getElementById("msg").innerHTML = "Insira um código válido.";
	} else {
		document.getElementById("codigo").className = "form-control";
		document.getElementById("msg").className = "";
		document.getElementById("msg").innerHTML = "";
	}
}

// Habilita input conjuge
function habilitaConjuge() {
	if ((document.getElementById("estadoCivil").value == "Casado(a)")
			|| (document.getElementById("estadoCivil").value == "União Estável")) {
		document.getElementById("conjuge").disabled = "";
	} else {
		document.getElementById("conjuge").disabled = "disabled";
		document.getElementById("conjuge").value = "";
	}
}

// Captura os dados inseridos no formulário
function dadosForm() {
	var dados = "";
	dados += "codigo=" + document.getElementById("codigo").value;
	dados += "&nome=" + document.getElementById("nome").value;
	dados += "&nascimento=" + document.getElementById("nascimento").value;
	dados += "&sexo=" + document.getElementById("sexo").value;
	dados += "&telefone=" + document.getElementById("telefone").value;
	dados += "&email=" + document.getElementById("email").value;
	dados += "&cep=" + document.getElementById("cep").value;
	dados += "&endereco=" + document.getElementById("rua").value;
	dados += "&bairro=" + document.getElementById("bairro").value;
	dados += "&cidade=" + document.getElementById("cidade").value;
	dados += "&uf=" + document.getElementById("uf").value;
	dados += "&profissao=" + document.getElementById("profissao").value;
	dados += "&escolaridade=" + document.getElementById("escolaridade").value;
	dados += "&estadoCivil=" + document.getElementById("estadoCivil").value;
	dados += "&conjuge=" + document.getElementById("conjuge").value;

	return dados;
}

// Grava registro no BD
function gravar() {

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var msg = xhttp.responseText;
			document.getElementById("msg").innerHTML = msg;
			if (msg == "Gravado com sucesso") {
				document.getElementById("msg").className = "alert alert-info";
			} else {
				document.getElementById("msg").className = "alert alert-danger";
			}
		}
	};
	if (document.getElementById("codigo").value > 0) {
		xhttp.open("POST", "servletPainel?" + dadosForm(), true);
		xhttp.send();
		window.setTimeout('novo()', 1000);
	} else {
		document.getElementById("codigo").className = "form-control border border-danger";
		document.getElementById("msg").className = "alert alert-danger";
		document.getElementById("msg").innerHTML = "Insira um código válido.";
	}
}

// Apaga registro do BD
function apagar() {

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var msg = xhttp.responseText;

			if (msg == "Gravado com sucesso") {
				document.getElementById("msg").className = "alert alert-info";
				document.getElementById("msg").innerHTML = "Informação apagada";
				document.getElementById("formulario").reset();
			} else {
				document.getElementById("msg").className = "alert alert-danger";
				document.getElementById("msg").innerHTML = "Erro ao apagar";
			}
		}
	};
	xhttp.open("POST", "servletPainel?" + dadosForm() + "&apagar", true);
	xhttp.send();
}

// Apaga registro do BD para reinserção e atualização
function apagarAtualizar() {

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var msg = xhttp.responseText;

		}
	};
	xhttp.open("POST", "servletPainel?" + dadosForm() + "&apagar", true);
	xhttp.send();

	window.setTimeout('gravar()', 100);

}

// Limpa formulário para gravar novo registro
function novo() {
	window.location.replace('gerenciarPainel.jsp');
}

// Editar registro
function prepararEditar(codigo) {

	if (codigo != 0) {
		window.location.replace('gerenciarPainel.jsp?codigo=' + codigo);
	}
}

// Habilita DataTables
function dataTables() {
	$(document).ready(function() {
		$('#tabela').DataTable(	{
			"language" : {
				"url" : "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
			}
		});
	});
}

// Insere máscaras nos inputs
function mascaras() {
	$(document).ready(function() {
		$("#nascimento").mask("00/00/0000")
		$("#telefone").mask("(00) 00000-0000")
	})
}
	