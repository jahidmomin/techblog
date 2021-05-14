<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile | Account</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link href="css/styles.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>

 </style>
<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("login.jsp");
	}
%>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-primary">
		<div class="container-fluid ">
			<a class="navbar-brand" href="index.jsp"><i class="fa fa-rss"></i>
				TechBlog</a>
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
					<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Tech </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Prog Lang</a></li>
							<li><a class="dropdown-item" href="#">Projects</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Many more</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link " href="#"
						tabindex="-1">Contact</a>
					</li>
					<li class="nav-item" ><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#posts"
						tabindex="-1"><i class="fas fa-plus"></i> Do Post</a>
					</li>

				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item"><a class="nav-link"
						data-bs-toggle="modal" data-bs-target="#profile" href="#"><i
							class="fas fa-user-alt"></i> <%=user.getName()%></a></li>
					<li class="nav-item"><a class="nav-link" href="LogoutServlet"><i
							class="fas fa-sign-out-alt"></i> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<hr />
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
	<!-- start modal -->
	<!-- Modal -->
	<div class="modal fade" id="profile" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">Your Profile</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="profilepics/<%=user.getProfile()%>" class="img-fluid"
							width="100" height="100" style="border-radius: 50%;" alt="" /> <br />
						<h1 class="badge bg-primary fs-4 m-2"><%=user.getName()%></h1>
						<div id="profile-details">
							<table class="table text-start">
								<tbody>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">About :</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getDateTime().toLocaleString().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="profile-edit" style="display: none">
							<form action="EditServlet" method="post" enctype="multipart/form-data">
								<table class="table text-start">
									<tbody>
										<tr>
											<th scope="row">Id :</th>
											<td><input disabled value="<%=user.getId()%>"
												class="form-control" /></td>
										</tr>
										<tr>
											<th scope="row">Name :</th>
											<td><input type="text" name="name"
												value="<%=user.getName()%>" class="form-control" /></td>
										</tr>
										<tr>
											<th scope="row">Email :</th>
											<td><input type="email" name="email"
												value="<%=user.getEmail()%>" class="form-control" /></td>
										</tr>
										<tr>
											<th scope="row">Profile Pic :</th>
											<td><input type="file" name="profile"
												class="form-control" /></td>
										</tr>
										<tr>
											<th scope="row">About :</th>
											<td><textarea rows="2" cols="40" name="about"><%=user.getAbout()%></textarea></td>
										</tr>
										<tr>
											<th scope="row">Password :</th>
											<td><input type="text" name="pass"
												value="<%=user.getPassword()%>" class="form-control" /></td>
										</tr>
									</tbody>
								</table>
								<div class="container ">
									<button class="btn btn-primary">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" id="edit-btn" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>


<!-- Add Posts Modal -->
<!-- Modal -->
<div class="modal fade" id="posts" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Posts</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="AddPostServlet" id="postform" method="post" enctype="multipart/form-data">
        		   <div class="form-group mb-1">
				     <select name="catid" class="form-control">
				     	<option disabled selected>---Select Post Category----</option>
				     	<%
				     		PostDao dao=new PostDao(ConnectionProvider.getConnection());
				     		ArrayList<Category> list=dao.getAllCategories();
				     		for(Category c:list){%>
				     			<option value="<%=c.getCid()%>"><%=c.getName() %></option>
				     		<%}
				     	%>
				     </select>
				  </div>
				  <div class="form-group mb-1">
				    <input type="text" name="title" class="form-control" id="post" aria-describedby="title"  placeholder="Enter Post Title">
				  </div>
				  <div class="form-group mb-1">
				    <textarea class="form-control" name="content" style="height:200px" placeholder="Enter Post content"></textarea>
				  </div>
				  <div class="form-group mb-1">
				    <textarea class="form-control" name="code" style="height:200px" placeholder="Enter Program Code/Snippets If Contain.."></textarea>
				  </div>
				  <div class="form-group mb-1">
				  	<label class="form-label">Select Post Picture :</label>
				    <input type="file" name="pic" class="form-control">
				  </div>
				  <div class="form-group text-center" id="loader" style="display: none">
								<i class="fas fa-sync fa-spin fa-3x"></i>
							<h4>Please wait ...</h4>
					</div>
				  <div class="text-center mb-2">
				  		<button type="submit" class="btn btn-primary">Add Posts</button>
				  </div>
				</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>








	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			console.log("ready")
			//alert("Ready");
			let status = false;
			$("#edit-btn").click(function() {
				if (status == false) {
					$("#profile-details").hide();
					$("#profile-edit").show();
					status = true;
					$(this).text("Back");

				} else {
					$("#profile-details").show();
					$("#profile-edit").hide();
					$(this).text("Edit");
					status = false;
				}

			})
		})
	</script>
	
	<script>
		$(document).ready(function() {
			console.log("ready")
			
			$("#postform").on('submit',function(e){
				e.preventDefault();
				let form=new FormData(this);
				
				$("#loader").show();
				$("#sb-btn").hide();
				
				//send register servlet
				$.ajax({
					url:"AddPostServlet",
					type:'POST',
					data:form,
					success:function(data,textStatus,jqXHR){
						console.log(data);
						$("#loader").hide();
						$("#sb-btn").show();
						
						if(data.trim() === "done"){
							swal({
								  title: "Post Upload Successfully",
								  text: "Welcome",
								  icon: "success"
								}).then(function(v){
									//window.location="login.jsp";
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