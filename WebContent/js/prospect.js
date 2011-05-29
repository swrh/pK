$(document).ready(function() {
	$('#new_hist').hide();

	//Shows the textbox and allows the user to enter text.
	$('#new_hist_link').click(function(e) {
		$('#new_hist').show("fast");
		$('#new_hist_link').hide('fast');
		$('#history_text').focus();
	});

	//Cancel the history item
	$('#new_hist_cancel').click(function(e) {
		$('#history_text').val('');
		$('#new_hist').hide('fast');
		$('#new_hist_link').show('fast');
	});

	$('#new_hist_ok').click(function(e) {

		if($('#history_text').val() == ''){

			alert('Por favor, digite informações válidas no histórico.');
			$('#history_text').focus();

		} else {

			//alert('HistoryAdd?prospect.id=' + 'path do prospect id.val' + '&prospect.history=' + $('#history_text').val());
			//$.post('HistoryAdd?prospect.id=' + 'path do prospect id.val' + '&prospect.history=' + $('#history_text').val()), function(data) {

				//Perform POST to URL and check 200 status
				//alert('Post feito');

			//}

			//Remove the #nohistory node if it exists.
			if ($('#nohistory').length != 0)
				$('#nohistory').remove();

			//alert('<tr id="history_item"><td>' + $('#history_text').val() + '</td></tr>');

			//Add a new item to the history list after post
			//You have to add the <table> tag otherwise it doesn't works on IE.
			$('#historydata').append('<table><tr id="history_item"><td>' + $('#history_text').val() + '</td></tr></table><hr>');

			//Calls the cancel button
			$('#new_hist_cancel').click();

		}

	});

	$("select:#selected_customer_id").change(function () {
		var id = $("select:#selected_customer_id option:selected").val();
		$.post("customer-json", { "customer.id" : id }, function(json) {
			var c = json.customer;

			$.fn.update_customer(c);
		})
		.error(function() {
			var c = {
				id                     : "",
				companyName            : "",
				cnpj                   : "",
				ie                     : "",
				email                  : "",
				phone                  : "",
				mobile                 : "",
				fax                    : "",
				address                : "",
				neighborhood           : "",
				city                   : "",
				state                  : "",
				zipCode                : "",
				creationDateString     : "",
				modificationDateString : ""
			};

			$.fn.update_customer(c);
		});
	}).trigger('change');

	$("select:#selected_proposalStatus_id").change(function () {
		var id = $("select:#selected_proposalStatus_id option:selected").val();
		$.post("proposalStatus-json", { "proposalStatus.id" : id }, function(json) {
			var s = json.proposalStatus;

			$.fn.update_proposalStatus(s);
		})
		.error(function() {
			var s = {
				finishing              : false
			};

			$.fn.update_proposalStatus(s);
		});
	}).trigger('change');
});

$.fn.update_customer = function(c) {
	$("input:#customer_id"                     ).val(c.id                     );
	$("input:#customer_companyName"            ).val(c.companyName            );
	$("input:#customer_cnpj"                   ).val(c.cnpj                   );
	$("input:#customer_ie"                     ).val(c.ie                     );
	$("input:#customer_email"                  ).val(c.email                  );
	$("input:#customer_phone"                  ).val(c.phone                  );
	$("input:#customer_mobile"                 ).val(c.mobile                 );
	$("input:#customer_fax"                    ).val(c.fax                    );
	$("input:#customer_address"                ).val(c.address                );
	$("input:#customer_neighborhood"           ).val(c.neighborhood           );
	$("input:#customer_city"                   ).val(c.city                   );
	$("input:#customer_state"                  ).val(c.state                  );
	$("input:#customer_zipCode"                ).val(c.zipCode                );
	$("input:#customer_creationDateString"     ).val(c.creationDateString     );
	$("input:#customer_modificationDateString" ).val(c.modificationDateString );
};

$.fn.update_proposalStatus = function(s) {
	if (s.finishing)
		$("input:#proposalStatus_finishing"        ).attr("checked", "checked");
	else
		$("input:#proposalStatus_finishing"        ).removeAttr("checked");
};
