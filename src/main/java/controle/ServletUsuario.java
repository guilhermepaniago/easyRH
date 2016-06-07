package controle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsuarioDAO;
import modelo.Usuario;

public class ServletUsuario extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		   try {
			   
			incluirUsuario(request, response);
			
			
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 
	}
    
	public void incluirUsuario (HttpServletRequest request, HttpServletResponse response) throws Throwable{
		
		 Usuario usuario = new Usuario();
		 
		 if(compararSenha(request, response)){
			 
			 usuario.setLogin(request.getParameter("login"));
			 usuario.setSenha(request.getParameter("senha"));
			 
			 if(UsuarioDAO.incluirUsuario(usuario)){
				 
				 response.getWriter().print(
			    			
		  			      "<script>"
		  			    +     "alert('Usuário cadastro com sucesso!');"
		  			    +	   "window.location = 'cadusuario.jsp';"
		  			    + "</script>");
				    
			 }
			 
		 }
		 
		 
		
		
		
	}
	
	private boolean compararSenha(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		if(request.getParameter("senha").equals(request.getParameter("senhaconf"))){
			
			return true;
			
		}else{
			
			response.getWriter().print(
	    			
  			      "<script>"
  			    +     "alert('Senha difirente, por digite a senha novamente!');"
  			    +	   "window.location = 'cadusuario.jsp';"
  			    + "</script>");
			
			return false;
			
		}
			 
		
		
	}
	

}
