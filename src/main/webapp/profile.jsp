<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entities.User" %>
<%@ page errorPage="error_page.jsp" %>
<%@ page import="com.tech.blog.entities.Message" %>
<%@ page import="com.tech.blog.entities.Category" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@page import="java.sql.*, java.util.*"%>

<%
	User user = (User)session.getAttribute("currentUser");
	if(user == null) {
		response.sendRedirect("login_page.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>
<!--  css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

	<!-- navbar -->
	
		<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span> Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#"> <span class="fa fa-desktop"></span> Learn Code with Rohit</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
             <span class="fa fa-check-square-o"></span> Categories
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Programming Language</a></li>
            <li><a class="dropdown-item" href="#">Project Implementation</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Data Structures</a></li>
          </ul>
        </li>
        <li class="nav-item">
        	<a class="nav-link" href="#"> <span class="fa fa-address-card-o"></span> Contact</a>
        </li>
        <li class="nav-item">
        	<a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"> <span class="fa fa-edit"></span> Add Post</a>
        </li>
       
        
      </ul>
      
      <ul class="navbar-nav mr-right">
      	
      	<li class="nav-item">
        	<a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"> <span class="fa fa-user-circle"></span> <%= user.getName() %></a>
        </li>
      	
      	<li class="nav-item">
        	<a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus"></span> Logout</a>
        </li>
      
      </ul>
      
    </div>
  </div>
</nav>
	
	<!-- navbar end -->
	
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
	
	<!-- main body of profile page -->
	
	<main>
		
		<div class="container">
			
			<div class="row mt-4">
				<!-- first col -->
				<div class="col-md-4">
					
					<div class="list-group">
						<a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active" aria-current="true">
						    All Posts
						</a>
						<%
							PostDao d = new PostDao(ConnectionProvider.getConnection());
							ArrayList<Category> list1 = d.getAllCategories();
							for(Category cc : list1) {
						%>
								<a href="#" onclick="getPosts(<%= cc.getCid() %>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
						<%		
							}
						%>
						
						
					</div>
				
				</div>
				
				<!-- second col -->
				<div class="col-md-8">
					
					<div class="container text-center" id="loader">
						
						<i class="fa fa-refresh fa-spin fa-4x"></i>
						<h3 class="mt-2">Loading.....</h3>
					
					</div>
					<div class="container-fluid" id="post-container">
					</div>
				
				</div>
			
			</div>
		
		</div>
		
	</main>
	
	<!-- end of main body of profile page -->
	
	<!-- profile modal -->
	
<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Tech Blog</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
        	<img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius:50%; max-width: 150px">
        	<h5 class="modal-title fs-5 mt-3" id="exampleModalLabel"> <%= user.getName() %> </h5>
        	
        	<div id="profile-details">
        		<table class="table">
			  
			  <tbody>
			    <tr>
			      <th scope="row">ID: </th>
			      <td><%= user.getId() %></td>
			      
			    </tr>
			    <tr>
			      <th scope="row">Email:</th>
			      <td><%= user.getEmail() %></td>
			    
			    </tr>
			    <tr>
			      <th scope="row">Gender:</th>
			      <td><%= user.getGender() %></td>
			      
			    </tr>
			    <tr>
			      <th scope="row">About:</th>
			      <td><%= user.getAbout() %></td>
			      
			    </tr>
			    <tr>
			      <th scope="row">Registered on:</th>
			      <td><%= user.getDateTime().toString() %></td>
			      
			    </tr>
			  </tbody>
			</table>
			</div>
        	
        	<!-- profile edit -->
        	<div id="profile-edit" style="display: none;">
        		<h3 class="mt-2">Please edit carefully</h3>
        		
        		<form action="EditServlet" method="post" enctype="multipart/form-data">
        			<table class="table">
        				<tr>
        					<td>ID: </td>
        					<td><%= user.getId() %></td>
        				</tr>
        				<tr>
        					<td>Email: </td>
        					<td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"> </td>
        				</tr>
        				<tr>
        					<td>Name: </td>
        					<td> <input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"> </td>
        				</tr>
        				<tr>
        					<td>Password: </td>
        					<td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"> </td>
        				</tr>
        				<tr>
        					<td>Gender: </td>
        					<td> <%= user.getGender().toUpperCase() %> </td>
        				</tr>
        				<tr>
        					<td>About: </td>
        					<td> 
        						<textarea rows="3" class="form-control" name="user_about"><%= user.getAbout() %></textarea> 
        					</td>
        				</tr>
        				<tr>
        					<td>New Profile:</td>
        					<td> 
        						<input type="file" name="image" class="form-control"> 
        					</td>
        				</tr>
        			</table>
        			
        			<div class="container">
        				<button type="submit" class="btn btn-outline-primary">Save</button>
        			</div>
        			
        		</form>
        		
        	</div>
        	
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
	
	<!-- profile modal end -->
	
	<!-- add post modal -->
	
		<!-- Modal -->
		<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Add post</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        
		        <form id="add-post-form" action="AddPostSerevlet" method="post">
		        
		        	<div class="form-group">
		        		<select class="form-control" name="cid">
			        		<option selected disabled>---Select Category---</option>
			        		
			        		<% 
			        			PostDao postd = new PostDao(ConnectionProvider.getConnection());
			        			ArrayList<Category> list = postd.getAllCategories();
			        			for(Category c: list) {
			        		%>
			        		
			        		<option value="<%= c.getCid() %>"><%= c.getName() %></option>
			        		
			        		<% } %>
			        		
		        		</select>
		        	
		        	</div>
		        
		        	<div class="form-group">
		        		<input name="pTitle" type="text" placeholder="Enter post title" class="form-control">
		        	</div>
		        	<div class="form-group">
		        		<textarea name="pContent" placeholder="Enter post content" class="form-control" style="height: 200px;"></textarea>
		        	</div>
		        	<div class="form-group">
		        		<textarea name="pCode" placeholder="Enter code (if any)" class="form-control" style="height: 200px;"></textarea>
		        	</div>
		        	<div class="form-group">
		        		<label>Add picture</label>
		        		<br>
		        		<input type="file" name="pic">
		        	</div>
		        	
		        	<div class="container text-center">
		        		<button type="submit" class="btn btn-outline-primary"> Post </button>
		        	</div>

		        </form>
		        
		      </div>
		      
		    </div>
		  </div>
		</div>
			
	<!-- add post modal end -->
	

<!-- javascript -->
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			
			let editStatus = false;
			
			$('#edit-profile-button').click(function() {
				if(editStatus == false) {
					$('#profile-details').hide()
					$('#profile-edit').show()
					$(this).text('Back')
					editStatus = true
				} else {
					$('#profile-details').show()
					$('#profile-edit').hide()
					$(this).text('Edit')
					editStatus = false
				}
			})
		});
	</script>
	
	<!-- add post js -->
	<script>
	
		$(document).ready(function(e) {
			
			$("#add-post-form").on("submit", function(event) {
				//this gets called when form is submitted
				event.preventDefault();
				
				let form = new FormData(this);
				
				//now requesting to server
				$.ajax({
					url: "AddPostServlet",
					type: 'POST',
					data: form,
					success: function(data, textStatus, jqXHR) {
						
						if(data.trim()=='done') {
							swal("Good Job!", "Saved Successfully!", "success");
						} else {
							swal("Error!!", "Something went Wrong!!...Try Again!", "error");
						}
						
					},
					error: function(jqXHR, textStatus, errorThrown) {
						swal("Error!!", "Something went Wrong!!...Try Again!", "error");
					},
					processData: false,
					contentType: false
				})
				
			})
			
		})
	
	</script>
	
	<!-- loading post using ajax -->
	<script>
	
		function getPosts(catId, temp) {
			
			$("#loader").show()
			$("#post-container").hide();
			
			$(".c-link").removeClass('active')
			
			$.ajax({
				url: "load_posts.jsp",
				data: {cid:catId},
				success: function(data, textStatus, jqXHR) {
					console.log(data);
					$("#loader").hide();
					$("#post-container").show();
					$("#post-container").html(data);
					$(temp).addClass('active');
				}
			})
		}
		
		$(document).ready(function(e) {
			
			let allPostRef = $(".c-link")[0]
			getPosts(0, allPostRef)
		})
	
	</script>
	
</body>
</html>