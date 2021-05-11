<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link href="css/styles.css" rel="stylesheet" >
<style>

</style>
</head>
<body>
<!-- Navbar -->
	<%@include file="navbar.jsp" %>
	<hr/>
	<div>
		<div class="d-flex align-content-center bg-primary justify-content-center ">
  		<div class="card text-white bg-light pb-3 m-3">
  			<div class="card-header text-primary text-center">
  				<h2><i class="fa fa-user-circle" aria-hidden="true"></i></h2>
  			</div>
  			<%
  				Message msg=(Message)session.getAttribute("msg");
  				if(msg!=null){ %>
  				
  				<div class="alert <%=msg.getCssClass() %>" role="alert">
  				  <%=msg.getContent() %>
  				</div>
  				
  				<%
  					session.removeAttribute("msg");
  				}
  			%>
  			<div class="card-body text-dark">
  				<form action="LoginServlet" method="post">
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">Email address</label>
				    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
				    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
				  </div>
				  <div class="mb-3">
				    <label for="exampleInputPassword1" class="form-label">Password</label>
				    <input type="password" name="pass" class="form-control" id="exampleInputPassword1">
				  </div>
				  <div class="text-center mb-2">
				  		<button type="submit" class="btn btn-primary">Login</button>
				  </div>
				</form>
				<div class="border-top card-body text-center">New User ? <a href="register.jsp">Register now</a></div>
  			</div>
  			
  		</div>
	</div>
	</div>
	
	

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