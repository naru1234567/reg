<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

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
	<form name="frmreg" method="post" action="enroll">
		<ul>
			<li><a class="active" href="Enroll.jsp">Enroll</a></li>
			<li><a href="AllMyReg.jsp">My Registrations</a></li>
			<li><a href="Login2.jsp">Logout</a></li>
		</ul>

		<table align="center" cellpadding="5" cellspacing="5">

			<%
				String ID = (String) session.getAttribute("ID");
				//out.print("Hello User: You have entered the name: "+ID);
			%>
			<tr>
				<td fontsize:15px;fontfamily=tahoma>Keyin the date:
					(dd/mm/yyyy)</td>
				<td><input type="date" name="coursedate"
					fontsize:15px;fontfamily=tahoma></input></td>
			</tr>



			<tr>
				<td>Select course</td>
				<td><select name="coursename">
						<option value="Course1">Course1</option>
						<option value="Course2">Course2</option>
						<option value="Course3">Course3</option>
						<option value="Course4">Course4</option>
				</select></td>
			</tr>
			<tr>
				<td><input type=submit value="Enroll"></td>
				<td><input type=button value="Clear"
					onclick="javascript:clearAll()"></td>
			</tr>
			<tr>
				<td><input type=hidden value=<%=ID%> name=ID></td>
			</tr>

		</table>
	</form>
</body>
</html>