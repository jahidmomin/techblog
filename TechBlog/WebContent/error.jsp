<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Something Went Wrong</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link href="css/styles.css" rel="stylesheet" >
</head>
<body>
	<div class="container text-center">
		<img src="./img/error.png" alt="img-fluid">
		<h3 class="display-3">Sorry ! Something went wrong</h3>
		<%=exception %>
		<a class="btn bg-primary btn-lg mt-3 text-white" href="index.jsp">Home</a>
	</div>
</body>
</html>