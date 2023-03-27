$(document).ready(function() {
	
	//updateProductDetails
	$('#updateForm').on('submit',function(event){
		console.log("called");
		event.preventDefault();
		var d=$(this).serialize();
		console.log(d);
		$.ajax({
			url:"UpdateProductDetailsController",
			data:d,
			type:'GET',
			success: function(data,testStatus,jqXHR){
				console.log(data);
				console.log("Success");
				$('#updated').text(data);
				$('#updateTable').hide();
			},
			error: function(jqXHR,textStatus,errorThrown){
				console.log("error");
			}
		})
	});

	//getproductAllDetails
		$("#search").click(function(e) {
			$('#updated').text(" ");
			$('#updateTable').show();
			e.preventDefault();
			var selectedOption = $('#cmbProductGroup option:selected');
			var productType = selectedOption.val();
			var productId = $("#searchbyid").val();
			var productName = $("#searchbyname").val();
			$.ajax({
				url: "GetProductDetailsController",
				data: {
					"productName": productName,
					"productType": productType,
					"productId": productId
				},
				type: 'GET',
				success: function(data, testStatus, jqXHR) {
					let obj=JSON.parse(data);
					console.log(obj);
					$("#searchbyid").val(obj[0]);
					$("#searchbyname").val(obj[2]);
					$("#updateProductCode").val(obj[0]);
					$("#updateProductType").val(obj[1]);
					$("#updateProductName").val(obj[2]);
					$("#updateCostPrice").val(obj[3]);
					$("#updateCustomerPrice").val(obj[4]);
					$("#updatebuilderPrice").val(obj[5]);
					$("#updateLabourPrice").val(obj[6]);
					$("#updateDescription").val(obj[7]);
					$("#updateQuantity").val(obj[8]);
					console.log("Success");
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.log(data);
					console.log("error");
				}
			})
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
});

