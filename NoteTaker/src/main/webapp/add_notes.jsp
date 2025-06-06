<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
   	<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container-fluid p-0 m-0 ">
		<%@include file="navbar.jsp" %>
		<h1 class="text-uppercase">Please fill your note detail</h1>
		<br>
		<!-- this add notes form-->
	<form action="SaveNote" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Note Title </label>
    <input required type="text" class="form-control" name="title" id="title"  >
    
  </div>
  <div class="mb-3">
    <label for="content" class="form-label">Note Content</label>
    <textarea required name="content" id="content" placeholder="Enter content"  class="form-control" style=height:300px></textarea>
  </div>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary" >Add</button></div>
  
</form>
	</div>
</body>
</html>