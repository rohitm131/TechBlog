<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tech Blog</title>
<!--  css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<!-- navbar -->
	<%@include file="normal_navbar.jsp" %>
	
	<!-- banner -->
	<div class="container-fluid p-0 m-0">

            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog </h3>

                    <p>Welcome to technical blog, world of technology
                        A programming language is a formal language, which comprises a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.
                    </p>
                    <p>
                        Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. 
                    </p>

                    <button class="btn btn-outline-light btn-lg"> <span class="fa fa-user-plus"></span>  Start ! its Free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle"></span>  Login</a>
                    

                </div>
            </div>         
      </div>
      
      
      <!-- cards -->
      <div class="container">
      	
      	<div class="row mb-2">
      		
      		<div class="col-md-4">
      			<div class="card">
					<div class="card-body">
    					<h5 class="card-title">Java Programming</h5>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    					<a href="#" class="btn primary-background text-white">Read More</a>
  					</div>
				</div>
      		</div>
      		<div class="col-md-4">
      			<div class="card">
					<div class="card-body">
    					<h5 class="card-title">Java Programming</h5>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    					<a href="#" class="btn primary-background text-white">Read More</a>
  					</div>
				</div>
      		</div>
      		<div class="col-md-4">
      			<div class="card">
					<div class="card-body">
    					<h5 class="card-title">Java Programming</h5>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    					<a href="#" class="btn primary-background text-white">Read More</a>
  					</div>
				</div>
      		</div>
      	
      	</div>
		<div class="row">
      		
      		<div class="col-md-4">
      			<div class="card">
					<div class="card-body">
    					<h5 class="card-title">Java Programming</h5>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    					<a href="#" class="btn primary-background text-white">Read More</a>
  					</div>
				</div>
      		</div>
      		<div class="col-md-4">
      			<div class="card">
					<div class="card-body">
    					<h5 class="card-title">Java Programming</h5>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    					<a href="#" class="btn primary-background text-white">Read More</a>
  					</div>
				</div>
      		</div>
      		<div class="col-md-4">
      			<div class="card">
					<div class="card-body">
    					<h5 class="card-title">Java Programming</h5>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    					<a href="#" class="btn primary-background text-white">Read More</a>
  					</div>
				</div>
      		</div>
      	
      	</div>
		      	
      </div>

	<!-- javascript -->
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>