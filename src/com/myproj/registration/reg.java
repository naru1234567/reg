package com.myproj.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class reg
 */
@WebServlet("/reg")
public class reg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public reg() {
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

		String ID = request.getParameter("userid");
		String name = request.getParameter("username");
		String password = request.getParameter("password");

		// System.out.println("Value of ID !!!!!!!!! = " + ID);

		String sqlQuery = "Insert into Student(ID, name, password) values('" + ID + "','" + name + "','" + password
				+ "')";

		String sqlCheck = "select count(1) from Student where ID = '" + ID + "'";

		Connection c = null;
		Statement stmt = null;
		Statement stmt1 = null;
		ResultSet rs = null;
		String nextPage = "";
		try {
			Class.forName("org.sqlite.JDBC");
			c = DriverManager.getConnection("jdbc:sqlite:D:/SQLite/test.db");
			c.setAutoCommit(true);
			System.out.println("Opened database successfully");

			stmt = c.createStatement();
			stmt1 = c.createStatement();
			/**
			 * First check if the Email ID exists
			 */
			System.out.println(sqlCheck);
			rs = stmt.executeQuery(sqlCheck);
			
			if (   rs.getInt(1) == 0) {
				/**
				 * Write the query to perform the insert
				 */
				System.out.println("No Email ID exists");
				System.out.println(sqlQuery);
				stmt1.executeUpdate(sqlQuery);

				/**
				 * Check if the rows returned after performing the insert - if the execution is
				 * true return the boolean true else return false;
				 * 
				 */
				nextPage = "Confirmation.jsp";
			} else {
				nextPage = "Duplicate.jsp";
			}
			rs.close();
			stmt.close();
			stmt1.close();
			c.close();

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());

		}
		response.sendRedirect(nextPage);
	}

}
