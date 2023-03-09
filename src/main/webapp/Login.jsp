<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<script type="text/javascript">
	
</script>
<link rel="stylesheet" type="text/css" href="CSS/style3.css">
<style>
body {
	background-image: url('Images/back2.jpg');
	background-size: 100%;
	background-repeat: no-repeat;
}
table {
	margin-top: 200px;
	height: 274px;
	width: 450px;
}
</style>
</head>
<body>
	<center>
		<form method="post" action="UserVerification">
			<table cellpadding="16px">
				<tr>
					<td>Enter Name</td>
					<td><input type="text" placeholder="Enter Name"
						name="username" required></td>
				</tr>
				<tr>
					<td>Enter Password</td>
					<td><input type="password" placeholder="Enter Password"
						name="password" required id="pass"></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input class="B" type="submit"
						value="Login"></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><a href="#">Forget Password</a></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>