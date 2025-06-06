package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateServlet() {
        super();
   
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			
		
			Session session=FactoryProvider.getFactory().openSession();
			Note note=session.get(Note.class,noteId);
			Transaction transaction=session.beginTransaction();
			
			note.setAddDate(new Date());
			note.setContent(content);
			note.setTitle(title);
			
			
			session.save(note);
			transaction.commit();
			session.close(); 		
			
			response.sendRedirect("view_notes.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
