<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Employee Management</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="" th:href="@{/css/style.css}">
</head>
<body>

	<%--Nav bar start --%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">Employee App</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active" href="add">Add
							Employee</a></li>
			</div>
		</div>
	</nav>
	<%--Nav bar end --%>

	<%--table start--%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header text-center">
						<h4>All Employee Details</h4>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Email</th>
									<th scope="col">Date of Birth</th>
									<th scope="col">Age</th>
									<th scope="col">Salary</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="employee" items="${employees}">
								<tr>
									<th scope="row">${employee.id}</th>
									<td>${employee.name}</td>
									<td>${employee.gender}</td>
									<td>${employee.email}</td>
									<td>${employee.dob}</td>
									<td>${employee.age}</td>
									<td>${employee.salary}</td>
									<td><c:if test="${employee.status == 'true'}">
									Active
									</c:if>
									<c:if test="${employee.status == 'false'}">
									Inactive
									</c:if></td>
									<td><a href="edit?id=${employee.id}" class="btn btn-sm btn-success">Edit</a>
									<a href="remove?id=${employee.id}" class="btn btn-sm btn-danger">Remove</a>
									</td>
							       </c:forEach>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%--table end--%>
</body>
</html>