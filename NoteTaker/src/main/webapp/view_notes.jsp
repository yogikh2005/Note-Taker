<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Notes</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container-fluid p-0 m-0 ">

		<%@include file="navbar.jsp" %>
		<br>
		<h1 class="text-uppercase">All Notes</h1>
		
		
		<div class="row">
		<div class="col-12">
		<%
		
		Session s=FactoryProvider.getFactory().openSession();
		Query q=s.createQuery("from Note");
		List<Note>list=q.list();
		for(Note note:list)
		{%>
		
		
		<div class="card mt-3">
  		 	<img src="img/note.png"  style="max-width:100px"class="card-img-top m-4 mx-auto" alt="card not avilable">
  			<div class="card-body px-5">
    				<h5 class="card-title"><%=note.getTitle()%></h5>
    				<p class="card-text"><%=note.getContent()%></p>
    				<%@ page import="java.text.SimpleDateFormat" %>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("EEEE,dd-MMM-yyyy hh:mm:ss a"); // customize as needed
    String formattedDate = sdf.format(note.getAddDate());
%>
<b><p class="card-text">Date Modified : <%= formattedDate %></p></b>

    				<div class="container text-center mt-2">
    					<a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
    					<a href="edit_notes.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Update</a>
    				</div>
    				
  			</div>
		</div>
		
		
		
		<% }
		s.close();
		
		%>
		
		</div>
		</div>
		</div>
</body>
</html>