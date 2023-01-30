<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<%@ include file="links.jsp"%>
<style>
body {
	background-image: url('Images/back2.jpg');
	background-size: 100%;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<%@ include file="Menu.jsp"%>
			</div>
			<div class="col">
				<div class="container-fluid">
					<div class="row"><h2 style="color:white;">Add Product</h2></div>
				</div>
				<div class="row">
					<form action="">
						<table cellpadding="22px">
							<tr>
								<td>Product Group*</td>
								<td> <select  id="cmbUserType" name="cmbProductGroup">
                                        <option value="">Select Product Group *</option>
                                        <option value=Student>Paint</option>
                                        <option value=Faculty>Tools</option>
                                        <option value=Faculty>Hardware</option>
                                        <option value=Faculty>Pipe&Cistern</option>
                                        <option value=Faculty>Sanitary</option>
                                        <option value=Faculty>Plumbing</option>
                                        <option value=Faculty>Bathroom</option>
                                        <option value=Faculty>Electrics</option>
                                        <option value=Faculty>Locks</option>
                                        <option value=Faculty>Woods</option>
                                    </select></td>
							</tr>
							<tr>
								<td>Product Code</td>
								<td><input type="text" placeholder="Product Code" name="productCode"
									required readonly></td>
							</tr>

							<tr>
								<td>Product Name</td>
								<td><input type="text" placeholder="Product Name" name="productName"
									required></td>
							</tr>
							<tr>
								<td>Cost Price</td>
								<td><input type="text" placeholder="Cost Price" name="costPrice"
									required></td>
							</tr>
							<tr>
								<td>Customer Price</td>
								<td><input type="text" placeholder="Customer Price" name="customerPrice"
									required></td>
							</tr>
								<tr>
								<td>Builder Price</td>
								<td><input type="text" placeholder="Builder Price" name="builderPrice"
									required></td>
							</tr>
							<tr>
								<td>Labour Price</td>
								<td><input type="text" placeholder="Labour Price" name="LabourPrice"
									required></td>
							</tr>
							<tr>
								<td>Description</td>
								<td><textarea  name="description"></textarea></td>
							</tr>
							<tr>
								<td align="center" colspan="2"><input class="B"
									type="submit" value="Insert"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>