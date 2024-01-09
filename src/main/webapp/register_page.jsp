<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<!--  css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

	<%@include file="normal_navbar.jsp" %>

	<main class="primary-background p-5">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-user-circle fa-3x"></span>
						<br>
						Register Here
					</div>
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="POST">
							<div class="mb-3">
					    		<label for="user_name" class="form-label">User Name</label>
							    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
					    		<label for="exampleInputEmail1" class="form-label">Email address</label>
							    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
							    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
							</div>
							<div class="mb-3">
							    <label for="exampleInputPassword1" class="form-label">Password</label>
							    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
							</div>
							<div class="mb-3">
							    <label for="gender" class="form-label">Select Gender</label>
							    <br>
							    <input type="radio" id="gender" name="gender" value="male"> Male
							    <input type="radio" id="gender" name="gender" value="female"> Female
							</div>
							<div class="mb-3">
								<textarea name="about" class="form-control" id="" rows="5" placeholder="Enter something about yourself"></textarea>
							</div>							
							<div class="mb-3 form-check">
							    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
							    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
							</div>
							<br>
							
							<div class="container text-center" id="loader" style="display: none;">
                            	<span class="fa fa-refresh fa-spin fa-4x"></span>
                                <h4>Please wait..</h4>
                            </div>
							
							<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			console.log("loaded...")
			
			$('#reg-form').on('submit', function(event) {
				event.preventDefault();
				
				let form = new FormData(this);
				
				 $("#sumbimt-btn").hide();
                 $("#loader").show();
				
				$.ajax({
					url: "RegisterServlet",
					type: 'POST',
					data: form,
					success: function(data, textStatus, jqXHR) {
						console.log(data)
						$("#sumbimt-btn").show();
                        $("#loader").hide();
                        
                        if (data.trim() === 'user added')
                        {

                            swal("Registered successfully..We are going to redirect to login page")
                                    .then((value) => {
                                        window.location = "login_page.jsp"
                                    });
                        } else
                        {

                            swal(data);
                        }
                        
					},
					error: function(jqXHR, textStatus, errorThrown) {
						$("#sumbimt-btn").show();
                        $("#loader").hide();
                        swal("something went wrong..try again");
					},
					processData: false,
					contentType: false
				});
				
			});
		});
	</script>

</body>
</html>