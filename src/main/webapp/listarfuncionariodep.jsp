<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>Listar Funcionário</title>
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
	<link rel='stylesheet' type='text/css' href='css/styles.css' />
	<link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/estilos.css" rel="stylesheet"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script src="js/jquery.tablesorter.min.js"></script>
    <script src="js/jquery.tablesorter.pager.js"></script>
  	<link rel="stylesheet" href="css/custon.css" media="screen" /> 
    
    
    <script>
    
    function desabilitaenter(caracter,valor) {  
    	   if(document.all) { // Internet Explorer  
    	     var tecla = event.keyCode;  
    	   }  
    	   else {  
    	     if(document.layers) { // Nestcape  
    	       var tecla = caracter.which;  
    	     }  
    	   }  
    	   if (tecla == 13 && valor.indexOf(".") > -1) {  //enter  
    	        return false;  
    	    } else{  
    	        return true;  
    	    }  
    	}  
    
    
    
    </script>
    
    

</head>



<body background="Imagens/background2.jpg">

   
		<!-- Tag de Importação do Menu em JSP -->
		  <%@include file='menu.jsp' %>
					<br>
					
			<div class="container" >
			
<!-- 			    <form action = "adicionarFuncionario"> -->
<!-- 			        <input type="hidden" name="acao" value="listarUnicoFuncionario"> -->
<!-- 			         <div class="row" style=" height: 100;"> -->
									
						     
<!-- 							<h4><b>Matrícula</b></h4> -->
<!-- 							<div class="col-xs-1 col-sm-1 col-md-1" > -->
										 
<!-- 					            <input type="text" name="Matricula" id="Matricula" class="form-control input-xlarge" placeholder="Mat." maxlength="4" required="required" onclick= "return desabilitaenter(event,this.value);"> -->
										
<!-- 							</div> -->
									
<!-- 						     <div class="col-xs-1 col-sm-1 col-md-1"> -->
						     
<!-- 						          <input type ="submit" class="btn btn-info" value = "Buscar"> -->
										
										
<!-- 							 </div> 	 -->
									
<!-- 				     	</div> -->
			    
<!-- 			    </form> -->
			
			    
							
					
					
					<div class="row" style=" background-image: url('Imagens/Back-tab.png');">
					    
					    <br>
					   	<div class="col-xs-3 col-sm-3 col-md-3" ></div>
					   	<div class="col-xs-1 col-sm-1 col-md-1" >
					   	<h4>Pesquisar:</h4>
					   	</div>
					   	<div class="col-xs-3 col-sm-3 col-md-3" >
					   	
					    <form method="post" action="listarfuncionariodep.jsp" id="frm-filtro">
					      
					        
					        <input type="text" class="form-control input-xlarge" id="pesquisar" name="pesquisar" size="30" />
					      
					    </form>
					    
					    </div>

					    <hr>
					    <table class="table table-striped custab">
					    <thead>
					        <tr>
					            <th align="center">Mat</th>
					            <th>Nome</th>
					            <th>CPF</th>
					            <th>Dep</th>
					            <th>Função</th>
					            <th>Salário</th>
					            <th align="center">Excluir</th>
					        </tr>
					    </thead>

					   <c:forEach items="${listaFuncionario}" var="funcionario">
			               <tr style="height: auto;">
				                <td align="center">${funcionario.matricula}</td>
				                <td>${funcionario.nome} ${funcionario.sobrenome}</td>
				                <td>${funcionario.cpf}</td>
				                <td>${funcionario.departamento}</td>
				                <td>${funcionario.funcao}</td>
				                <td>R$ ${funcionario.salario},00</td>
				                <td align="center"><a class="btn btn-sm btn-danger" href="adicionarFuncionario?acao=excluir&Matricula=${funcionario.matricula}"><span class="glyphicon glyphicon-remove"></span></a></td>
				            
			           </tr>
		              </c:forEach>
					 
					   </table>
							
								<div class="container" >
								<div id="pager" class="pager" align="center">
									<form>
										
									
									Exibir <select class="pagesize">
											<option selected="selected" value="5">5</option>
											<option  value="10">10</option>
											<option value="20">20</option>
											<option value="30">30</option>
											<option  value="40">40</option>
											
											
									</select> registros
								<img src="Imagens/first.png" class="first"/>
							    		<img src="Imagens/prev.png" class="prev"/>
							    		<input type="text" class="pagedisplay"/>
							    		<img src="Imagens/next.png" class="next"/>
							    		<img src="Imagens/last.png" class="last"/>
									
									
											
							    	</form>
								</div>	    
						</div>
						
						<br>	    
					    <hr style="color: blue;">
					    <div class="col-xs-4 col-sm-4 col-md-4" ></div>
						<a href="index.jsp" class="btn btn-primary">Voltar</a>
						<a href="adicionarFuncionario?acao=listar" class="btn btn-info">Listar <span class="glyphicon glyphicon-list"></span></a>
						<a href="relatorioFuncionario" target="_blank" class="btn btn-warning">Gerar Relatório <span class="glyphicon glyphicon-list-alt"></span></a>
						
						
						
						<br><br>
						</div>
					    
					    
					    
					    
					
				</div>
							
							 
						   
		      
	
	<script>
    $(function(){
      
      $('table > tbody > tr:odd').addClass('odd');
      
      $('table > tbody > tr').hover(function(){
        $(this).toggleClass('hover');
      });
      
      $('#marcar-todos').click(function(){
        $('table > tbody > tr > td > :checkbox')
          .attr('checked', $(this).is(':checked'))
          .trigger('change');
      });
      
      $('table > tbody > tr > td > :checkbox').bind('click change', function(){
        var tr = $(this).parent().parent();
        if($(this).is(':checked')) $(tr).addClass('selected');
        else $(tr).removeClass('selected');
      });
      
      $('form').submit(function(e){ e.preventDefault(); });
      
      $('#pesquisar').keydown(function(){
        var encontrou = false;
        var termo = $(this).val().toLowerCase();
        $('table > tbody > tr').each(function(){
          $(this).find('td').each(function(){
            if($(this).text().toLowerCase().indexOf(termo) > -1) encontrou = true;
          });
          if(!encontrou) $(this).hide();
          else $(this).show();
          encontrou = false;
        });
      });
      
      $("table") 
        .tablesorter({
          dateFormat: 'uk',
          headers: {
            2: {
              sorter: false
            },
            6: {
              sorter: false
            }
          }
        }) 
        .tablesorterPager({container: $("#pager")})
        .bind('sortEnd', function(){
          $('table > tbody > tr').removeClass('odd');
          $('table > tbody > tr:odd').addClass('odd');
        });
      
    });
    </script>	      
       </div>
					

</body>
</html>



