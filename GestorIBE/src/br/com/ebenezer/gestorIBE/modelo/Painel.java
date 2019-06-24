package br.com.ebenezer.gestorIBE.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Painel {

	private int codigo;
	private String nome;
	private String nascimento;
	private String sexo;
	private String telefone;
	private String email;
	private String cep;
	private String endereco;
	private String bairro;
	private String cidade;
	private String uf;
	private String profissao;
	private String escolaridade;
	private String estadoCivil;
	private String conjuge;

	public Painel() {
		setNome("");
		setNascimento("");
		setSexo("");
		setTelefone("");
		setEmail("");
		setCep("");
		setEndereco("");
		setBairro("");
		setCidade("");
		setUf("");
		setProfissao("");
		setEscolaridade("");
		setEstadoCivil("");
		setConjuge("");

	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNascimento() {
		return nascimento;
	}

	public void setNascimento(String nascimento) {
		this.nascimento = nascimento;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getProfissao() {
		return profissao;
	}

	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}

	public String getEscolaridade() {
		return escolaridade;
	}

	public void setEscolaridade(String escolaridade) {
		this.escolaridade = escolaridade;
	}

	public String getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getConjuge() {
		return conjuge;
	}

	public void setConjuge(String conjuge) {
		this.conjuge = conjuge;
	}

	public boolean apagar() {

		Connection conexao = new ConectarJDBC().getConectar();

		if (conexao != null) {
			String sql = "delete from painel where codigo = ? ";
			try {
				PreparedStatement prepararSQL = conexao.prepareStatement(sql);
				prepararSQL.setInt(1, codigo);
				prepararSQL.execute();
				prepararSQL.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}

		}
		return false;
	}

// copiamos o código inserir pra reaproveitar o codigo e
// fazer o método atualizar
	public boolean atualizar() {

		Connection conexao = new ConectarJDBC().getConectar();

		if (conexao != null) {
			String sql = "update painel set	codigo = ?, nome = ?, nascimento = ?, sexo = ? , telefone = ?, email = ?,"
					+ "	cep = ?, endereco = ?, bairro = ? , cidade = ? , uf = ? , profissao = ?, escolaridade = ?,"
					+ " estado_civil = ?, conjuge = ? where cod = ? ";
		
			try {
				PreparedStatement prepararSQL = conexao.prepareStatement(sql);
				prepararSQL.setInt(1, codigo);
				prepararSQL.setString(2, nome);
				prepararSQL.setString(3, nascimento);
				prepararSQL.setString(4, sexo);
				prepararSQL.setString(5, telefone);
				prepararSQL.setString(6, email);
				prepararSQL.setString(7, cep);
				prepararSQL.setString(8, endereco);
				prepararSQL.setString(9, bairro);
				prepararSQL.setString(10, cidade);
				prepararSQL.setString(11, uf);
				prepararSQL.setString(12, profissao);
				prepararSQL.setString(13, escolaridade);
				prepararSQL.setString(14, estadoCivil);
				prepararSQL.setString(15, conjuge);

				prepararSQL.execute();
				prepararSQL.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}

		}
		return false;
	}

	public boolean inserir() {

		Connection conexao = new ConectarJDBC().getConectar();

		if (conexao != null) {
			String sql = "insert into painel(codigo, nome, nascimento, sexo, telefone, email, cep, endereco,"
					+ "bairro, cidade, uf, profissao, escolaridade, estado_civil, conjuge)"
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
									
			try {
				PreparedStatement prepararSQL = conexao.prepareStatement(sql);
				prepararSQL.setInt(1, codigo);
				prepararSQL.setString(2, nome);
				prepararSQL.setString(3, nascimento);
				prepararSQL.setString(4, sexo);
				prepararSQL.setString(5, telefone);
				prepararSQL.setString(6, email);
				prepararSQL.setString(7, cep);
				prepararSQL.setString(8, endereco);
				prepararSQL.setString(9, bairro);
				prepararSQL.setString(10, cidade);
				prepararSQL.setString(11, uf);
				prepararSQL.setString(12, profissao);
				prepararSQL.setString(13, escolaridade);
				prepararSQL.setString(14, estadoCivil);
				prepararSQL.setString(15, conjuge);

				prepararSQL.execute();
				prepararSQL.close();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}

		}
		return false;
	}

	public List<Painel> getLista() {
		try {
			Connection conexao = new ConectarJDBC().getConectar();
			PreparedStatement ps = conexao.prepareStatement("select * from painel");
			ResultSet rs = ps.executeQuery();

			List<Painel> lsPainel = new ArrayList<Painel>();

			while (rs.next()) {
				Painel p = new Painel();
				// o que esta entre aspas "nome_da_coluna_no_banco"
				p.setCodigo(Integer.parseInt(rs.getString("codigo")));
				p.setNome(rs.getString("nome"));
				p.setNascimento(rs.getString("nascimento"));
				p.setSexo(rs.getString("sexo"));
				p.setTelefone(rs.getString("telefone"));
				p.setEmail(rs.getString("email"));
				p.setCep(rs.getString("cep"));
				p.setEndereco(rs.getString("endereco"));
				p.setBairro(rs.getString("bairro"));
				p.setCidade(rs.getString("cidade"));
				p.setUf(rs.getString("uf"));
				p.setProfissao(rs.getString("profissao"));
				p.setEscolaridade(rs.getString("escolaridade"));
				p.setEstadoCivil(rs.getString("estado_civil"));
				p.setConjuge(rs.getString("conjuge"));
				lsPainel.add(p);
			}
			ps.close();
			conexao.close();
			return lsPainel;
		} catch (Exception e) {

		}
		return null;
	}

	public Painel getPainel(int codigo) {
		try {
			Connection conexao = new ConectarJDBC().getConectar();
			PreparedStatement ps = conexao.prepareStatement("select * from painel where codigo = ? ");
			ps.setInt(1, codigo);
			ResultSet rs = ps.executeQuery();

			Painel p = new Painel();
			while (rs.next()) {
				// o que esta entre aspas "nome_da_coluna_no_banco"
				p.setCodigo(Integer.parseInt(rs.getString("codigo")));
				p.setNome(rs.getString("nome"));
				p.setNascimento(rs.getString("nascimento"));
				p.setSexo(rs.getString("sexo"));
				p.setTelefone(rs.getString("telefone"));
				p.setEmail(rs.getString("email"));
				p.setCep(rs.getString("cep"));
				p.setEndereco(rs.getString("endereco"));
				p.setBairro(rs.getString("bairro"));
				p.setCidade(rs.getString("cidade"));
				p.setUf(rs.getString("uf"));
				p.setProfissao(rs.getString("profissao"));
				p.setEscolaridade(rs.getString("escolaridade"));
				p.setEstadoCivil(rs.getString("estado_civil"));
				p.setConjuge(rs.getString("conjuge"));
			}
			ps.close();
			conexao.close();
			
			if(p.codigo == 0) {
				return null;
			}
			
			return p;
		} catch (Exception e) {

		}
		return null;
	}

}