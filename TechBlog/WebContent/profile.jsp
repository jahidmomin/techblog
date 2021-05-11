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
						tabindex="-1">contact</a></li>

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
</body>
</html>