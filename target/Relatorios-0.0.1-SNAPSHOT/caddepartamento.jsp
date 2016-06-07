<%@page import="dao.FuncionarioDAO"%>
<%@page import="dao.DepartamenoDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>Cadastrar Departamento</title>
<head>

	<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
	<link rel='stylesheet' type='text/css' href='css/styles.css' />
	<link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/estilos.css" rel="stylesheet"/>
    
     <script>
    
  //valida o CPF digitado
    function valmatricula(Objmatricula){
    	var matricula = Objmatricula.value;
    	return matricula;
    }

   
    </script>
    
    
    
</head>

<body background="Imagens/background2.jpg">

   
   
		 
		 
		<!-- Tag de Importação do Menu em JSP -->
		  <%@include file='menu.jsp' %>
					<br>					
			<form action = "ServletDep" method="get" name="departamento">
			<input type="hidden" name="acao" value="cadastrar">		
		<div class="container">

			<div class="row" >
					<div class="col-xs-2 col-sm-2 col-md-3 col-sm-offset-2 col-md-offset-4" >
								<h3>Departamento</h3>
								<br>
<!-- 									  <h4>Código</h4> -->
<!-- 					                        <input type="text" name="codigo" id="codigo" class="form-control input-large" placeholder="Codigo" maxlength="4" readonly ="readonly"> -->
<!-- 										<br> -->
									
										<h4>Nome do Departamento</h4>
											<input type="text" name="nomedp" id="nomedp" class="form-control input-large" placeholder="Nome" required="required" maxlength="20">
										<br>
									
									
										
										<h4>Matricula de Responsável</h4>
											<input type="text" name="matricula" id="matricula" class="form-control input-large" placeholder="Matricula" required="required" maxlength="20" onBlur = "return valmatricula(departamento.matricula)">
										<br>
										
										<h4>Nome Resonsável</h4>
 										    <% String valor = "3";%>
											<input type="text" name="nomeresp" id="nomeresp" class="form-control input-large" placeholder="Nome Responsável" maxlength="20" readonly ="true" value = "<%= FuncionarioDAO.retornarNomeFuncionario(Long.parseLong(valor)) %>">
										<br>
									
									
	 								<br>
	 								<center>
  									 <input class="btn btn-lg btn-danger" type="reset" value="Limpar">
 								     <input type = "submit" class="btn btn-success  btn-lg" value="Salvar">
 								    </center>  
 								    
 					    	</div>
 						
 					   </div>
 				 	
 				 </div>
		</form>
						<br>
						

</body>


</html>



