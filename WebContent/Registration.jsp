<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<style>
table tbody tr td {
	font-size: 15px;
	font-family: tahoma
}
</style>
<script>
	function clearAll() {
		document.frmreg.userid.value = "";
		document.frmreg.username.value = "";		
		document.frmreg.password.value = "";
		document.frmreg.password1.value = "";
		return;
	}
	
	function validate() {
		var userid = document.frmreg.userid.value.trim();
		var uname = document.frmreg.username.value.trim();
		var password = document.frmreg.password.value.trim();
		var password1 = document.frmreg.password1.value.trim();
		
		if (userid.length ==0 ){
			alert("Please enter a valid Email!");
			document.frmreg.userid.focus();
			return false;
		}
		
		if (uname.length ==0 ){
			alert("Please enter a valid User name!");
			document.frmreg.username.focus();
			return false;
		}
		
		
		if (password.length ==0 ){
			alert("Please enter a valid password!");
			document.frmreg.password.focus();
			return false;
		}
		
		if (password != password1){
			alert("Password fields must have the same value!");
			document.frmreg.password.focus();
			return false;			
		}
			
		
		document.frmreg.action = "reg";
		document.frmreg.method = "post";
		document.frmreg.submit();
	}


</script>
<body>
	<form name="frmreg"> <!-- method="post" action="reg"> --> 
		<table align="center" cellpadding="5" cellspacing="5"
			bgcolor=lightblue width=100%>
			<tr>
				<td colspan=2><img src="logo-beingsattvaa-white.png"></td>
			</tr>
			<%
				String name = (String) session.getAttribute("ID");
				//out.print("Hello User: You have entered the name: "+name);
			%>
			<tr>
				<td>Email:</td>
				<td><input type=text name="userid" maxlength=25></td>
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
				<td>Confirm Password:</td>
				<td><input type=password name="password1" maxlength=8></td>
			</tr>

			<tr>
				<td></td>
				<td><input type=button value="Enroll"
					onClick="javascript:validate()"> <input type=button
					value="Clear" onclick="javascript:clearAll()"></td>
			</tr>


		</table>
	</form>
</body>
</html>