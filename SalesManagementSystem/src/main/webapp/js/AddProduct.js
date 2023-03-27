let btn = document.querySelector("button");
let select = document.querySelector("select");
let status = document.querySelector("h2");

$(document).ready(function(){
	$('#cmbProductGroup').change(function(){
		var selectedOption=$('#cmbProductGroup option:selected');
		var data1=selectedOption.val();
		
		$.ajax({
			url:"CreateProductIdController",
			data:{"productType":data1},
			type:'GET',
			success: function(data,testStatus,jqXHR){
				$("#productCode").val(data);
				console.log("Success");
			},
			error: function(jqXHR,textStatus,errorThrown){
				console.log("error");
			}
		})
	});
	
		$('#myform').on('submit',function(event){
		event.preventDefault();
		var d=$(this).serialize();
		console.log(d);
		$.ajax({
			url:"InsertProductController",
			data:d,
			type:'GET',
			success: function(data,testStatus,jqXHR){
				$("#success").text(data);
				console.log("Success");
				$("#productCode").val("");
				$("#productName").val("");
				$("#quantity").val("");
				$("#costPrice").val("");
				$("#customerPrice").val("");
				$("#builderPrice").val("");
				$("#LabourPrice").val("");
				$("#description").val("");
			},
			error: function(jqXHR,textStatus,errorThrown){
				console.log(data);
				console.log("error");
			}
		})
	});
	
});

