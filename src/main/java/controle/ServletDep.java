package controle;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DepartamenoDAO;
import dao.FuncionarioDAO;
import modelo.Departamento;
import modelo.Funcionario;

public class ServletDep extends HttpServlet {
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String acao = request.getParameter("acao");
    	
    	try{
    		
    		if(acao.equals("cadastrar")){
        		
      		 
      		  incluirDepartamento(request, response);
      		  
      		  
      		  
      	}else if(acao.equals("listar")){
      		listardep(request, response);
      		
      	}else if(acao.equals("excluir")){
      		
      		 excluirDepartamento(request, response);
      	}
      	
    		
    		
    	}catch(Throwable erro){
    		
    		erro.printStackTrace();
			response.getOutputStream().print("Erro:" + erro.getMessage() + "");
    		
    		
    	}
    	
    	
     }

    public void incluirDepartamento(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, Throwable{
    	
    	  if(pesquisarFuncionario(request, response)){
    		  
    		  Departamento departamento = new Departamento();
        	  
        	  departamento.setMatriculaaResponsavel(Long.parseLong(request.getParameter("matricula")));
        	  departamento.setNome(request.getParameter("nomedp"));
        	  
        	  DepartamenoDAO.adicionarDepartamento(departamento);	
        	  response.sendRedirect("caddepartamento.jsp");
    		  
    	  }else{
    		  
    		  response.getWriter().print(
		    			
       			      "<script>"
       			    +     "alert('Matricula do funcionário não existe!');"
       			    +	   "window.location = 'caddepartamento.jsp';"
       			    + "</script>");
    	  }
    	
    	 
    	  
    	  
    }
    
    public void excluirDepartamento(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, Throwable{
    	   
    	  Departamento dep = new Departamento();
    	  String codigo = request.getParameter("codigo");
//    	  dep.setCodigo(Long.parseLong(request.getParameter("codigo")));
    	  dep.setCodigo(Long.parseLong(codigo));
    	  
    	if(DepartamenoDAO.excluirDepartamento(dep)){
    		response.getWriter().print(
	    			
  			      "<script>"
  			    +     "alert('Departamento excluido com sucesso!');"
  			    +	   "window.location = 'ServletDep?acao=listar';"
  			    + "</script>");				    	
  		
    		
    	}
    	  
    	
    	
    }
  
    
    public boolean pesquisarFuncionario (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Throwable{
    	
    	
    	String matricula = request.getParameter("matricula");
 	   
		return FuncionarioDAO.verificarMatricula(Long.parseLong(matricula));
    	

    }
    
    public List<Departamento> listardep (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Throwable{
    	
    	List<Departamento> listaDepartamento = DepartamenoDAO.listarDepartamento();
		
		request.setAttribute("listaDepartamento", listaDepartamento);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("listardepartamento.jsp");
		requestDispatcher.forward(request, response);
		return listaDepartamento;
    	
    }
}

    