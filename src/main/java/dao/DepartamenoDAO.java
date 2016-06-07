package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import modelo.Departamento;
import modelo.Funcionario;

public class DepartamenoDAO {

	public static void adicionarDepartamento(Departamento departamento){
		
		EntityManager conectar = JpaUtil.obterEntityManager();
		EntityTransaction iniciarTransacao = conectar.getTransaction();
		
		iniciarTransacao.begin();
		conectar.persist(departamento);
		iniciarTransacao.commit();
		conectar.close();
		
	}
	
	
public static boolean excluirDepartamento(Departamento dep)throws Throwable{

		
		EntityManager conectar = JpaUtil.obterEntityManager();
		EntityTransaction iniciarTransacao = conectar.getTransaction();
		
		Departamento depRemover = conectar.find(Departamento.class, dep.getCodigo());
		
		iniciarTransacao.begin();
		conectar.remove(depRemover);
		iniciarTransacao.commit();
		
		return true;
		
	}
	
	
    public static Long retornarUltimoCodigo(){
		
		EntityManager conectar = JpaUtil.obterEntityManager();

		
		Query q = conectar.createQuery("select max(departamento.codigo) from modelo.Departamento departamento");
	   
		
		return (Long) (q.getParameterValue("codigo"));
		
	}
    
    public static List<Departamento> listarDepartamento(){
    	
    	EntityManager conectar = JpaUtil.obterEntityManager();
    	
    	List<Departamento> departamentos = conectar.createQuery("from modelo.Departamento").getResultList();
    	
    	return departamentos;
    }
}
