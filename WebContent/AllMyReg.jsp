<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<html>
<head>
<title>View - All my registration</title>

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

input[type="text"] {
	font-size: 15px;
	font-family: Tahoma;
}

table tbody tr td {
	font-size: 15px;
	font-family: tahoma
}
</style>



</head>
<script>
	function clearAll() {
		document.frmLogin.userid.value = "";
		document.frmLogin.username.value = "";
		document.frmLogin.password.value = "";
		document.frmLogin.password1.value = "";
		return;
	}
</script>
<body>
	<form name="frmmyreg">
		<ul>
			<li><a href="Enroll.jsp">Enroll</a></li>
			<li><a class="active" href="AllMyReg.jsp">My Registrations</a></li>
			<li><a href="Login2.jsp">Logout</a></li>
		</ul>
		<%
			String ID = (String) session.getAttribute("ID");
			out.print("Hello User: You have entered the name: " + ID);
		%>

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
				sql = "Select ID, Date, COURSE from Registration where ID = '" + ID + "';";

				rs = stmt.executeQuery(sql);
			} catch (ClassNotFoundException e) {
				stmt.close();
				c.close();
				e.printStackTrace();
			}
		%>
		
	
		<h2 align="center">
			<font><strong>MY REGISTRATIONS</strong></font>
		</h2>
		<table align="center" cellpadding="5" cellspacing="5" border="1" width=100%>
			<tr>

			</tr>
			<tr bgcolor="lightblue">
				<td><b>Email</b></td>
				<td><b>Date</b></td>
				<td><b>Course</b></td>
			</tr>
			<%
				try {
					//rs.beforeFirst();
					//rs = stmt.executeQuery(sql);
					while (rs.next()) {
						//String course = resultSet.getString("course") ;
			%>
			<tr bgcolor="lightblue">

				<td><%=rs.getString("ID")%></td>
				<td><%=rs.getString("DATE")%></td>
				<td><%=rs.getString("COURSE")%></td>

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