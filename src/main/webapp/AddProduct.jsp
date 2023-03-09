<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
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
			<div class="col-3">
				<%@ include file="Menu.jsp"%>
			</div>
			<div class="col-9">
				<center>
					<div class="container-fluid">
						<div class="row">
							<h2 style="color: white;" id="head">Add Product</h2>
						</div>
					</div>
					<div class="row">
						<form action="GetProductIdController" id="myform">
							<table cellpadding="20px">
								<tr>
									<td>Product Group*</td>
									<td><select id="cmbProductGroup" name="cmbProductGroup">
											<option value="">Select Product Group *</option>
											<option value="paint">Paint</option>
											<option value="tools">Tools</option>
											<option value="hardware">Hardware</option>
											<option value="pipe">Pipe&Cistern</option>
											<option value="sanitary">Sanitary</option>
											<option value="plumbing">Plumbing</option>
											<option value="bathroom">Bathroom</option>
											<option value="electric">Electrics</option>
											<option value="locks">Locks</option>
											<option value="woods">Woods</option>
									</select></td>
								</tr>
								<tr>
									<td>Product Code</td>
									<td><input type="text" name="productCode" id="productCode"
										required readonly value="" /></td>
								</tr>
								<tr>
									<td>Product Name</td>
									<td><input type="text" placeholder="Product Name"
										id="productName" name="productName" required/></td>
								</tr>
								<tr>
									<td>Quantity</td>
									<td><input type="text" placeholder="Quantity" id="quantity"
										name="quantity" required/></td>
								</tr>
								<tr>
									<td>Cost Price</td>
									<td><input type="text" placeholder="Cost Price"
										id="costPrice" name="costPrice" required/></td>
								</tr>
								<tr>
									<td>Customer Price</td>
									<td><input type="text" placeholder="Customer Price" id="customerPrice"
										name="customerPrice" required/></td>
								</tr>
								<tr>
									<td>Builder Price</td>
									<td><input type="text" placeholder="Builder Price" id="builderPrice"
										name="builderPrice" required/></td>
								</tr>
								<tr>
									<td>Labour Price</td>
									<td><input type="text" placeholder="Labour Price" id="LabourPrice"
										name="LabourPrice" required/></td>
								</tr>
								<tr>
									<td>Description</td>
									<td><textarea name="description" id="description"></textarea></td>
								</tr>
								<tr>
									<td align="center" colspan="2"><input class="B"
										type="submit" value="Insert"></td>
								</tr>
								<tr>
									<td align="center" colspan="2"><h3 id="success"></h3></td>
								</tr>
							</table>
						</form>
					</div>
				</center>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous"></script>
	<script src="js/AddProduct.js"></script>
</body>
</html>
