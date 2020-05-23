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
 * Servlet implementation class enroll
 */
@WebServlet("/enroll")
public class enroll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public enroll() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ID = request.getParameter("ID");
		String coursedate = request.getParameter("coursedate");
		String coursename = request.getParameter("coursename");

		System.out.println("Value of ID !!!!!!!!! = " + ID);

		String sqlQuery = "Insert into Registration(ID, date, course) values('" + ID + "','" + coursedate + "','"
				+ coursename + "')";

		Connection c = null;
		Statement stmt = null;

		try {
			Class.forName("org.sqlite.JDBC");
			c = DriverManager.getConnection("jdbc:sqlite:D:/SQLite/test.db");
			c.setAutoCommit(true);
			System.out.println("Opened database successfully");

			stmt = c.createStatement();

			/**
			 * Write the query to perform the insert
			 */

			System.out.println(sqlQuery);
			//stmt.executeUpdate(sqlQuery);
			stmt.execute(sqlQuery);

			/**
			 * Check if the rows returned after performing the insert - if the execution is
			 * true return the boolean true else return false;
			 * 
			 */
			
			stmt.close();
			c.close();
			c = null;
			// return true;
		} catch (Exception e) {
			try {
				stmt.close();
				c.close();
				c = null;

			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			System.err.println(e.getClass().getName() + ": " + e.getMessage());
			// return returnValue;

		}

		response.sendRedirect("AllMyReg.jsp");
		// doGet(request, response);
	}

}
