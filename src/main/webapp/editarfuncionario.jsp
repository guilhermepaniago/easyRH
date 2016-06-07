<%@page import="modelo.Departamento"%>
<%@page import="dao.DepartamenoDAO"%>
<%@page import="dao.FuncionarioDAO"%>
<%@page import="java.util.List"%>
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
    
    <script>
    
  //valida o CPF digitado
    function ValidarCPF(Objcpf){
    	var cpf = Objcpf.value;
    	exp = /\.|\-/g
    	cpf = cpf.toString().replace( exp, "" ); 
    	var digitoDigitado = eval(cpf.charAt(9)+cpf.charAt(10));
    	var soma1=0, soma2=0;
    	var vlr =11;
    	
    	for(i=0;i<9;i++){
    		soma1+=eval(cpf.charAt(i)*(vlr-1));
    		soma2+=eval(cpf.charAt(i)*vlr);
    		vlr--;
    	}	
    	soma1 = (((soma1*10)%11)==10 ? 0:((soma1*10)%11));
    	soma2=(((soma2+(2*soma1))*10)%11);
    	
    	var digitoGerado=(soma1*10)+soma2;
    	if(digitoGerado!=digitoDigitado)	
    		alert('CPF Invalido!');		
    }

    //valida numero inteiro com mascara
    function mascaraInteiro(){
    	if (event.keyCode < 48 || event.keyCode > 57){
    		event.returnValue = false;
    		return false;
    	}
    	return true;
    }
    
  //adiciona mascara ao CPF
    function MascaraCPF(cpf){
    	if(mascaraInteiro(cpf)==false){
    		event.returnValue = false;
    	}	
    	return formataCampo(cpf, '000.000.000-00', event);
    }
  //adiciona mascara ao PIS
    function MascaraPIS(pis){
    	if(mascaraInteiro(pis)==false){
    		event.returnValue = false;
    	}	
    	return formataCampo(pis, '0.000.000.000-0', event);
    }
    
  //formata de forma generica os campos
    function formataCampo(campo, Mascara, evento) { 
    	var boleanoMascara; 
    	
    	var Digitato = evento.keyCode;
    	exp = /\-|\.|\/|\(|\)| /g
    	campoSoNumeros = campo.value.toString().replace( exp, "" ); 
        
    	var i;
    	var posicaoCampo = 0;	 
    	var NovoValorCampo="";
    	var TamanhoMascara = campoSoNumeros.length;; 
    	
    	if (Digitato != 8) { // backspace 
    		for(i=0; i<= TamanhoMascara; i++) { 
    			boleanoMascara  = ((Mascara.charAt(i) == "-") || (Mascara.charAt(i) == ".")
    								|| (Mascara.charAt(i) == "/"));
    			boleanoMascara  = boleanoMascara || ((Mascara.charAt(i) == "(") 
    								|| (Mascara.charAt(i) == ")") || (Mascara.charAt(i) == " ")) 
    			if (boleanoMascara) { 
    				NovoValorCampo += Mascara.charAt(i); 
    				  TamanhoMascara++;
    			}else { 
    				NovoValorCampo += campoSoNumeros.charAt(posicaoCampo); 
    				posicaoCampo++; 
    			  }	   	 
    		  }	 
    		campo.value = NovoValorCampo;
    		  return true; 
    	}else { 
    		return true; 
    	}
    }
  
  
  
    
    </script>

    
