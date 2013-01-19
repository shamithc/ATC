$(document).ready(function(){
	$( "#customer_dispatch_date" ).datepicker({dateFormat: "yy-mm-dd"});
	$( "#customer_next_followup_date" ).datepicker({dateFormat: "yy-mm-dd"});
	$("#next_followup_next_followup_date").datepicker({dateFormat: "yy-mm-dd"});
	// $("#customer_payment_day").datepicker({dateFormat: "yy-mm-dd"});

// This is to show and hide payment date based on select box


// alert($("#customer_payment_type_id option:selected").val());
   id = $("#customer_payment_type_id option:selected").val();
   hide_payment_date(id);
	$("#customer_payment_type_id").change(function () {
		hide_payment_date($(this).val());
	});

	function hide_payment_date(id){
	    if(id == "2"){
			$(".payment_day").show();
		}else{
			$(".payment_day").hide();
		}
    }
});
