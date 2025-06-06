<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Note Taker</title>
    	<%@include file="all_js_css.jsp" %>
</head>
  <body>
 
	<div class="container-fluid p-0 m-0 ">
		<%@include file="navbar.jsp" %>
	</div>
	<br>
	
	<div class="card my-6">
	
		<img class="img-fluid mx-auto" style="max-width:400px;" src="img/note.png">
	
		<h1 class="text-primary text-uppercase text-center mt-3">Start Taking your notes</h1>
	
		<div class="container text-center">
    			<a href="add_notes.jsp" class="btn btn-outline-primary text-center">Start Here</a>
		</div>

	</div>
	
	 </body>
</html>