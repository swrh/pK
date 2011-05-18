<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<c:import url="header.jsp" />

<script type="text/javascript">
	$(document).ready(function() {
		$('#customer_name').focus();

		$('#btn_cancelar').click(function() {
			$.fn.disable_form();
			$.fn.clear_form();
			$.fn.clear_errors();
			document.location = 'customer-list';
		});

		$('#btn_salvar').click(function() {
			$('#btn_salvar').attr('disabled', 'disabled');
			$('#form').submit();
		});

	});

	$.fn.disable_form = function() {
		$('#customer_name').attr('disabled', 'disabled');
		$('#customer_reason').attr('disabled', 'disabled');
		$('#customer_cnpj').attr('disabled', 'disabled');
		$('#customer_ie').attr('disabled', 'disabled');
		$('#customer_email').attr('disabled', 'disabled');
		$('#customer_phone').attr('disabled', 'disabled');
		$('#customer_mobile').attr('disabled', 'disabled');
		$('#customer_fax').attr('disabled', 'disabled');
		$('#customer_address').attr('disabled', 'disabled');
		$('#customer_neighborhood').attr('disabled', 'disabled');
		$('#customer_city').attr('disabled', 'disabled');
		$('#customer_state').attr('disabled', 'disabled');
		$('#customer_country').attr('disabled', 'disabled');
		$('#customer_zipCode').attr('disabled', 'disabled');
	};

	$.fn.clear_errors = function() {
		$('.errorMessage').hide();
	};

	$.fn.clear_form = function() {
		$(':input', '#form').not(':button, :submit, :reset, :hidden').val('')
				.removeAttr('checked').removeAttr('selected');
	};
</script>

<div id="cadastro">
	<br />
	<fieldset>
		<legend>Cadastro de Clientes</legend>
		<form id="form" name="formRep" action="customer-create" method="post">
			<br />
			<div class="holder">Código:</div>
			<input type="text" id="customer_id" name="customer.id"
				value="${customer.id}" disabled="disabled" />
			<input type="hidden" id="customer_id" name="customer.id"
				value="${customer.id}" />

			<br />
			<div class="holder">Nome:</div>
			<input type="text" id="customer_name" name="customer.name" size="25"
				maxlength="40" value="${customer.name}" />

			<br />
			<div class="holder">Razão Social:</div>
			<input type="text" id="customer_reason" name="customer.reason" size="25"
				maxlength="40" value="${customer.reason}" />

			<br />
			<div class="holder">CNPJ:</div>
			<input type="text" id="customer_cnpj" name="customer.cnpj" size="25"
				maxlength="40" value="${customer.cnpj}" />

			<br />
			<div class="holder">Inscrição Estadual:</div>
			<input type="text" id="customer_ie" name="customer.ie" size="25"
				maxlength="40" value="${customer.ie}" />

			<br />
			<div class="holder">E-mail:</div>
			<input type="text" id="customer_email" name="customer.email" size="25"
				maxlength="40" value="${customer.email}" />

			<br />
			<div class="holder">Telefone:</div>
			<input type="text" id="customer_phone" name="customer.phone" size="25"
				maxlength="40" value="${customer.phone}" />

			<br />
			<div class="holder">Celular:</div>
			<input type="text" id="customer_mobile" name="customer.mobile" size="25"
				maxlength="40" value="${customer.mobile}" />

			<br />
			<div class="holder">Fax:</div>
			<input type="text" id="customer_fax" name="customer.fax" size="25"
				maxlength="40" value="${customer.fax}" />

			<br />
			<div class="holder">Rua:</div>
			<input type="text" id="customer_address" name="customer.address" size="25"
				maxlength="40" value="${customer.address}" />

			<br />
			<div class="holder">Bairro:</div>
			<input type="text" id="customer_neighborhood" name="customer.neighborhood" size="25"
				maxlength="40" value="${customer.neighborhood}" />

			<br />
			<div class="holder">Cidade:</div>
			<input type="text" id="customer_city" name="customer.city" size="25"
				maxlength="40" value="${customer.city}" />

			<br />
			<div class="holder">Estado:</div>
			<input type="text" id="customer_state" name="customer.state" size="25"
				maxlength="40" value="${customer.state}" />

			<br />
			<div class="holder">País:</div>
			<input type="text" id="customer_country" name="customer.country" size="25"
				maxlength="40" value="${customer.country}" />

			<br />
			<div class="holder">CEP:</div>
			<input type="text" id="customer_zipCode" name="customer.zipCode" size="25"
				maxlength="40" value="${customer.zipCode}" />

			<br />
			<div class="holder">Criação:</div>
			<input type="text" id="customer_creationDate" name="customer.creationDate" size="25"
				maxlength="40" value="${customer.creationDateString}" disabled="disabled" />
			<input type="hidden" id="customer_creationDate" name="customer.creationDate"
				value="${customer.creationDate}" />

			<br />
			<div class="holder">Última modificação:</div>
			<input type="text" id="customer_modificationDate" name="customer.modificationDate" size="25"
				maxlength="40" value="${customer.modificationDateString}" disabled="disabled" />
			<input type="hidden" id="customer_modificationDate" name="customer.modificationDate"
				value="${customer.modificationDate}" />

			<br />
			<div class="holder"></div>

			<s:fielderror fieldName="customer.name" />
			<s:fielderror fieldName="customer.reason" />
			<s:fielderror fieldName="customer.cnpj" />
			<s:fielderror fieldName="customer.ie" />
			<s:fielderror fieldName="customer.email" />
			<s:fielderror fieldName="customer.phone" />
			<s:fielderror fieldName="customer.mobile" />
			<s:fielderror fieldName="customer.fax" />
			<s:fielderror fieldName="customer.address" />
			<s:fielderror fieldName="customer.neighborhood" />
			<s:fielderror fieldName="customer.city" />
			<s:fielderror fieldName="customer.state" />
			<s:fielderror fieldName="customer.country" />
			<s:fielderror fieldName="customer.zipCode" />

			<br />
			<input type="submit" id="btn_salvar" value="Salvar" />
			<input type="button" id="btn_cancelar" value="Cancelar" />

		</form>

		<div class="holder"></div>

	</fieldset>
	<br />
</div>

<c:import url="footer.jsp" />
