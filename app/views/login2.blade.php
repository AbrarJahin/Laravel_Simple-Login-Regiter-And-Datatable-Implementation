
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>HP IIP/PM</title>
	<link media="all" type="text/css" rel="stylesheet" href="http://hpipppm.com/css/bootstrap.min.css">
	 <link media="all" type="text/css" rel="stylesheet" href="http://hpipppm.com/css/style.css">
</head>
<body>
<!-- Error Showing - Comes from form Validation -->
  @if($errors->any())
    <div class="alert alert-danger">
      
      {{ implode('', $errors->all('<li class="error">:message</li>'))}}
    </div>
    
  @endif

	<div style="height: auto; margin: 25px auto; width: 56%;">
		<div><img src="http://enter-sys.com/wp-content/uploads/2013/05/Icon-HP.png" style="height: 85px; margin-left: 47%;"/></div>
		<h1 style="font-weight: bold; width: 341px; font-size: 20px; margin-left: 31%; color:#8BB0C5; text-align:center;"> HP IPP/PM EXCESS FURNITURE MANAGEMENT PROGRAM</h1>
		<h2 style="color: #80a361; font-weight: bold; font-size: 15px; margin-left: 34%; margin-top: 8%;">RESPONSIBLE FURNITURE DISPOSITION</h2>
		<div class="login-body" style="width: 400px; margin-left: 26%;">
		<h3 style="margin-left:19%;">SIGN IN</h3>
			<form method="POST" action="login" accept-charset="UTF-8" class="form-validate">
				<div class="form-group" style="width:400px; float:left; height:40px;">
					<label for="login_name" style="float:left">Login: </label>
					<div class="email controls">
							<input class="form-control" style="float: left; margin-left: 40px; width: 280px;" name="login_name" type="text" id="login_name">
					</div>
				</div>
				
				<div class="form-group" style="width:400px; flost:left;">
					<label for="password" style="float:left">Password: </label>
					<div class="pw controls">
							<input class="form-control" style="float: left; margin-left: 11px; width: 279px;" name="password" type="password" value="" id="password">
					</div>
				</div>
				<div class="submit" style="float:right;margin-top:10px; margin-right:39px;">
					<input class="btn btn-primary" type="submit" value="Sign In">
				</div>
				<input type="hidden" name="company_id" value="2">
			</form>
		</div>
	</div>
</body>
</html>