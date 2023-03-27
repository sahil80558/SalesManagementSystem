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
				console.log("Success");
				var jsonData = JSON.parse(data);
				$("#searchbyid").val(jsonData[0]);
				$("#price").val(jsonData[1]);
				$("#quantity").val(jsonData[2]);
			},
			error: function(jqXHR, textStatus, errorThrown) {
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
				console.log("success");
				var jsonData = JSON.parse(data);
				$("#searchbyname").val(jsonData[0]);
				$("#price").val(jsonData[1]);
				$("#quantity").val(jsonData[2]);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log("error");
			}
		})
	});
}