<html lang="en">
  <head>
  <title>PW-DP Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PW - RH</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">

		  </head>
		  <body background="Imagens/background2.jpg">
		   <script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>
		<!-- This is a very simple parallax effect achieved by simple CSS 3 multiple backgrounds, made by http://twitter.com/msurguy -->
		<br><br><br><br>

		<div class="container" >
		
		<div class="row" >

		    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3" >
				<form action="LoginServlet" method="get">
		 		<input type="hidden" name="acao" value="login">
					<h2>Bem Vindo <small>Digite seu login e senha.</small></h2>
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
							<div class="form-group">
		                        <input type="text" name="login" id="login" class="form-control input-lg" placeholder="Login" >
							</div>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6">
							<div class="form-group">
								<input type="password" name="senha" id="senha" class="form-control input-lg" placeholder="Senha" >
							</div>
						</div>
					</div>
					
					<hr class="colorgraph">
					<div class="row">
		<!-- 				<div class="col-xs-6 col-md-6"><a href="#" class="btn btn-primary btn-block btn-lg">Registrar</a></div> -->
						<div  class="col-sm-8 col-md-8"></div>
						<div  class="col-sm-4 col-md-4">
						<input type="submit"  value="Login" class="btn btn-success btn-block btn-lg" >
						</div>
						
					</div>
				</form>
			</div>
		</div>
		
		
		</div>

  </body>
</html>