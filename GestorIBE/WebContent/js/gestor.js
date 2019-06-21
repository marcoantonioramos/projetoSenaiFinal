//Limpa valor do input Código ao iniciar
function limpaCodigo() {
	if(document.getElementById("codigo").value == 0) {
		document.getElementById("codigo").value = "";
	}
}

//Verifica se código é > 0
function validaCodigo() {
	if (document.getElementById("codigo") <= 0) {
		document.getElementById("codigo").className = "form-control border border=danger";
		document.getElementById("msg").className = "alert alert-danger";
		document.getElementById("msg").innerHTML = "Insira um código válido.";
	} else {
		document.getElementById("codigo").className = "form-control";
		document.getElementById("msg").className = "";
		document.getElementById("msg").innerHTML = "";
	}
}

//Captura os dados inseridos no formulário
function dadosForm() {
	var dados = "";
	dados += "codigo=" + document.getElementById("codigo").value;
	dados += "&nome=" + document.getElementById("nome").value;
	/*
	 * dados += "&nascimento="+document.getElementById("nascimento").value;
	 * dados += "&sexo="+document.getElementById("sexo").value; dados +=
	 * "&telefone="+document.getElementById("telefone").value; dados +=
	 * "&email="+document.getElementById("email").value; dados +=
	 * "&cep="+document.getElementById("cep").value; dados +=
	 * "&endereco="+document.getElementById("endereco").value; dados +=
	 * "&bairro="+document.getElementById("bairro").value; dados +=
	 * "&cidade="+document.getElementById("cidade").value; dados +=
	 * "&uf="+document.getElementById("uf").value; dados +=
	 * "&profissao="+document.getElementById("profissao").value; dados +=
	 * "&escolaridade="+document.getElementById("escolaridade").value; dados +=
	 * "&estadoCivil="+document.getElementById("estadoCivil").value; dados +=
	 * "&conjuge="+document.getElementById("conjuge").value;
	 */
	return dados;
}

//Grava registro no BD
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
		xhttp.open("GET", "servletPainel?" + dadosForm(), true);
		xhttp.send();
	} else {
		document.getElementById("codigo").className = "form-control border border-danger"
		document.getElementById("msg").className = "alert alert-danger";
		document.getElementById("msg").innerHTML = "Insira um código válido.";
	}
}

//Apaga registro do BD
function apagar() {
	if (confirm("Realmente deseja apagar esse registro??")) {
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
		xhttp.open("GET", "servletPainel?" + dadosForm() + "&apagar", true);
		xhttp.send();
	}
}

//Limpa inputs e prepara formulário para nova inserção
function novo() {
	window.location.replace('gerenciarPainel.jsp');
}

//Editar registro
function prepararEditar(codigo) {

	if (codigo != 0) {
		window.location.replace('gerenciarPainel.jsp?codigo=' + codigo);
	}
}
