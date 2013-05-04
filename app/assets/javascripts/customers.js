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

    $('#customer_item_id').change(function() {
    	// alert('yes')
    	var self = $(this);
    	// alert(self.val());
    	$.ajax({
          type: "POST",
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
          // url: '/contacts/'+id+'/add_family_info',
          url: 'load_brand/'+self.val(),
          success: function(msg){

          },
          error: function(){
          	alert('Yes');
          }
        });

    });
});


// jQuery ->
//   $("a[rel=popover]").popover()
//   $(".tooltip").tooltip()
//   $("a[rel=tooltip]").tooltip()