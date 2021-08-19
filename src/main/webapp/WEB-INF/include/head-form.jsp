<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<script language="javascript" type="text/javascript">
			$(window).load(function () {
				$(':input:visible:enabled:first').focus();
			});
		
			$(document).ready(function() {
				$('input:#btn_cancelar').click(function(e) {
					e.preventDefault();
					$.fn.disable_form();
					$.fn.clear_form();
					$.fn.clear_errors();
					document.location = '<%= request.getParameter("cancelUrl") %>';
				});
		
				$('input:#btn_salvar').click(function(e) {
					$('input:#btn_salvar').attr('disabled', 'disabled');
					$('form').submit();
				});
		
				$('input:#btn_apagar').click(function(e) {
					e.preventDefault();
					if (confirm("Deseja realmente apagar este registro?")) {
						$('input:#btn_apagar').attr('disabled', 'disabled');
						document.location = '<%= request.getParameter("deleteUrl") %>';
					}
				});
			});
		
			$.fn.disable_form = function() {
				$(':input').attr('disabled', 'disabled');
			};
		
			$.fn.clear_errors = function() {
				$('.errorMessage').hide();
			};
		
			$.fn.clear_form = function() {
				$(':input', '#form').not(':button, :submit, :reset, :hidden').val('')
						.removeAttr('checked').removeAttr('selected');
			};
		</script>