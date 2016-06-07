package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class JpaUtil {
	
	
	private static EntityManagerFactory emf = null;
	
	public static void start() {
		//Obter uma f�brica de EntityManagers.
		//Apenas na inicializa��o.
		emf = Persistence.createEntityManagerFactory("funcionario-pu");
	}
	
	public static EntityManager obterEntityManager() {
		return emf.createEntityManager();
	}
	

}
