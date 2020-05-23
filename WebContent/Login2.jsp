<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
table tbody tr td {
  font-size: 15px;
  font-family: tahoma
}

</style>
</head>
<script>
function clearAll(){
	document.frmLogin.username.value="";
	document.frmLogin.password.value="";
	return;
}	

function validate(){
	//alert("called");
	var login = document.frmLogin.username.value.trim();
	var password = document.frmLogin.password.value.trim();
	//alert(login);	
	if (login.length ==0 ){
		alert("Please enter a valid login!");
		document.frmLogin.username.focus();
		return false;
	}
	
	if (password.length ==0 ){
		alert("Please enter a valid password!");
		document.frmLogin.password.focus();
		return false;
	}
	
	document.frmLogin.action = "loginCheck";
	document.frmLogin.method = "post"; 
	document.frmLogin.submit();
	
}
</script>
<body>
	<form name="frmLogin"> <!--  method="post" action="loginCheck"> -->
	
		<table align="center" cellpadding="5" cellspacing="5" bgcolor=lightblue width=100%>
		<tr>
		<td colspan=2>
		<img src="logo-beingsattvaa-white.png">
		
		</td>
		</tr>

			<tr>
				<td>Username:</td>
				<td><input type=text name="username" maxlength=8></td>
			</tr>


			<tr>
				<td>Password:</td>
				<td><input type=password name="password" maxlength=8></td>
			</tr>

			<tr>
				<td></td>
				<td><input type=button value="Login" onclick="javascript:validate()">
				<input type=button value="Clear" onclick="javascript:clearAll()">
				</td>
			</tr>

			<tr>
				<td colspan=2><a href="Registration.jsp" >New user? Click to register !!</a></td>
			</tr>

		</table>
	</form>
</body>
</html>