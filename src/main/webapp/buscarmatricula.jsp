<%@page import="modelo.Funcionario"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>Editar Funcionário</title>
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
            
            
            <form action = "adicionarFuncionario">
            
              <input type="hidden" name="acao" value="popularFuncionario">
              
                 <div class="col-xs-1 col-sm-1 col-md-1">
					   <div class="form-group">
								<h4>Pesquisar</h4>
					            <input type="text" name="Matricula" id="Matricula" class="form-control input-large" placeholder="Mat." required="required" maxlength="4">
					  </div>
				 </div>
									
			   	<div class="col-xs-1 col-sm-1 col-md-1">
					<div class="form-group">
						<h4>Matrícula</h4>
                     
					      <input type = "submit" class="btn btn-success" value="OK"> 
			
					</div>
				</div>
            
            
            </form>

		</div>

</body>


</html>



