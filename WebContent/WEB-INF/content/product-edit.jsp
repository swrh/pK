<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<c:import url="header.jsp" />

<script type="text/javascript">
	$(document).ready(function() {
		$('#product_name').focus();

		$('#btn_cancelar').click(function() {
			$.fn.disable_form();
			$.fn.clear_form();
			$.fn.clear_errors();
			document.location = 'product-list';
		});

		$('#btn_salvar').click(function() {
			$('#btn_salvar').attr('disabled', 'disabled');
			$('#form').submit();
		});

		$('#btn_apagar').click(function() {
			if (confirm("Deseja realmente apagar este registro?")) {
				document.location = 'product-delete?product.id=' + $('#product_id').val();
			}
		});
	});

	$.fn.disable_form = function() {
		$('#product_name').attr('disabled', 'disabled');
		$('#product_description').attr('disabled', 'disabled');
	};

	$.fn.clear_errors = function() {
		$('.errorMessage').hide();
	};

	$.fn.clear_form = function() {
		$(':input', '#form').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
	};
</script>

<div id="cadastro">
	<br />
	<fieldset>
		<legend>Cadastro de Produtos</legend>
		<form id="form" name="formRep" action="product-update" method="post">
			<br />
			<div class="holder">Código:</div>
			<input type="text" id="product_id" name="product.id"
				value="${product.id}" disabled="disabled" />
			<input type="hidden" id="product_id" name="product.id"
				value="${product.id}" />

			<br />
			<div class="holder">Nome:</div>
			<input type="text" id="product_name" name="product.name" size="25"
				maxlength="40" value="${product.name}" />

			<br />
			<div class="holder">Descrição:</div>
			<input type="text" id="product_description" name="product.description" size="25"
				maxlength="40" value="${product.description}" />

			<br />
			<div class="holder">Criação:</div>
			<input type="text" id="product_creationDate" name="product.creationDate" size="25"
				maxlength="40" value="${product.creationDateString}" disabled="disabled" />
			<input type="hidden" id="product_creationDate" name="product.creationDate"
				value="${product.creationDate}" />

			<br />
			<div class="holder">Última modificação:</div>
			<input type="text" id="product_modificationDate" name="product.modificationDate" size="25"
				maxlength="40" value="${product.modificationDateString}" disabled="disabled" />
			<input type="hidden" id="product_modificationDate" name="product.modificationDate"
				value="${product.modificationDate}" />

			<br />
			<div class="holder"></div>

			<s:fielderror fieldName="product.name" />
			<s:fielderror fieldName="product.description" />

			<br />
			<input type="submit" id="btn_salvar" value="Salvar" />
			<input type="button" id="btn_cancelar" value="Cancelar" />
			<input type="button" id="btn_apagar" value="Apagar" />

		</form>

		<div class="holder"></div>

	</fieldset>
	<br />
</div>

<c:import url="footer.jsp" />
