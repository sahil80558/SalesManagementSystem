<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Create Invoice</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="https://unpkg.com/purecss@2.0.6/build/pure-min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="license"
	href="https://www.opensource.org/licenses/mit-license/">
<link rel="stylesheet" href="CSS/styleMenu.css" type="text/css" />
<style>
body {
	font-family: "Open Sans", sans-serif;
	line-height: 1.25;
	background-color: #ff9261;
}

.billDetails {
	background-color: #f5ce64;
	color: white;
	width: 100%;
}

td {
	text-align: left;
}
table, th, td {
  border: 2px solid white;
  border-collapse: collapse;
}

#formItem label {
	text-align: left;
	line-height: 150%;
	font-size: .85em;
}

h3 {
	color: black;
}

#invoiceHeading {
	text-align: center;
}

.products {
	background-color: #09f;
	color: white;
	box-shadow: 10px 10px 10px black;
	margin-top: 25px;
	width: 100%;
}

.col-9 {
	width: 79%;
}

.col-3 {
	width: 21%;
}

.modal-dialog { 
	width: 500px; 
	height: 600px;
}
</style>
<!-- <link rel="stylesheet" href="CSS/bill.css"> -->
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-3">
				<%@ include file="Menu.jsp"%>
			</div>
			<div class="col-9">
				<h3 id="invoiceHeading"
					style="background-color: #cbf8ff; color: red;">Invoice</h3>
				<table cellpadding="10px" class="billDetails">
					<colgroup>
						<col span="1" style="width: 15%;">
						<col span="1" style="width: 15%;">
						<col span="1" style="width: 30%;">
						<col span="1" style="width: 30%;">
					</colgroup>
					<tbody>
						<tr>
							<td><h3>Bill No.</h3></td>
							<td><h3>12345</h3></td>
							<td><h3>Customer Name</h3></td>
							<td><input type="text" name="customerName" id="customerName"></td>
						</tr>
						<tr>
							<td><h3>Mobile No.</h3></td>
							<td><input type="number"></td>
							<td style="color: black;"><h3>Date: &nbsp&nbsp&nbsp&nbsp&nbsp<span><script>document.write(new Date().toLocaleDateString('en-GB'));</script></span></h3></td>
							<td style="color: black;"><h3>Time: &nbsp&nbsp&nbsp&nbsp&nbsp<span><script>document.write(new Date().toLocaleTimeString());</script></span></h3></td>
						</tr>
						<tr>
							<td><h3>Address</h3></td>
							<td><input type="text" name="address"></td>
							<td><h3>Payment Mode</h3></td>
							<td><select id="cmbPaymentMode" name="cmbPaymentMode">
									<option value="">Select Payment Mode *</option>
									<option value=Student>Cash</option>
									<option value=Faculty>Card</option>
									<option value=Faculty>Online</option>
									<option value=Faculty>Unpaid</option>
							</select></td>
						</tr>
						<tr>
							<td><h3>GST No.</h3></td>
							<td><input type="text"></td>
							<td><h3>Sold By:</h3></td>
							<td><h3>Agarwal Hardware</h3></td>
						</tr>
					</tbody>
				</table>
				<hr>
				<br>
				<h3>Product Details</h3>
				<table id="addProduct" class="products" cellpadding="10px" style="border: 1px solid black;">
					<tbody>
						<tr>
							<th>S.No</th>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Sub Total</th>
						</tr>
					</tbody>
				</table>
				<div class="container mt-5">
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#myModal">Add
						Product</button>
					<div class="modal" id="myModal">
						<div class="modal-dialog">
							<form id="getAllProductDetails">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Search Product</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" id="modalOnClose"></button>
									</div>
									<div class="modal-body">
										<div class="mb-3">
											<select id="cmbProductGroup" name="cmbProductGroup">
												<option value="">Select Product Group *</option>
												<option value="paint">Paint</option>
												<option value="tools">Tools</option>
												<option value="hardware">Hardware</option>
												<option value="pipes">Pipe and Tanks</option>
												<option value="sanitary">Sanitary</option>
												<option value="plumbing">Plumbing</option>
												<option value="bathroom">Bathroom</option>
												<option value="electrics">Electrics</option>
												<option value="locks">Locks</option>
												<option value="woods">Woods</option>
											</select>
										</div>
										<div class="mb-3">
											<label class="form-label required">Product Id</label> <input autocomplete="off"
												type="text" class="form-control" placeholder="Product Code"
												id="searchbyid" name="productCode" required>
										</div>
										<div class="mb-3">
											<label class="form-label required">Product Name </label> <input autocomplete="off"
												type="text" class="form-control" placeholder="Product Name"
												name="productName" id="searchbyname" required>
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary">Add</button>
									</div>
								</div>
							</form>
						</div>
						<div class="col-md-5"
							style="position: relative; margin-top: -362px; margin-left: 610px; height: 40px;">
							<div class="list-group" id="show-list1"></div>
						</div>
						<div class="col-md-5"
							style="position: relative; margin-top: -120px; margin-left: 610px; height: 40px;">
							<div class="list-group" id="show-list2"></div>
						</div>
					</div>
				</div>
				<br> <br> <br>
				<h3>Taxes:</h3>
				<h3>Total:</h3>
				<br> <br> <br> <br> <a onclick="window.print();"><button
						class="button right-button">Print</button></a> <br> <br> <br>
				<br>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous"></script>
	<script src="js/CreateBill.js"></script>
	<script src="js/GetDetails.js"></script>
 </body>
</html>