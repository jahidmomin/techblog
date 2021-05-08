<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link href="css/styles.css" rel="stylesheet">
<style>
.form-group {
	margin: 5px !important;
}

.ban {
	clip-path: polygon(38% 5%, 83% 0, 100% 13%, 100% 100%, 70% 100%, 29% 98%, 0 93%, 0
		3%);
}
</style>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<!-- Navbar -->
	<%@include file="navbar.jsp"%>

	<div class="container">

		<div class="row justify-content-center bg-primary p-5 ban">
			<div class="col-md-6 col-sm-12 col-lg-6">
				<div class="card ">
					<header class="card-header text-center bg-primary text-light">
						<h4 class="card-title mt-2">
							<i class="fa fa-user-plus " aria-hidden="true"></i>
							<br/>
							SignUp
						</h4>
					</header>
					<article class="card-body">
						<form action="RegisterServlet" method="post" id="regform">
							<div class="form-row">
								<div class="col form-group">
									<label>Username :</label> <input type="text"
										class="form-control" placeholder="Enter An Username"
										name="username">
								</div>

							</div>
							<!-- form-row end.// -->
							<div class="form-group">
								<label>Email address : </label> <input type="email"
									class="form-control" placeholder="Enter An Email" name="email">
								<small class="form-text text-muted">We'll never share
									your email with anyone else.</small>
							</div>

							<div class="form-group">
								<label class="form-check form-check-inline"> <input
									class="form-check-input" type="radio" name="gender"
									value="male"> <span class="form-check-label">
										Male </span>
								</label> <label class="form-check form-check-inline"> <input
									class="form-check-input" type="radio" name="gender"
									value="female"> <span class="form-check-label">
										Female</span>
								</label>
							</div>


							<div class="form-group">
								<label>Create password :</label> <input class="form-control"
									type="password" name="pass">
							</div>

							<div class="form-group">
								<label>About Yourself : </label>
								<textarea name="about" rows="5" cols="" class="form-control"
									placeholder="Enter Something About Yourself..."></textarea>
							</div>

							<div class="mb-3 form-check">
								<input type="checkbox" name="check" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1"><small class="text-muted">Click Checkboc to confirm that you accept our  Terms of use
								and Privacy Policy.
							</small></label>
							</div>
							<div class="form-group text-center" id="loader" style="display: none">
								<i class="fas fa-sync fa-spin fa-3x"></i>
								<h4>Please wait ...</h4>
								
							</div>
							<div class="form-group"  id="sb-btn">
								<button type="submit" class="btn btn-primary btn-block">
									Register</button>
							</div>
							<!-- form-group// -->


						

						</form>
					</article>
					<div class="border-top card-body text-center">
						Have an account? <a href="login.jsp">Log In</a>
					</div>
				</div>
			</div>

		</div>


	</div>



	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function() {
			console.log("ready")
			
			$("#regform").on('submit',function(e){
				e.preventDefault();
				let form=new FormData(this);
				
				$("#loader").show();
				$("#sb-btn").hide();
				
				//send register servlet
				$.ajax({
					url:"RegisterServlet",
					type:'POST',
					data:form,
					success:function(data,textStatus,jqXHR){
						console.log(data);
						$("#loader").hide();
						$("#sb-btn").show();
						
						if(data.trim() === "done"){
							swal({
								  title: "Registered Successfully.We are Redirect to Login Page",
								  text: "Welcome",
								  icon: "success"
								}).then((v)=>{
									window.location="login.jsp";
								});
						}else{
							swal(data);
						}
						
						
						
					},
					error:function(jqXHR,textStatus,err){
						console.log(jqXHR);
						$("#loader").hide();
						$("#sb-btn").show();
						swal({
							  title: "Something Went Wrong ! Try Again",
							  text: "Error",
							  icon: "error"
							})
					},
					processData:false,
					contentType:false
				});
			})
			
		})
	</script>
</body>
</html>