</head>
<body background="Imagens/background2.jpg">

   <!-- Tag de Importação do Menu em JSP -->
		  <%@include file='menu.jsp' %>
					<br>					
			
		<div class="container">
            
			<form action = "adicionarFuncionario"  method="get" name="funcionario">	 
					  <input type="hidden" name="acao" value="alterar">	
						<c:forEach items="${funcionarioPopular}" var="func">			
						<div class="row">	
						
								
						           <div class="col-xs-1 col-sm-1 col-md-1">
										<div class="form-group">
											<h4>Matricula</h4>
					                        <input type="text" name="Matricula" id="Matricula" class="form-control input-large" placeholder="Mat." maxlength="4" value = "${func.matricula}" readonly = "true">
										</div>
									</div>
						        
						        
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>CPF</h4>
<%-- 											<input type="text" name="cpf" id="cpf" class="form-control input-large" placeholder="CPF" required="required" maxlength="14" onBlur= "return ValidarCPF(funcionario.cpf)" onKeyPress= "return MascaraCPF(funcionario.cpf)" value = "${func.cpf}" > --%>
											<input type="text" name="cpf" id="cpf" class="form-control input-large" placeholder="CPF" required="required" maxlength="14" value = "${func.cpf}" onBlur= "return ValidarCPF(funcionario.cpf)" onKeyPress= "return MascaraCPF(funcionario.cpf)">
										</div>
									</div>
									
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>PIS</h4>
											<input type="text" name="pis" id="pis" class="form-control input-large" placeholder="PIS" required="required" maxlength="15" value = "${func.pis}" onKeyPress= "return MascaraPIS(funcionario.pis)" >
										</div>
									</div>
									
									<div class="col-xs-2 col-sm-2 col-md-2" >
										<div class="form-group">
											<h4>Departamento</h4>
											<select  name="departamento" class="form-control input-large">
											
											  <option></option>
											  <%
											      
											      List<Departamento> departamentoLista = DepartamenoDAO.listarDepartamento();
											      for(Departamento departamento : departamentoLista){
											  %>
											  <option selected="selected"><%=departamento.getNome() %></option>
											  <% } %>
											
											</select>
											
											
<!-- 											<input type="text" name="departamento" id="departamento" class="form-control input-large" placeholder="Departamento" required="required" maxlength="25"> -->
										</div>
									</div>
									
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>Função</h4>
											<input type="text" name="funcao" id="funcao" class="form-control input-large" placeholder="Função" required="required" maxlength="25" value = "${func.funcao}">
										</div>
									</div>
									
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>Salário R$:</h4>
											<input type="text" name="salario" id="salario" class="form-control input-prepend" placeholder="Salário" required="required" maxlength="10" value = "${func.salario}">
										</div>
									</div>
									
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>Data de Admissão</h4>
											<input type="date" name="d-admissao" id="d-admissao" class="form-control input-large" required="required" value = "${func.dataAdmissao}">
										</div>
									</div>
									
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>Data de Demissão</h4>
											<input type="date" name="d-demissao" id="d-demissao" class="form-control input-large" value = "${func.dataDemissao}">
										</div>
									</div>
									
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>Status</h4>
											<select class="form-control input-large" id="status" name="status" required="required" >
<!-- 											<option></option> -->
											<option value="a" ${func.status == "a" ? "selected='selected'" : ""}>Ativo</option>
											<option value="i" ${func.status == "i" ? "selected='selected'" : ""}>Inativo</option>
											</select>
										</div>
										
									</div>
									
								</div>
								
								
								<h3>Dados Pessoais</h3>
								
								<div class="row">
									<div class="col-xs-3 col-sm-3 col-md-3">
										<div class="form-group">
											<h4>Nome</h4>
					                        <input type="text" name="Nome" id="Nome" class="form-control input-large" placeholder="Nome" required="required" maxlength="20" value = "${func.nome}">
										</div>
									</div>
									<div class="col-xs-3 col-sm-3 col-md-3">
										<div class="form-group">
											<h4>Sobrenome</h4>
											<input type="text" name="Sobrenome" id="Sobrenome" class="form-control input-large" placeholder="Sobrenome" required="required" maxlength="30" value = "${func.sobrenome}">
										</div>
									</div>
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>Data de Nascimento</h4>
											<input type="date" name="nascimento" id="nascimento" class="form-control input-large" required="required"value = "${func.dataNascimento}" >
										</div>
									</div>
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>Sexo</h4>
											<select class="form-control input-large" id="sexo" name="sexo" required="required" >
<!-- 											<option></option> -->
											<option value="f" ${func.sexo == "f" ? "selected='selected'" : ""}>Feminino</option>
											<option value="m" ${func.sexo == "m" ? "selected='selected'" : ""}>Masculino</option>
											</select>
										</div>
									</div>
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>Estado Cívil</h4>
											<select class="form-control input-large" id="ec" name="ec" required="required" >
<!-- 											<option></option> -->
											<option value="s" ${func.estadoCivil == "s" ? "selected='selected'" : ""}>Solteiro</option>
											<option value="c" ${func.estadoCivil == "c" ? "selected='selected'" : ""}>Casado</option>
											</select>
										</div>
									</div>
								
								</div>
								
