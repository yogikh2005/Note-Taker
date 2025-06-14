📝 Basic Note-Taking Web Application
A simple Note-Taking web application that allows users to Create, Read, Update, and Delete notes using:

Technology Used

🧩 Hibernate (for ORM and database interaction)

🌐 JSP/Servlets (for frontend and backend logic)

🚀 Apache Tomcat (as the application server)


📌 Features


✅ Add new notes

📄 View all notes

✏️ Update existing notes

❌ Delete notes

🗃️ Uses MySQL for data storage


This is a Basic Note-Taking Web Application that performs full CRUD operations (Create, Read, Update, Delete) using Hibernate for ORM (Object-Relational Mapping) and MySQL as the database. The user interface is developed using JSP (Java Server Pages) and Java Servlets, and the application is deployed on an Apache Tomcat Server.
In this project, users can add new notes, view all existing notes, edit any note, or delete them. Each note includes a title, content, and a date of creation. Hibernate is used to manage the database interactions without writing SQL queries directly.

The project is structured with standard packages:
com.entities contains the Hibernate entity class (Note.java).
com.servlet includes the servlets for saving, updating, deleting, and displaying notes.
JSP files like add_notes.jsp, edit.jsp, and show_notes.jsp handle the front-end presentation and form inputs.
The database used is MySQL, and the Hibernate configuration is provided in hibernate.cfg.xml. The servlet mappings and deployment settings are defined in web.xml.To run the application, import it into Eclipse or IntelliJ as a Dynamic Web Project, configure the database and server, and run it on Tomcat. You can access the application via http://localhost:8080/YourAppName/.
This project is ideal for learning how to build Java-based web applications using Hibernate and JSP technologies, and how to deploy them using Apache Tomcat.
