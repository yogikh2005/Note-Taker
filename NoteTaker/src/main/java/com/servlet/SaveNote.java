package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.View;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;
import com.mysql.cj.xdevapi.SessionFactory;


public class SaveNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public SaveNote() {
        super();
      
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			

			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			Note note=new Note(title, content, new Date());
			
			Session session=FactoryProvider.getFactory().openSession();
			
			Transaction transaction=session.beginTransaction();
			
			session.save(note);
			
			transaction.commit();
			
			session.close(); 		
			
			response.setContentType("text/html");
			PrintWriter outPrintWriter=response.getWriter();
			outPrintWriter.println("<h1 style='text-align:center;'>Note is added successfully</h1>");
			outPrintWriter.println("<h1 style='text-align:center;'><a href='view_notes.jsp'>View all notes </h1>");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	
		
		
	}

}