<!-- 						Inicio do Endereço -->
								
								
								<h3>Endereço</h3>
								<div class="row">
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>Rua</h4>
					                        <input type="text" name="rua" id="rua" class="form-control input-large" placeholder="Rua/Avenida" required="required" maxlength="30" value = "${func.rua}">
										</div>
									</div>
									<div class="col-xs-1 col-sm-1 col-md-1">
										<div class="form-group">
											<h4>Número</h4>
											<input type="text" name="numero" id="numero" class="form-control input-large" placeholder="Nº" required="required" maxlength="5" value = "${func.numero}">
										</div>
									</div>
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>Setor</h4>
					                        <input type="text" name="setor" id="setor" class="form-control input-large" placeholder="Setor" required="required" maxlength="30" value = "${func.setor}" >
										</div>
									</div>
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>CEP</h4>
					                        <input type="text" name="cep" id="cep" class="form-control input-large" placeholder="CEP" required="required" maxlength="8" value = "${func.cep}">
										</div>
									</div>
									<div class="col-xs-2 col-sm-2 col-md-2">
										<div class="form-group">
											<h4>Cidade</h4>
					                        <input type="text" name="cidade" id="cidade" class="form-control input-large" placeholder="Cidade" required="required" maxlength="15" value = "${func.cidade}">
										</div>
									</div>
									<div class="col-xs-1 col-sm-1 col-md-2">
										<div class="form-group">
											<h4>UF</h4>
											<select class="form-control input-large" id="uf" name="uf">
											 <option value="ac" ${func.uf == "ac" ? "selected='selected'" : ""}>AC</option>
											 <option value="al" ${func.uf == "al" ? "selected='selected'" : ""}>AL</option>
											 <option value="ap" ${func.uf == "ap" ? "selected='selected'" : ""}>AP</option>
											 <option value="am" ${func.uf == "am" ? "selected='selected'" : ""}>AM</option>
											 <option value="ba" ${func.uf == "ba" ? "selected='selected'" : ""}>BA</option>
											 <option value="ce" ${func.uf == "ce" ? "selected='selected'" : ""}>CE</option>
											 <option value="df" ${func.uf == "df" ? "selected='selected'" : ""}>DF</option>
											 <option value="es" ${func.uf == "es" ? "selected='selected'" : ""}>ES</option>
											 <option value="go" ${func.uf == "go" ? "selected='selected'" : ""}>GO</option>
											 <option value="ma" ${func.uf == "ma" ? "selected='selected'" : ""}>MA</option>
											 <option value="mt" ${func.uf == "mt" ? "selected='selected'" : ""}>MT</option>
											 <option value="ms" ${func.uf == "ms" ? "selected='selected'" : ""}>MS</option>
											 <option value="mg" ${func.uf == "mg" ? "selected='selected'" : ""}>MG</option>
											 <option value="pa" ${func.uf == "pa" ? "selected='selected'" : ""}>PA</option>
											 <option value="pb" ${func.uf == "pb" ? "selected='selected'" : ""}>PB</option>
											 <option value="pr" ${func.uf == "pr" ? "selected='selected'" : ""}>PR</option>
											 <option value="pe" ${func.uf == "pe" ? "selected='selected'" : ""}>PE</option>
											 <option value="pi" ${func.uf == "pi" ? "selected='selected'" : ""}>PI</option>
											 <option value="rj" ${func.uf == "rj" ? "selected='selected'" : ""}>RJ</option>
											 <option value="rn" ${func.uf == "rn" ? "selected='selected'" : ""}>RN</option>
											 <option value="ro" ${func.uf == "ro" ? "selected='selected'" : ""}>RO</option>
											 <option value="rr" ${func.uf == "rr" ? "selected='selected'" : ""}>RR</option>
											 <option value="sc" ${func.uf == "sc" ? "selected='selected'" : ""}>SC</option>
											 <option value="sp" ${func.uf == "sp" ? "selected='selected'" : ""}>SP</option>
											 <option value="se" ${func.uf == "se" ? "selected='selected'" : ""}>SE</option>
											 <option value="to" ${func.uf == "to" ? "selected='selected'" : ""}>TO</option>
											</select>
										</div>
									</div>
								</div>
								
								
								
								
								   <center>
  									<input class="btn btn-lg btn-danger" type="reset" value="Limpar">
  									<input class="btn btn-lg btn-sucess" type="submit" value="Alterar">
  									
 								   </center> 
								
								
								
								
								</c:forEach>
									
									
  									
	 								
								
					     
								
								
							
							</form>
						<br>
		</div>
					
	  
			
		

</body>


</html>



