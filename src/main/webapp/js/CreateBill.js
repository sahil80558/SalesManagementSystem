$(document).ready(function() {

	$("#modalOnClose").click(function() {
		$("#cmbProductGroup").val("");
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
				});
			} else {
				$("#show-list1").html("");
			}
		} else {
			alert("Please Select Product Type");
		}
	});


	$('#getAllProductDetails').on('submit', function(event) {
		event.preventDefault();
		var d = $(this).serialize();
		$.ajax({
			url: "CreateBillAddProductController",
			data: d,
			type: 'GET',
			success: function(data, testStatus, jqXHR) {
				console.log("Success");
				createRows(data);
				$("#cmbProductGroup").val("");
				$("#searchbyid").val("");
				$("#searchbyname").val("");
				//				$(".modal-backdrop").remove();
				$("#myModal .close").click();
				//				$("#myModal").hide();
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log("error");
			}
		})
	});

	var count = 0;
	var subTotal = 0;

	//autoSubtotal
	$("#quantity1").keyup(function() {
		console.log("qqqqqqqqq");
		let quantity1 = parseFloat($(this).val());
		let price1 = parseFloat($("#price1").val());
		let t = quantity1 * price;
		$("#subtotal").val(t);
	});

	function createRows(data) {

		var jsondata = JSON.parse(data);
		var table = document.querySelector("#addProduct");

		const arr = [
			{
				name: jsondata[2],
				quantity: jsondata[4],
				price: jsondata[4],
				subtotal: subTotal,
			},
		];

		// Create data rows and cells and add them to the table
		arr.map((x, i) => {
			var row = document.createElement("tr");

			count++;
			var cell1 = document.createElement("td");
			var cell1textField = document.createElement("INPUT");
			cell1textField.setAttribute("type", "number");			
			cell1.textContent = count;
			row.appendChild(cell1);

			var cell2 = document.createElement("td");
			var cell2textField = document.createElement("INPUT");
			cell2textField.setAttribute("type", "text");
			cell2textField.setAttribute("name", "productName" + count);
			cell2textField.setAttribute("id", "productName" + count);
			cell2textField.value = x.name;
			cell2.appendChild(cell2textField);
			row.appendChild(cell2);

			var cell3 = document.createElement("td");
			var cell3textField = document.createElement("INPUT");
			cell3textField.setAttribute("type", "number");
			cell3textField.setAttribute("name", "quantity" + count);
			cell3textField.setAttribute("id", "quantity" + count);
			cell3.appendChild(cell3textField);
			row.appendChild(cell3);
			console.log(cell3textField);

			var cell4 = document.createElement("td");
			var cell4textField = document.createElement("INPUT");
			cell4textField.setAttribute("type", "number");
			cell4textField.setAttribute("name", "price" + count);
			cell4textField.setAttribute("id", "price" + count);
			cell4textField.value = x.price;
			cell4.appendChild(cell4textField);
			row.appendChild(cell4);

			var cell5 = document.createElement("td");
			var cell5textField = document.createElement("INPUT");
			cell5textField.setAttribute("type", "number");
			cell5textField.setAttribute("name", "subtotal" + count);
			cell5textField.setAttribute("id", "subtotal" + count);
			cell5.appendChild(cell5textField);
			if (count == 1) cell5textField.value = x.price;
			else cell5textField.value = x.subtotal;
			row.appendChild(cell5);

			table.appendChild(row);
		});
	}
});

