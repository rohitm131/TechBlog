<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tech.blog.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

	<!-- navbar -->
	<%@include file="normal_navbar.jsp" %>

	<main class="d-flex align-items-center primary-background" style="height: 80vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-plus fa-3x"></span>
							<br>
							<p>login here</p>
						</div>
						
						<% 
							Message m= (Message)session.getAttribute("msg"); 
							if(m != null) {
						%>
							<div class="alert <%= m.getCssClass() %>" role="alert">
								<%= m.getContent() %>	
							</div>
						<%
							session.removeAttribute("msg");
							}
						%>
						
						<div class="card-body">
							<form action="LoginServlet" method="post">
  								<div class="mb-3">
								    <label for="exampleInputEmail1" class="form-label">Email address</label>
    								<input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    								<div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
								</div>
  								<div class="mb-3">
    								<label for="exampleInputPassword1" class="form-label">Password</label>
    								<input name="password" required type="password" class="form-control" id="exampleInputPassword1">
  								</div>
  								<div class="container text-center">
  									<button type="submit" class="btn btn-primary">Submit</button>
  								</div>
  								
							</form>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</main>

<!-- javascript -->
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>