<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<div class="row">

	<%
		Thread.sleep(1000);
		User user=(User)session.getAttribute("user");
		int cid=Integer.parseInt(request.getParameter("cid"));
		List<Post> posts=null;
		PostDao dao=new PostDao(ConnectionProvider.getConnection());
		
		//
		if(cid==0){
			posts=dao.getAllPosts();
		}else{
			posts=dao.getPostById(cid);
		}
		
		if(posts.size()==0){%>
			<div class="container text-center">
				<h3>No Posts Available</h3>
			<div>
		<%}
		
		LikeDao ldao=new LikeDao(ConnectionProvider.getConnection());
		
		for(Post post:posts){%>
				<div class="col-md-4">
					<div class="card m-2" style="width: 18rem;">
					  <img src="blogpics/<%=post.getPic()%>" class="card-img-top img-fluid" style="width:100%;height:25vh;" alt="<%=post.getTitle()%>">
					  
					  <div class="card-body">
					  	<h4 class="card-text"><%=post.getTitle() %></h4>
					    <p class="card-text"><%=post.getContent() %></p>
					  </div>
					   <div class="card-footer">
						  	<a class="btn btn-outline-primary" onClick="doLike(<%=post.getId()%>,<%=user.getId()%>)"><i class="fas fa-thumbs-up"></i><span id="likec"><%=ldao.countLike(post.getId())%></span></a>
						  	<a class="btn btn-outline-primary"><i class="far fa-comments"></i></a>
						  	 <a  class="btn btn-outline-primary" href="detail_post.jsp?id=<%=post.getId()%>">Read more</a>
						</div>
					</div>
				</div>
		<%	}
		%>
</div>
<script type="text/javascript" src="js/like.js"></script>