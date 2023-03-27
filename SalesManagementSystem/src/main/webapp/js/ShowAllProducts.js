$(document).ready(function() {
	$('#cmbProductGroup').change(function() {
		console.log("ddd");
		var selectedOption = $('#cmbProductGroup option:selected');
		var data1 = selectedOption.val();

		$.ajax({
			url: "ShowAllProductController",
			data: {
				"productType": data1
			},
			type: 'GET',
			success: function(data, testStatus, jqXHR) {
				console.log("Success");
				console.log(data);
				createTable(data);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log("error");
			}
		})
	});

	function createTable(data){
		var allProductDetail = JSON.parse(data);
		console.log(allProductDetail);
	}
});
