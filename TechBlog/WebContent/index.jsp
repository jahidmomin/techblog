<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechBlog</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link href="css/styles.css" rel="stylesheet" >
<style>
	.banner-background{
		clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 70%, 100% 99%, 88% 93%, 0 99%, 0% 70%, 0% 35%, 0 0);
	}
</style>
</head>
<body>
	<!-- Navbar -->
	<%@include file="navbar.jsp" %>
	
	<div class="container-fluid p-40 mt-1">
  		<div class="jumbotron text-white bg-primary banner-background pb-3">
  			<div class="container">
  				<h3 class="display-3">Welcome to Tech Blog</h3>
  				<p>As shown above, Bootstrap generates a series of predefined container classes to help you build the layouts you desire.
  				 You may customize these predefined container classes by modifying the Sass map.to help you build the layouts you desire.
  				 You may customize these predefined container classes by modifying the Sass map.</p>
  				 <button class="btn btn-outline-light mr-2"><i class="fa fa-user-plus"></i> Start ! Its Free</button>
  				  <a class="btn btn-outline-light" href="login.jsp"><i class="fa fa-user-circle fa-spin"></i> Login</a>
  			</div>
  		</div>
	</div>
	
	<div class="container mt-3">
		<div class="row">
			<div class="card m-3" style="width: 18rem;">
			 <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">Read more</a>
			  </div>
			</div>
			
			<div class="card  m-3" style="width: 18rem;">
			  
			  <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">Read more</a>
			  </div>
			</div>
			
			<div class="card  m-3" style="width: 18rem;">
			  
			  <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">Read more</a>
			  </div>
			</div>
			
			<div class="card  m-3" style="width: 18rem;">
			  
			  <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">Read more</a>
			  </div>
			</div>
			
			
			<div class="card  m-3" style="width: 18rem;">
			  
			  <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">Read more</a>
			  </div>
			</div>
			
			
			<div class="card  m-3" style="width: 18rem;">
			  
			  <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">Read more</a>
			  </div>
			</div>
			
			
			<div class="card  m-3" style="width: 18rem;">
			  
			  <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">Read more</a>
			  </div>
			</div>
			
			
			<div class="card  m-3" style="width: 18rem;">
			  
			  <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">Read more</a>
			  </div>
			</div>
		</div>
	</div>
	<br/>
	
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" ></script>
<script>
	$(document).ready(function(){
		console.log("ready")
		//alert("Ready");
	})
</script>
</body>
</html>