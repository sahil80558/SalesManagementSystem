<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Product</title>
<%@ include file="links.jsp"%>
<style>
body {
	background-image: url('Images/back2.jpg');
	background-size: 100%;
	background-repeat: no-repeat;
}

table {
	height: 200px;
}

element.style {
	height: 40px
}

.top-buffer {
	margin-top: 30px;
}

.col-3 {
	width: 22%;
}
</style>
<script>
	function hideTable() {
		$('#updateTable').hide();
	}
</script>
</head>
<body onload="hideTable();">
	<div class="container-fluid">
		<div class="row">
			<div class="col-3">
				<%@ include file="Menu.jsp"%>
			</div>
			<div class="col-9">
				<center>
					<div class="row">
						<form id="getAllProductDetails">
							<table cellpadding="22px">
								<tr>
									<td align="center" colspan="6"><label
										style="font-size: 24px;"> Search Product</label></td>
								</tr>
								<tr>
									<td>Product Group*</td>
									<td><select id="cmbProductGroup" name="cmbProductGroup">
											<option value="">Select Product Group *</option>
											<option value="paint">Paint</option>
											<option value="tools">Tools</option>
											<option value="hardware">Hardware</option>
											<option value="pipe">Pipe and Cistern</option>
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
									<td><input type="text" placeholder="Product Code" autocomplete="off"
										id="searchbyid" name="productCode" required></td>
								</tr>
								<tr>
									<td>Product Name</td>
									<td><input type="text" placeholder="Product Name" autocomplete="off"
										name="productName" id="searchbyname"
										required></td>
								</tr>
								<tr>
									<td align="center" colspan="2">
										<button name="search" class="B" id="search">Search</button>
									</td>
								</tr>
							</table>
						</form>
						<div class="col-md-6"
							style="position: relative; margin-top: -96px; margin-left: 598px; height: 40px;">
							<div class="list-group" id="show-list1"></div>
						</div>
						<div class="col-md-5"
							style="position: relative; margin-top: -169px; margin-left: 598px; height: 40px;">
							<div class="list-group" id="show-list2"></div>
						</div>
						<span style="color:white; font-size:24px;" id="updated"></span>
					</div>
					<div class="row top-buffer">
						<form id="updateForm">
							<table cellpadding="22px" id="updateTable">
								<tr>
									<td align="center" colspan="6"><label
										style="font-size: 24px;"> Update Product Details</label></td>
								</tr>
								<tr>
									<td>Product Code</td>
									<td><input type="text" placeholder="Product Code"
										id="updateProductCode" name="updateProductCode" required
										readonly></td>
									<td>Product Type</td>
									<td><input type="text" placeholder="Product Type"
										id="updateProductType" name="updateProductType" required
										readonly></td>
									<td>Product Name</td>
									<td><input type="text" placeholder="Product Name"
										id="updateProductName" name="updateProductName" required></td>
								</tr>
								<tr>
									<td>Cost Price</td>
									<td><input type="text" placeholder="Cost Price"
										id="updateCostPrice" name="updateCostPrice" required></td>
									<td>Customer Price</td>
									<td><input type="text" placeholder="Customer Price"
										id="updateCustomerPrice" name="updateCustomerPrice" required></td>
									<td>Builder Price</td>
									<td><input type="text" placeholder="Builder Price"
										id="updatebuilderPrice" name="updatebuilderPrice" required></td>
								</tr>
								<tr>
									<td>Labour Price</td>
									<td><input type="text" placeholder="Labour Price"
										id="updateLabourPrice" name="updateLabourPrice" required></td>
									<td>Description</td>
									<td><input type="text" placeholder="Description"
										id="updateDescription" name="updateDescription" required></td>
									<td>Available Quantity</td>
									<td><input type="text" placeholder="Available Quantity"
										id="updateQuantity" name="updateQuantity" required></td>
								</tr>
								<tr>
									<td align="center" colspan="6"><input class="B"
										type="submit" value="Update"></td>
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
	<script src="js/SearchProduct.js"></script>
	<script src="js/GetDetails.js"></script>
</body>
</html>
