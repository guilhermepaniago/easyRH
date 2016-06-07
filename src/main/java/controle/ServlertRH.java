package controle;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FuncionarioDAO;
import modelo.Funcionario;

public class ServlertRH extends HttpServlet {
  
	private String encodeRedirectUrl;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		     
		    
		  String acao = request.getParameter("acao");
  
		  try {
			  
		          if(acao.equals("cadastrar")){
		        	  
		        	  
		        	  if(pesquisarFuncionario(request, response)){
				    		
				    		response.getWriter().print(
					    			
				    			      "<script>"
				    			    +     "alert('Matricula já esta cadastrada!');"
				    			    +	   "window.location = 'cadfuncionario.jsp';"
				    			    + "</script>");				    	
				    		
				    	}else{
				    		
				    		incluirFuncionario(request, response);
				    		
				    	}
		        	  
		        	  
		          }else if(acao.equals("alterar")){
		        	  
		        	  alterarFuncionario(request, response);
		        	  
		        	  response.getWriter().print(
				    			
		    			      "<script>"
		    			    +     "alert('Funcionario editado com sucesso');"
		    			    +	   "window.location = 'editarfuncionario.jsp';"
		    			    + "</script>");
		        	  
		        	  
		          }else if(acao.equals("excluir")){
		        	  
		        	     if(pesquisarFuncionario(request, response)){
		        	    	 
		        	    	   excluirFuncionario(request, response);
		        	    	   	        	    	 
		        	     }
		        	  
		        	  
		        	  
		          }else if(acao.equals("listar")){
		        	  
		        	      listar(request, response);
		        	  
		          }else if(acao.equals("popularFuncionario")){
		        	  
		        	      popularFuncionario(request, response);
		        	  
		          }else if(acao.equals("listarUnicoFuncionario")){
		        	  
		        	      listarUnicoFuncionario(request, response);
		          }
		          
		
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      
		
		
		
	}
	
	//Método responsável por incluir um novo funcionário.
	public void incluirFuncionario (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Throwable{
		
		Funcionario funcionario = new Funcionario();
		
		funcionario.setMatricula(Long.parseLong(request.getParameter("Matricula")));
		funcionario.setCpf(request.getParameter("cpf"));
		funcionario.setPis(request.getParameter("pis"));
		funcionario.setDepartamento(request.getParameter("departamento"));
		funcionario.setFuncao(request.getParameter("funcao"));
		funcionario.setSalario(request.getParameter("salario"));
		funcionario.setDataAdmissao(request.getParameter("d-admissao"));
		funcionario.setDataDemissao(request.getParameter("d-demissao"));
		funcionario.setStatus(request.getParameter("status"));
		funcionario.setNome(request.getParameter("Nome"));
		funcionario.setSobrenome(request.getParameter("Sobrenome"));
		funcionario.setDataNascimento(request.getParameter("nascimento"));
	    funcionario.setSexo(request.getParameter("sexo"));
	    funcionario.setEstadoCivil(request.getParameter("ec"));
	    funcionario.setRua(request.getParameter("rua"));
	    funcionario.setNumero(request.getParameter("numero"));
	    funcionario.setSetor(request.getParameter("setor"));
	    funcionario.setCep(request.getParameter("cep"));
	    funcionario.setCidade(request.getParameter("cidade"));
	    funcionario.setUf(request.getParameter("uf"));
	    
	    
	    
	    FuncionarioDAO.adcionarFuncionario(funcionario);
	    
		response.sendRedirect("adicionarFuncionario?acao=listar");
	}
	
	//Método responsável por alterar um determinado funcionário.
	public void alterarFuncionario (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Throwable{
		
        Funcionario funcionario = new Funcionario();
		
		funcionario.setMatricula(Long.parseLong(request.getParameter("Matricula")));
		funcionario.setCpf(request.getParameter("cpf"));
		funcionario.setPis(request.getParameter("pis"));
		funcionario.setDepartamento(request.getParameter("departamento"));
		funcionario.setFuncao(request.getParameter("funcao"));
		funcionario.setSalario(request.getParameter("salario"));
		funcionario.setDataAdmissao(request.getParameter("d-admissao"));
		funcionario.setDataDemissao(request.getParameter("d-demissao"));
		funcionario.setStatus(request.getParameter("status"));
		funcionario.setNome(request.getParameter("Nome"));
		funcionario.setSobrenome(request.getParameter("Sobrenome"));
		funcionario.setDataNascimento(request.getParameter("nascimento"));
	    funcionario.setSexo(request.getParameter("sexo"));
	    funcionario.setEstadoCivil(request.getParameter("ec"));
	    funcionario.setRua(request.getParameter("rua"));
	    funcionario.setNumero(request.getParameter("numero"));
	    funcionario.setSetor(request.getParameter("setor"));
	    funcionario.setCep(request.getParameter("cep"));
	    funcionario.setCidade(request.getParameter("cidade"));
	    funcionario.setUf(request.getParameter("uf"));
	    
	    
	    
	    FuncionarioDAO.alterarFuncionario(funcionario);
	    
		
		
		
	}
	
	//Método responsável por excluir um determinado funcionario.
	public void excluirFuncionario (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Throwable{
		 
		  Funcionario funcionario = new Funcionario();
		  
		  funcionario.setMatricula(Long.parseLong(request.getParameter("Matricula")));
		  
		  if(FuncionarioDAO.excluirFuncionario(funcionario)){
				response.getWriter().print(
		    			
		  			      "<script>"
		  			    +     "alert('Funcionário excluido com sucesso!');"
		  			    +	   "window.location = 'adicionarFuncionario?acao=listar';"
		  			    + "</script>");	
		  }
		  
	}
	
	//Método responsável por verificar se um funcionário ja existe.
	public boolean pesquisarFuncionario (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Throwable{
		
	    
	    String matricula = request.getParameter("Matricula");
	   
		return FuncionarioDAO.verificarMatricula(Long.parseLong(matricula));
		
		
	}
	
	//Método responsável por popular os campos do editar funcionário.
	public void popularFuncionario (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Throwable{
		
		Long matricula = Long.parseLong(request.getParameter("Matricula"));
		
		List<Funcionario> funcionarioPopular = FuncionarioDAO.listarFuncionario(matricula);
		
		request.setAttribute("funcionarioPopular", funcionarioPopular);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("editarfuncionario.jsp");
		requestDispatcher.forward(request, response);
		
	}
	
	//Método responsável por listar um único funcionário.
	public void listarUnicoFuncionario(HttpServletRequest req, HttpServletResponse resp)throws Throwable {
		
        List<Funcionario> listaFuncionario = FuncionarioDAO.listarFuncionario(Long.parseLong(req.getParameter("Matricula")));
		
		req.setAttribute("listaFuncionario", listaFuncionario);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("listarfuncionariodep.jsp");
		requestDispatcher.forward(req, resp);
		
	}
	
	//Método responsável por listar todos os funcionários.
	public void listar(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		List<Funcionario> listaFuncionario = FuncionarioDAO.listar();

		req.setAttribute("listaFuncionario", listaFuncionario);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("listarfuncionariodep.jsp");
		requestDispatcher.forward(req, resp);
		
		
	}
	
	
}
