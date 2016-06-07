<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>Cadastrar Usuário</title>
<head>

	<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
	<link rel='stylesheet' type='text/css' href='css/styles.css' />
	<link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/estilos.css" rel="stylesheet"/>

    
</head>

<body background="Imagens/background2.jpg">

		<!-- Tag de Importação do Menu em JSP -->
		  <%@include file='menu.jsp' %>
					<br>					
					
		<div class="container">

					<div class="row" >
					
					<div class="col-xs-2 col-sm-2 col-md-3 col-sm-offset-2 col-md-offset-4" >
					<form method="get" action="LoginServlet">
					<input type="hidden" name="acao" value="cadastrar">		
								<h3>Departamento</h3>
								
											<h4>Login:</h4>
					                        <input type="text" name="user" id="user" class="form-control input-large" placeholder="Login" maxlength="25">
										<br>

											<h4>Matrícula:</h4>
											<input type="text" name="mat" id="mat" class="form-control input-large" placeholder="Matrícula" maxlength="4">
										<br>
										<h4>Nome:</h4>
										<div class="form-control well well-small input-large" ">
										<b>Nome do Usuário</b>
										</div>
										<br>
									
										
											<h4>Senha:</h4>
											<input type="password" name="senha" id="senha" class="form-control input-large" placeholder="Senha" required="required" maxlength="20">
										<br>
									
									
	 								<br>
	 								<center>
  									<input class="btn btn-lg btn-danger" type="reset" value="Limpar">
 								   	<input type="submit" class="btn btn-success  btn-lg" value="Salvar">
 								   </center>  
							</form>
						<br>
						</div>
					</div>
					
	  </div>
	 
			
		

</body>


</html>



