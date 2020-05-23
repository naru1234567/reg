package com.myproj.registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;


/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/loginCheck")
public class loginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	Connection c = null;
	Statement stmt = null;
	String sql = "";
	ResultSet rs = null;

	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname = request.getParameter("username"); 
		String pwd = request.getParameter("password");
		
		
		/**
		 * Validate the username and password
		 * If the user is admin, direct to the admin menu
		 * If the user is a normal user - direct him user menu
		 * 
		 */
		if (uname.equalsIgnoreCase("admin") && pwd.equalsIgnoreCase("admin") ) {
			response.sendRedirect("ViewAllReg.jsp");	
		}else {
			try {
				
			Class.forName("org.sqlite.JDBC");
			c = DriverManager.getConnection("jdbc:sqlite:D:/SQLite/test.db");
			c.setAutoCommit(false);
			System.out.println("Opened database successfully");

			stmt = c.createStatement();
			sql = "Select ID from STUDENT where Name='" + uname + "' and Password='" + pwd + "';";
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				String ID = rs.getString("ID");
				//request.setAttribute("ID", ID);
				System.out.println("Valye of the ID = " );
				System.out.println("Valye of the ID = " + ID);

				stmt.close();
				rs.close();
				c.close();
				

				request.getSession().setAttribute("ID",ID);
				request.getRequestDispatcher("Enroll.jsp").forward(request, response);

				//response.sendRedirect("Enroll.jsp");
			}else {
				stmt.close();
				rs.close();
				c.close();

				response.sendRedirect("Error1.jsp");
			}
			
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		//doGet(request, response);
	}

}
