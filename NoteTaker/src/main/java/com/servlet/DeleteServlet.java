package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		try {
	
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			Session session=FactoryProvider.getFactory().openSession();
			Transaction t=session.beginTransaction();
			Note note=(Note)session.get(Note.class,noteId);
			session.delete(note);
			t.commit();
			session.close();
			
			response.sendRedirect("view_notes.jsp");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
