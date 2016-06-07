<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>

	<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
	<link rel='stylesheet' type='text/css' href='css/styles.css' />
	<link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/estilos.css" rel="stylesheet"/>

    
</head>


<body >

   
		
		 
		 
		        <div id='cssmenu'>
		 
					<ul>
					   <li><a href='index.jsp'><span>Inicio</span></a></li>
					   
					   <li class='has-sub'><a href='#'><span>Cadastro</span></a>
					      <ul>
					         <li class='has-sub'><a href='#'><span>Funcionário</span></a>
					         <ul>
					               <li><a href='cadfuncionario.jsp'><span>Novo</span></a></li>
					               <li class='last'><a href='buscarmatricula.jsp'><span>Editar</span></a></li>
					         </ul>
					         </li>
					         <li class='has-sub'><a href='#'><span>Departamento</span></a>
					          <ul>
					               <li><a href='caddepartamento.jsp'><span>Novo</span></a></li>
<!-- 					               <li class='last'><a href='#'><span>Editar</span></a></li> -->
					           </ul>
					         </li>
					         <li class='has-sub'><a href='cadusuario.jsp'><span>Usuário</span></a>
					          
					         </li>
					      </ul>
					   </li>
					   
					   <li class='has-sub'><a href='#'><span>Listar</span></a>
					      <ul>
					         <li class='has-sub'><a href='listarfuncionariodep.jsp'><span>Funcionário</span></a></li>
 				        	 <li class='has-sub'><a href='ServletDep?acao=listar'><span>Departamento</span></a></li> 
					      </ul>
					   </li>
					   <li><a href='about.jsp'><span>Sobre</span></a></li>
					   <div class="col-xs-6 col-sm-6 col-md-6"></div>
					   <li class='last'><a href='LoginServlet?acao=sair'><span>Sair</span></a></li>
					</ul>
					
		</div>
	</body>
</html>