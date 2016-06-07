package dao;

import modelo.Funcionario;
import modelo.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Query;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;


public class UsuarioDAO {
	
    public static boolean incluirUsuario(Usuario usuario) throws Throwable {
        
        EntityManager conectar = JpaUtil.obterEntityManager();
        EntityTransaction iniciarTransacao = conectar.getTransaction();
		
        iniciarTransacao.begin();
        conectar.persist(usuario);
        iniciarTransacao.commit();
        conectar.close();
	
        return true;
    }
    
    public static void excluirUsuario(Usuario usuario) throws Throwable {
        EntityManager conectar = JpaUtil.obterEntityManager();
        EntityTransaction iniciarTransacao = conectar.getTransaction();

        Usuario usuarioRemover = conectar.find(Usuario.class, usuario.getLogin());

        iniciarTransacao.begin();
        conectar.remove(usuarioRemover);
        iniciarTransacao.commit();
    }
    
//    public static boolean loginUsuario(Usuario usuario) throws Throwable {
//        
//        EntityManager conectar = JpaUtil.obterEntityManager();
//        EntityTransaction iniciarTransacao = conectar.getTransaction();
//
//        Usuario usuarioExistente = conectar.find(Usuario.class, usuario.getLogin());
//        
//        if(usuarioExistente.getNome().equals(usuario.getNome())) {
//            return true;
//        } else {
//            return false;
//        }
//    }
    
   public static boolean verificarLogin(Usuario usuario) throws Throwable{
		
		
		EntityManager em = JpaUtil.obterEntityManager();
		
		List<Usuario> usuarioLogin = em.createQuery("from modelo.Usuario where login = '" + usuario.getLogin() + "'" + "and senha = '" + usuario.getSenha() + "'", Usuario.class).getResultList();
		
		
		    if(usuarioLogin.size() > 0){
		    	
		    	return true;
		    }
		
		    return false;
		
		
	}
}
