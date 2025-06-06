<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container-fluid p-0 m-0 ">

		<%@include file="navbar.jsp" %>
		<br>
		<h1 class="text-uppercase">Edit Notes</h1>
		
		<%
		
		int noteId=Integer.parseInt(request.getParameter("note_id").trim());
		Session session2=FactoryProvider.getFactory().openSession();
		Note note=(Note)session2.get(Note.class,noteId);	
		%>
		
		<form action="UpdateServlet" method="post">
		
		<input value="<%=note.getId() %>" name="note_id" type="hidden"/>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Note Title </label>
    <input required type="text" class="form-control" name="title" id="title" value="<%=note.getTitle() %>" >
    
  </div>
  <div class="mb-3">
    <label for="content" class="form-label">Note Content</label>
    <textarea required name="content" id="content" placeholder="Enter content"  class="form-control" style=height:300px><%=note.getContent() %></textarea>
  </div>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary" >Update</button></div>
  
</form>
		</div>
</body>
</html>