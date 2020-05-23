<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<script>
function clearAll(){
	document.frmLogin.username.value="";
	document.frmLogin.password.value="";
	return;
}	

</script>
<body>
	<form name="frmLogin" method="post" action="loginCheck">
		
		<table align="center" cellpadding="15" cellspacing="5" >
			<tr>
				<td>Username:</td>
				<td><input type=text name="username" maxlength=8></td>
			</tr>


			<tr>
				<td>Password:</td>
				<td><input type=password name="password" maxlength=8></td>
			</tr>

			<tr>
				<td><input type=submit value="login"></td>
				<td><input type=button value="clear" onclick="javascript:clearAll()">
				</td>
			</tr>

			<tr>
				<td colspan=2><a href="Registration.jsp" >New user? Click to register !!</a></td>
			</tr>

		</table>
	</form>
</body>
</html>