package modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Departamento {
	
	@Id
	@GeneratedValue
	private Long codigo;
	
	private String nome;
	
	private Long matriculaaResponsavel;
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Long getMatriculaaResponsavel() {
		return matriculaaResponsavel;
	}
	public void setMatriculaaResponsavel(Long matriculaaResponsavel) {
		this.matriculaaResponsavel = matriculaaResponsavel;
	}
	public Long getCodigo() {
		return codigo;
	}
	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}
	

}
