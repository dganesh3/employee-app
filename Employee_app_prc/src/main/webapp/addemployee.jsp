<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Employee</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/styles.css">
<script>
	function convertDateFormat() {
		// Get the value from the input field
		const inputDate = document.getElementById("dob").value;

		// Split and rearrange the date
		const parts = inputDate.split("-");
		const formattedDate = `${parts[2]}-${parts[1]}-${parts[0]}`;

		// Set the formatted date in the output field (if needed)
		document.getElementById("outputDate").value = formattedDate;
	}
	finction demo()
	{
		alert('${error}');
	}
</script>
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
					<li class="nav-item"><a class="nav-link active" href="add">Add
							Employee</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<c:if test="${not empty error}">
						<div class="alert alert-danger" role="alert">${error}</div>
					</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center">
						<h3>Add Employee</h3>
					</div>

						<form action="save" method="post">
							<div class="mb-3">
								<label>Enter name</label> <input type="text"
									class="form-control" id="name" name="name"
									placeholder="Enter your name" required>
							</div>

							<div class="mb-3">
								<label>Gender</label> <input class="form-check-input"
									type="radio" name="gender" id="male" value="male" required>
								<label class="form-check-label" for="male">Male</label> <input
									class="form-check-input" type="radio" name="gender" id="female"
									value="female" required> <label
									class="form-check-label" for="female">Female</label> <input
									class="form-check-input" type="radio" name="gender" id="others"
									value="others" required> <label
									class="form-check-label" for="others">Others</label>
							</div>

							<div class="mb-3">
								<label>Enter email</label> <input type="email"
									class="form-control" id="email" name="email"
									placeholder="Enter your email" required>
							</div>

							<div class="mb-3">
								<label>Date of Birth</label> <input type="date"
									class="form-control" id="dob" name="dob" required
									onchange="convertDateFormat()">
							</div>

							<div class="mb-3">
								<label>Enter salary</label> <input type="number"
									class="form-control" id="salary" name="salary"
									placeholder="Enter your salary" required>
							</div>

							<div class="mb-3">
								<label>Status</label> <input class="form-check-input"
									type="radio" name="status" id="active" value="true" required>
								<label class="form-check-label" for="active">Active</label> <input
									class="form-check-input" type="radio" name="status"
									id="inactive" value="false" required> <label
									class="form-check-label" for="inactive">Inactive</label>
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
