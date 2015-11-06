<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css"
	rel="stylesheet">
<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/resources/fonts/font-awesome/font-awesome.min.css" />
<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/resources/jasny-bootstrap/css/jasny-bootstrap.css" />

<style>
.indent-small {
	margin-left: 5px;
}

.form-group.internal {
	margin-bottom: 0;
}

.dialog-panel {
	margin: 10px;
}

.datepicker-dropdown {
	z-index: 200 !important;
}

.panel-body {
	background: #e5e5e5; /* Old browsers */
	background: -moz-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%,
		color-stop(0%, #e5e5e5), color-stop(100%, #ffffff));
	/* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* IE10+ */
	background: radial-gradient(ellipse at center, #e5e5e5 0%, #ffffff 100%);
	/* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e5e5e5',
		endColorstr='#ffffff', GradientType=1);
	/* IE6-9 fallback on horizontal gradient */
	font: 600 15px "Open Sans", Arial, sans-serif;
}

label.control-label {
	font-weight: 600;
	color: #777;
}
input[type=text],input[type=password],input[type=email],input[type=date]{
  border-radius: 0px;
}
</style>
<title>New User Form</title>
</head>
<body>
	<div class='container'>
		<div class='panel panel-primary dialog-panel'>
			<div class='panel-heading'>
				<h1>New User - Form</h1>
			</div>
			<div class='panel-body'>
				<form class='form-horizontal' role='form' enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/addUserAction">
					<div class='form-group'>
						<label class='control-label col-md-2 col-md-offset-2'>Username</label>
						<div class='col-md-8'>
							<div class='col-md-8'>
								<div class='form-group internal'>
									<input class='form-control' name='username'
										placeholder='Username' type='text'>
								</div>
							</div>
						</div>
					</div>
					<div class='form-group'>
						<label class='control-label col-md-2 col-md-offset-2'>E-mail</label>
						<div class='col-md-8'>
							<div class='col-md-8'>
								<div class='form-group internal'>
									<input class='form-control' name='email' placeholder='email'
										type='email'>
								</div>
							</div>
						</div>
					</div>
					<div class='form-group'>
						<label class='control-label col-md-2 col-md-offset-2'>Password</label>
						<div class='col-md-8'>
							<div class='col-md-8'>
								<div class='form-group internal'>
									<input class='form-control' name='password'
										placeholder='Password' type='password'>
								</div>
							</div>
						</div>
					</div>
					<div class='form-group'>
						<label class='control-label col-md-2 col-md-offset-2'>Birth
							Of Date</label>
						<div class='col-md-8'>
							<div class='col-md-8'>
								<div class='form-group internal'>
									<input class='form-control' name='birthdate' placeholder='Birth Of Date' type='date'>
								</div>
							</div>
						</div>
					</div>
					<div class='form-group'>
						<label class='control-label col-md-2 col-md-offset-2'>Register
							Date</label>
						<div class='col-md-8'>
							<div class='col-md-8'>
								<div class='form-group internal'>
									<%
										DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
										Date date = new Date();
									%>
									<input class='form-control' name='registerDate'
										placeholder='Register Date' type='text'
										value="<%=dateFormat.format(date)%>" readonly="readonly">
								</div>
							</div>
						</div>
					</div>
					<div class="form-group ">
						<div class='col-md-8 col-md-offset-4'>
							<div class="fileinput fileinput-new" data-provides="fileinput">
								<div class="fileinput-preview thumbnail"
									data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
								<div>
									<span class="btn btn-default btn-file"><span
										class="fileinput-new">Select image</span><span
										class="fileinput-exists">Change</span><input type="file"
										name="file"></span> <a href="#"
										class="btn btn-default fileinput-exists"
										data-dismiss="fileinput">Remove</a>
								</div>
							</div>
						</div>
					</div>
					<div class='form-group'>
            <div class='col-md-8 col-md-offset-4'>
  					   <div class='col-md-6' style="padding-left:0px;">
  						  <input type="submit" name="btnAddNCancel" value="Add" class="btn btn-primary ">
  							<input type="submit" name="btnAddNCancel" value="Cancel" class="btn btn-danger ">
  						 </div>
            </div>
					</div>
				</form>

			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/jasny-bootstrap/js/jasny-bootstrap.js" />

	<script>
		$(document).ready(function() {
			$(".fileinput").fileinput();
		});
	</script>
</body>
</html>