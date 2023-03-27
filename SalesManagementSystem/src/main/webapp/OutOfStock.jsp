<%@page import="java.sql.*"%>
<%@page import="com.sales.db.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Out of stock products</title>
<%@ include file="links.jsp"%>
<style>
body {
	background-image: url('Images/back2.jpg');
	background-size: 100%;
	background-repeat: no-repeat;
}

table {
	height: 100px;
	font-size: 20px;
}

.my-custom-scrollbar {
	position: relative;
	height: 600px;
	overflow: auto;
}

.table-wrapper-scroll-y {
	display: block;
}

.table { -
	-bs-table-striped-color: white; -
	-bs-table-bg: #004979;
}
</style>
<script type="text/javascript">
	function checkProductType() {
		var productType = document.getElementById('cmbProductGroup').value;
		if (productType === "") {
			alert("Please select product group");
			return false;
		}
		return true;
	}
</script>
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
				<div class="container-fluid">
					<div class="row">
						<h2 style="color: white;">Show All Products</h2>
					</div>
				</div>
				<div class="row">
					<form onsubmit="return checkProductType()" action="OutOfStock.jsp">
						<table cellpadding="22px">
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
								<td><input type="submit" class="btn btn-primary"
									value="Show" name="show"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="row">
					<div class="table-wrapper-scroll-y my-custom-scrollbar">
						<table class="table table-bordered  mb-0 "
							style="color: white; background-color: #005ce6;">
							<thead>
								<tr>
									<th scope="col">S.No.</th>
									<th scope="col">Product Id</th>
									<th scope="col">Product Type</th>
									<th scope="col">Product Name</th>
									<th scope="col">Cost Price</th>
									<th scope="col">Description</th>
									<th scope="col">Available Quantity</th>
								</tr>
							</thead>
							<tbody>
								<%
								String s1 = request.getParameter("show");
								int i = 1;
								if (s1 != null) {
									String productType = request.getParameter("cmbProductGroup");
									try {
										Statement st = ConnectionProvider.getObject().st;
										String q = "select * from " + productType + " where availableQuantity<10 order by availableQuantity asc";
										ResultSet rs = st.executeQuery(q);
										while (rs.next()) {
								%>
								<tr>
									<th scope="row"><%=i++%></th>
									<td><%=rs.getString(1)%></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getString(8)%></td>
									<td><%=rs.getString(9)%></td>
								</tr>
								<%
								}
								} catch (Exception e) {
								%>
								<span style="color: white; font-size: 24px;"><%=e%></span>
								<%
								System.out.println(e);
								}
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>