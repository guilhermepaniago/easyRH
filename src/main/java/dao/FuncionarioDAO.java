package dao;



import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
//import javax.persistence.Query;

import java.util.List;

import modelo.Funcionario;

public class FuncionarioDAO {

	public static boolean adcionarFuncionario(Funcionario funcionario) throws Throwable{
		
		
		EntityManager conectar = JpaUtil.obterEntityManager();
		EntityTransaction iniciarTransacao = conectar.getTransaction();
		
		iniciarTransacao.begin();
		conectar.persist(funcionario);
		iniciarTransacao.commit();
		conectar.close();
		
		
		return true;
		
	}
	
	public static boolean alterarFuncionario(Funcionario funcionario){
		
		EntityManager conectar = JpaUtil.obterEntityManager();
		EntityTransaction iniciarTransacao = conectar.getTransaction();
		
		//Caelum 213
		//funcionario = conectar.find(Funcionario.class, 1L);
		
		iniciarTransacao.begin();
		conectar.merge(funcionario);
		iniciarTransacao.commit();
		conectar.close();
		
		
		return true;
		
	}
	
	public static List<Funcionario> listar() throws Throwable {
		
		EntityManager em = JpaUtil.obterEntityManager();
		
		return em.createQuery("from modelo.Funcionario", Funcionario.class).getResultList();
					
	}

	public static boolean verificarMatricula(Long mat) throws Throwable{
		
		
		EntityManager em = JpaUtil.obterEntityManager();
		
		List<Funcionario> funcionario = em.createQuery("from modelo.Funcionario where matricula = " + mat, Funcionario.class).getResultList();
		
		
		    if(funcionario.size() > 0){
		    	
		    	return true;
		    }
		
		    return false;
		
		
	}
	
	public static List<Funcionario> listarFuncionario(Long mat) throws Throwable{
		
        EntityManager em = JpaUtil.obterEntityManager();
		
		List<Funcionario> funcionario = em.createQuery("from modelo.Funcionario where matricula = " + mat, Funcionario.class).getResultList();
		
		return funcionario;
	}
	 
	public static boolean excluirFuncionario(Funcionario funcionario)throws Throwable{

		
		EntityManager conectar = JpaUtil.obterEntityManager();
		EntityTransaction iniciarTransacao = conectar.getTransaction();
		
		Funcionario funcionarioRemover = conectar.find(Funcionario.class, funcionario.getMatricula());
		
		iniciarTransacao.begin();
		conectar.remove(funcionarioRemover);
		iniciarTransacao.commit();
		
		return true;
		
	}
	
	public static int retornarMatricula(){
		
		EntityManager conectar = JpaUtil.obterEntityManager();
		
		int proximaMatricula = conectar.createQuery("select matricula from modelo.Funcionario").getMaxResults();
		
		return proximaMatricula + 1;
		
	}
	
	public static String retornarNomeFuncionario(Long matricula){
		
		EntityManager conectar = JpaUtil.obterEntityManager();
		
		Funcionario funcionarioNome = conectar.find(Funcionario.class, matricula);
		
		return funcionarioNome.getNome()  + " " + funcionarioNome.getSobrenome();
		
	}
}

