function putData(element) {
	var selectedData = element.textContent;
	let id = element.id;
	if (id == 'a1') {
		getId(selectedData);
		document.getElementById('searchbyname').value = selectedData;
		$("#show-list1").html("");
	} else {
		getName(selectedData);
		document.getElementById('searchbyid').value = selectedData;
		$("#show-list2").html("");
	}
}

function getId(selectedData) {
	var selectedOption = $('#cmbProductGroup option:selected');
	var productType = selectedOption.val();
	$(document).ready(function() {
		$.ajax({
			url: "GetProductDetailsController",
			data: {
				"productName": selectedData,
				"productType": productType
			},
			type: 'GET',
			success: function(data, testStatus, jqXHR) {
				$("#searchbyid").val(data);
				console.log("Success");
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(data);
				console.log("error");
			}
		})
	});
}

function getName(selectedData) {
	var selectedOption = $('#cmbProductGroup option:selected');
	var productType = selectedOption.val();
	$(document).ready(function() {
		$.ajax({
			url: "GetProductDetailsController",
			data: {
				"productId": selectedData,
				"productType": productType
			},
			type: 'GET',
			success: function(data, testStatus, jqXHR) {
				$("#searchbyname").val(data);
				console.log("Success");
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(data);
				console.log("error");
			}
		})
	});
}