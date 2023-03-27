$(document).ready(function() {

	$("#checkout").click(function() {
		var customerName = $("#customerName").val();
		var customerNumber = $("#customerNumber").val();
		var customerAddress = $("#address").val();
		var deliveryAddress = $("#deliveryAddress").val();
		var billTotal = $("#total").val();
		var gst = $("#gst").val();
		var selectedOption = $('#cmbPaymentMode option:selected');
		var paymentMode = selectedOption.val();
		var billNumber = $("#billNumber").text().toString();
		var date = new Date().toLocaleDateString('en-ZA');
		var time = new Date().toLocaleTimeString('en-US', { hour12: false });

		if (billTotal === '' || customerName === '') {
			alert("Please add details");
			return;
		}

		var items = [];
		for (i = 0; i < count; i++) {
			items[i] = [];
			items[i][0] = document.getElementById('productName' + (i + 1)).value;
			items[i][1] = document.getElementById('quantity' + (i + 1)).value;
			items[i][2] = document.getElementById('price' + (i + 1)).value;
			items[i][3] = parseInt(document.getElementById('price' + (i + 1)).value) * parseInt(document.getElementById('quantity' + (i + 1)).value);
		}
		var jsonArray = JSON.stringify(items);
		console.log(jsonArray);

		$.ajax({
			url: "CreateBillController",
			method: "Post",
			data: {
				billItems: jsonArray,
				customerName: customerName,
				customerAddress: customerAddress,
				customerNumber: customerNumber,
				deliveryAddress: deliveryAddress,
				billTotal: billTotal,
				paymentMode: paymentMode,
				billNumber: billNumber,
				date: date,
				time: time,
				gst:gst
			},
			success: function(response) {
				if (response == 'done') {
					window.location.href = 'CreateBill.jsp';
					$("#billStatus1").text(response);
				} else {
					$("#billStatus1").text(response);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				$("#billStatus1").text(errorThrown);
			}
		});

	});

	$("#modalOnClose").click(function() {
		$("#searchbyid").val("");
		$("#searchbyname").val("");
	});

	// Search by Id
	$("#searchbyid").keyup(function() {
		let searchText = $(this).val();
		let selectedOption = $('#cmbProductGroup option:selected');
		let productType = selectedOption.val();

		if (productType != "") {
			if (searchText != "") {
				$.ajax({
					url: "SearchByNameController",
					method: "GET",
					data: {
						searchId: searchText,
						productType: productType
					},
					success: function(response) {
						$("#show-list2").html(response);
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log("error");
						$("#show-list1").html(errorThrown);
					}
				});
			} else {
				$("#show-list2").html("");
			}
		} else {
			alert("Please Select Product Type");
		}
	});

	// Search by name
	$("#searchbyname").keyup(function() {
		let searchText = $(this).val();
		let selectedOption = $('#cmbProductGroup option:selected');
		let productType = selectedOption.val();

		if (productType != "") {
			if (searchText != "") {
				$.ajax({
					url: "SearchByNameController",
					method: "GET",
					data: {
						query: searchText,
						productType: productType
					},
					success: function(response) {
						$("#show-list1").html(response);
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log("error");
						$("#show-list1").html(errorThrown);
					}
				});
			} else {
				$("#show-list1").html("");
			}
		} else {
			alert("Please Select Product Type");
		}
	});

	var productIds = {};
	$('#getAllProductDetails').on('submit', function(event) {
		event.preventDefault();
		let productName = document.forms["getAllProductDetails"]["productName"].value;
		let quantity = document.forms["getAllProductDetails"]["quantity"].value;
		let price = document.forms["getAllProductDetails"]["price"].value;
		let productId = document.forms["getAllProductDetails"]["productCode"].value;

		//        productIds.push(productId);

		createRows(productName, quantity, price);
		$("#searchbyid").val("");
		$("#searchbyname").val("");
		$("#price").val("");
		$("#quantity").val("");
		$("#myModal .close").click();
		quan = parseFloat(quantity);
		pri = parseFloat(price);
		subTotal = subTotal + (quan * pri);
		cell5textField.value = subTotal;
		document.getElementById("total").value = subTotal;
		taxtotal = $("#total").val();
		//				$(".modal-backdrop").remove();
		//				$("#myModal").hide();
	});

	var taxtotal;
	var count = 0;
	var subTotal = 0;
	var cell1textField;
	var cell2textField;
	var cell3textField;
	var cell4textField;
	var cell5textField;
	var cell6Button;
	var row;

	//	$("#taxes").keyup(function() {
	//		var tax = $("#taxes").val();
	//		if(!tax.NaN){
	//			$("#total").val(parseInt(taxtotal) + parseInt(tax));			
	//		}else{
	//			$('#total').val(subTotal);
	//		}
	//	});

	function createRows(productName, quantity, price) {
		var table = document.querySelector("#addProduct");

		var arr = [
			{
				name: productName,
				quantity: quantity,
				price: price,
				subtotal: subTotal,
			},
		];

		// Create data rows and cells and add them to the table
		arr.map((x, i) => {
			count++;
			row = document.createElement("tr");
			row.setAttribute("id", "row" + count);
			row.setAttribute("style", "width: 100%;");

			var cell1 = document.createElement("td");
			cell1.setAttribute("style", "width: 10%;");
			cell1textField = document.createElement("INPUT");
			cell1textField.setAttribute("type", "number");
			cell1textField.setAttribute("readonly", "true");
			cell1textField.setAttribute("id", "serial" + count);
			cell1textField.value = count;
			cell1.appendChild(cell1textField);
			row.appendChild(cell1);

			var cell2 = document.createElement("td");
			cell2textField = document.createElement("INPUT");
			cell2textField.setAttribute("type", "text");
			cell2textField.setAttribute("readonly", "true");
			cell2textField.setAttribute("name", "productName" + count);
			cell2textField.setAttribute("id", "productName" + count);
			cell2textField.value = x.name;
			cell2.appendChild(cell2textField);
			row.appendChild(cell2);

			var cell3 = document.createElement("td");
			cell3textField = document.createElement("INPUT");
			cell3textField.setAttribute("type", "number");
			cell3textField.setAttribute("readonly", "true");
			cell3textField.setAttribute("name", "quantity" + count);
			cell3textField.setAttribute("id", "quantity" + count);
			cell3textField.value = x.quantity;
			cell3.appendChild(cell3textField);
			row.appendChild(cell3);

			var cell4 = document.createElement("td");
			cell4textField = document.createElement("INPUT");
			cell4textField.setAttribute("type", "number");
			cell4textField.setAttribute("name", "price" + count);
			cell4textField.setAttribute("readonly", "true");
			cell4textField.setAttribute("id", "price" + count);
			cell4textField.value = x.price;
			cell4.appendChild(cell4textField);
			row.appendChild(cell4);

			var cell5 = document.createElement("td");
			cell5textField = document.createElement("INPUT");
			cell5textField.setAttribute("type", "number");
			cell5textField.setAttribute("readonly", "true");
			cell5textField.setAttribute("name", "subtotal" + count);
			cell5textField.setAttribute("id", "subtotal" + count);
			cell5.appendChild(cell5textField);
			row.appendChild(cell5);

			var cell6 = document.createElement("td");
			cell6.setAttribute("style", "width: 10%;");
			cell6Button = document.createElement("button");
			cell6Button.setAttribute("class", "closeButton");
			cell6Button.setAttribute("id", "closeButton" + count);
			cell6Button.innerHTML = "Delete";
			cell6.appendChild(cell6Button);
			cell6Button.onclick = function() { deleteRow(this.id); }
			row.appendChild(cell6);

			table.appendChild(row);
		});
	}

	function deleteRow(id) {
		var getId = id.split('');
		var changeId = parseInt(getId[getId.length - 1]);

		var row = document.getElementById("row" + changeId);
		var quan = document.getElementById("quantity" + changeId).value;
		var pric = document.getElementById("price" + changeId).value;
		//calculating subtotal after deletion
		var sub = quan * pric;
		subTotal = subTotal - sub;
		// removing deleted row
		row.parentNode.removeChild(row);

		// loop for changing id, names and subtracting form all cell after deleting
		for (i = changeId + 1; i <= count; i++) {
			var changeRow = document.getElementById("row" + i);
			changeRow.setAttribute("id", "row" + (i - 1));

			var changeSerial = document.getElementById("serial" + i);
			changeSerial.setAttribute("id", "serial" + (i - 1));
			changeSerial.value = (i - 1);

			var changeNameId = document.getElementById("productName" + i);
			changeNameId.setAttribute("id", "productName" + (i - 1));
			changeNameId.setAttribute("name", "productName" + (i - 1));

			var changeQuantityId = document.getElementById("quantity" + i);
			changeQuantityId.setAttribute("id", "quantity" + (i - 1));
			changeQuantityId.setAttribute("name", "quantity" + (i - 1));

			var changePriceId = document.getElementById("price" + i);
			changePriceId.setAttribute("id", "price" + (i - 1));
			changePriceId.setAttribute("name", "price" + (i - 1));

			var changeSubTotalId = document.getElementById("subtotal" + i);
			changeSubTotalId.setAttribute("id", "subtotal" + (i - 1));
			changeSubTotalId.setAttribute("name", "subtotal" + (i - 1));
			var temp = changeSubTotalId.value;
			changeSubTotalId.value = (temp - sub);

			var changeCloseButtonId = document.getElementById("closeButton" + i);
			changeCloseButtonId.setAttribute("id", "closeButton" + (i - 1));
			changeCloseButtonId.setAttribute("name", "closeButton" + (i - 1));

		}
		count--;
		document.getElementById("total").value = subTotal;
	}
});

