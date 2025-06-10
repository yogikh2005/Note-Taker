<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Notes</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container-fluid p-0 m-0">
    <%@include file="navbar.jsp" %>

    <div class="container mt-3">
        <h1 class="text-uppercase">All Notes</h1>

        <!-- 🔍 Search Form -->
        <form class="d-flex mb-4" method="get" action="view_notes.jsp">
            <input class="form-control me-2" type="search" name="query" placeholder="Search notes..." 
                   value="<%= request.getParameter("query") != null ? request.getParameter("query") : "" %>" />
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>

        <div class="row">
            <div class="col-12">
                <%
                    String query = request.getParameter("query"); // Get the search input

                    Session s = FactoryProvider.getFactory().openSession();
                    Query q;

                    if (query != null && !query.trim().isEmpty()) {
                        // Use LIKE for search in title or content
                        q = s.createQuery("FROM Note WHERE title LIKE :term OR content LIKE :term ORDER BY id DESC");
                        q.setParameter("term", "%" + query + "%");
                    } else {
                        q = s.createQuery("FROM Note ORDER BY id DESC");
                    }

                    List<Note> list = q.list();
                    s.close();

                    if (list != null && !list.isEmpty()) {
                        for (Note note : list) {
                %>

                <div class="card mt-3">
                    <img src="img/note.png" style="max-width:100px" class="card-img-top m-4 mx-auto" alt="card image">
                    <div class="card-body px-5">
                        <h5 class="card-title"><%= note.getTitle() %></h5>
                        <p class="card-text"><%= note.getContent() %></p>
                        <%
                            SimpleDateFormat sdf = new SimpleDateFormat("EEEE, dd-MMM-yyyy hh:mm:ss a");
                            String formattedDate = sdf.format(note.getAddDate());
                        %>
                        <b><p class="card-text">Date Modified: <%= formattedDate %></p></b>
                        <div class="container text-center mt-2">
                            <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
                            <a href="edit_notes.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
                        </div>
                    </div>
                </div>

                <%
                        }
                    } else {
                %>
                <p class="text-muted">No notes found.</p>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
