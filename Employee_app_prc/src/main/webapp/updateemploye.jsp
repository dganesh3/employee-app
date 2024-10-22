<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/styles.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="home">Employee App</a>
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
					<li class="nav-item"><a class="nav-link" href="add">Add
							Employee</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center">
						<h3>Edit Employee</h3>
					</div>
					<div class="card-body">
						<form:form action="update" modelAttribute="employee">
							<form:input type="hidden" class="form-control" id="id"
								placeholder="Enter your ID" path="id" required="required" />
							<div class="mb-3">
								<label for="name">Enter Name</label>
								<form:input type="text" class="form-control" id="name"
									placeholder="Enter your name" path="name" required="required" />
							</div>
							<div class="mb-3">
								<label>Gender</label><br />
								<form:radiobutton path="gender" value="male"
									class="form-check-input" id="male" required="required"/>
								<label class="form-check-label" for="male">Male</label>
								<form:radiobutton path="gender" value="female"
									class="form-check-input" id="female" required="required" />
								<label class="form-check-label" for="female">Female</label>
								<form:radiobutton path="gender" value="others"
									class="form-check-input" id="others" required="required"/>
								<label class="form-check-label" for="others">Others</label>
							</div>
							<div class="mb-3">
								<label for="email">Enter Email</label>
								<form:input type="email" class="form-control" id="email"
									placeholder="Enter your email" path="email" required="required" />
							</div>
							<div class="mb-3">
								<label for="dob">Date of Birth</label>
								<form:input type="date" class="form-control" id="dob" path="dob"
									required="required" />
							</div>
							<div class="mb-3">
								<label for="salary">Enter Salary</label>
								<form:input type="number" class="form-control" id="salary"
									placeholder="Enter your salary" path="salary"
									required="required" />
							</div>
							<div class="mb-3">
								<label>Status</label><br />
								<form:radiobutton path="status" value="true"
									class="form-check-input" id="active" required="required"/>
								<label class="form-check-label" for="active">active</label>
								<form:radiobutton path="status" value="false"
									class="form-check-input" id="inactive" required="required" />
								<label class="form-check-label" for="inactive">Inactive</label>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
