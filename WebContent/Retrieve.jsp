<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
	sql ="Select ID, Date, COURSE from Registration";
	
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}

%>
<h2 align="center"><font><strong>LIST OF ALL REGISTRATIONS</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>ID</b></td>
<td><b>Date</b></td>
<td><b>Course</b></td>
</tr>
<%
try{ 
rs = stmt.executeQuery(sql);
while(rs.next()){
	//String course = resultSet.getString("course") ;
%>
<tr bgcolor="#DEB887">

<td><%=rs.getString("ID") %></td>
<td><%=rs.getString("DATE") %></td>
<td><%=rs.getString("COURSE") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>