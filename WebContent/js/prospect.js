$(document).ready(function() {
			
	$(window).load(function () {
		$(':input:visible:enabled:first').focus();
	});

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
				
	});
			
});