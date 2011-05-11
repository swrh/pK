<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<c:import url="header.jsp"/>

<script type="text/javascript">

$(document).ready(function(){

	$('#product_name').focus();

	$('#btn_cancelar').click(function(){
		$.fn.disable_form();
		$.fn.clear_form();
		$.fn.clear_errors();
		document.location='products';
	});

	$('#btn_salvar').click(function(){
		$('#btn_salvar').attr('disabled', 'disabled');
		$('#form').submit();
	});

	$('#btn_apagar').click(function(){

		if (confirm("Deseja realmente apagar este registro?")) {
				document.location='productDelete?product.id='+$('#product_id').val();
			}

		});

	});

	$.fn.disable_form = function() {
		$('#product_name').attr('disabled', 'disabled');
		$('#product_code').attr('disabled', 'disabled');
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
<br/>
<fieldset>
<legend>Cadastro de Produtos</legend>
    <form id="form" name="formRep" action="productEdit" method="post">
        <br/>

        <div class="holder">Código:</div>
        <input type="hidden" id="product_id" name="product.id" value="${product.id}"/>
        <input type="text" id="product_id" size="5" maxlength="3" value="${product.id}" disabled="disabled"/><br/>
        <div class="holder">Nome:</div>
        <input type="text" id="product_name" name="product.name" size="25" maxlength="40" value="${product.name}" /><br/>
        <div class="holder">Código:</div>
        <input type="text" id="product_code" name="product.code" size="14" maxlength="14" value="${product.code}"/><br />

        <div class="holder"></div>
        <s:fielderror fieldName="product.name"/>
        <s:fielderror fieldName="product.code"/>

        <input type="submit" id="btn_salvar" value="Salvar" />
        <input type="button" id="btn_cancelar" value="Cancelar" />
        <input type="button" id="btn_apagar" value="Apagar" />

    </form>

    <div class="holder"></div>

</fieldset>
<br/>
</div>

<c:import url="footer.jsp"/>
