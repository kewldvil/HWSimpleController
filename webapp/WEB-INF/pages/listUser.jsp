<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/fonts/font-awesome/font-awesome.min.css" />
<title>Simple Controller</title>
<style type="text/css" media="screen">
	.btn{
		border-radius: 0px !important;
	}
	th{
		color: #ffffff;
  		text-transform: uppercase;
  		letter-spacing: 2px;
  		font-size: 20px;
  		text-align: center;
  		font-weight: 700;
	}
	thead tr {
		background-color: #34495e;
	}
	tbody tr{
		background-color: #ffffff;
		color:#bdc3c7;
		text-align: center;
		font-size: 18px !important;
	}
	input[type=text]{
		border-radius: 0px;
	}

	.form-submit form{
		display: inline-block;
	}


</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row text-center text-danger">
			<h1>USE SIMPLE CONTROLLER</h1>
		</div>
		<div class="col-lg-8 col-lg-offset-2">
			<div class="row" style="margin-bottom:5px;">
				<div class="col-lg-12">
					<form action="${pageContext.request.contextPath }/addUserNSearch" class="form-inline" method="post">
							<input type="submit" name="btnAddNSearch" value="Add New" class="btn btn-primary">
							<input type="submit" name="btnAddNSearch" value="Search" class="btn btn-default pull-right">&nbsp;
							<div class="form-group pull-right">
								<input type="text" name="txtSearch" class="form-control">
							</div>

					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>Username</th>
									<th>Email</th>
									<th>Password</th>
									<th>Date of Birth</th>
									<th>Register Date</th>
									<th>Image</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="i" value="0" scope="page" />
								<c:forEach items="${list}" var="student" >
									<tr>
										<td><c:out value="${i+1}" escapeXml="false" /></td>
										<td>${student.username}</td>
										<td>${student.email}</td>
										<td>**********</td>
										<td>${student.birthdate}</td>
										<td>${student.registerDate}</td>
										<td>${student.imageURL}</td>
										<td class="form-submit">
											<form action="${pageContext.request.contextPath}/viewUpdateDeleteUser" method="post">
												<input type="hidden" name="userId" value="${student.id}">
												<input type="submit" name="btnViewUpdateDelete" value="View" class="btn btn-primary btn-sm">
												<input type="submit" name="btnViewUpdateDelete" value="Update" class="btn btn-warning btn-sm">
												<input type="submit" name="btnViewUpdateDelete" value="Delete" class="btn btn-danger btn-sm">
											</form>
										</td>
									</tr>	

									<c:set var="i" value="${i+1}" scope="page" />
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>