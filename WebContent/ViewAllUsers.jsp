<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html>
<head>
<title>LIST OF ALL STUDENTS</title>

<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 15px;
	font-family: tahoma
}

li a:hover {
	background-color: #111;
	font-size: 15px;
	font-family: tahoma
}

.active {
	background-color: lightblue;
}

table tbody tr td {
	font-size: 15px;
	font-family: tahoma
}
</style>



</head>
<body>
	<form name="frmreg" method="post" action="loginCheck">
		<ul>
			<li><a href="ViewAllReg.jsp">All Registrations</a></li>
			<li><a class="active" href="ViewAllUsers.jsp">All Users</a></li>
			<li><a href="Login2.jsp">Logout</a></li>
		</ul>

		<%
			Connection c = null;
			Statement stmt = null;
			String sql = "";
			ResultSet rs = null;

			try {
				Class.forName("org.sqlite.JDBC");
				c = DriverManager.getConnection("jdbc:sqlite:D:/SQLite/test.db");
				c.setAutoCommit(false);
				System.out.println("Opened database successfully");

				stmt = c.createStatement();
				sql = "Select ID, NAME, PASSWORD from STUDENT";

			} catch (ClassNotFoundException e) {
				stmt.close();
				c.close();

				e.printStackTrace();
			}
		%>
		<h2 align="center">
			<font><strong>LIST OF ALL STUDENTS</strong></font>
		</h2>
		<table align="center" cellpadding="5" cellspacing="5" border="1"
			width=100%>
			<tr>

			</tr>
			<tr bgcolor="lightblue">
				<td><b>Email</b></td>
				<td><b>Name</b></td>
				<td><b>Password</b></td>
			</tr>
			<%
				try {
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
						//String course = resultSet.getString("course") ;
			%>
			<tr bgcolor="lightblue">

				<td><%=rs.getString("ID")%></td>
				<td><%=rs.getString("NAME")%></td>
				<td><%=rs.getString("PASSWORD")%></td>

			</tr>

			<%
				}
					stmt.close();
					c.close();

				} catch (Exception e) {
					stmt.close();
					c.close();

					e.printStackTrace();
				}
			%>
		</table>
	</form>
</body>
</html>