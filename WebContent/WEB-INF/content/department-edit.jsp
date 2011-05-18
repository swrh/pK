<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<c:import url="header.jsp" />

<script type="text/javascript">
	$(document).ready(function() {
		$('#department_name').focus();

		$('#btn_cancelar').click(function() {
			$.fn.disable_form();
			$.fn.clear_form();
			$.fn.clear_errors();
			document.location = 'department-list';
		});

		$('#btn_salvar').click(function() {
			$('#btn_salvar').attr('disabled', 'disabled');
			$('#form').submit();
		});

		$('#btn_apagar').click(function() {
			if (confirm("Deseja realmente apagar este registro?")) {
				document.location = 'department-delete?department.id=' + $('#department_id').val();
			}
		});
	});

	$.fn.disable_form = function() {
		$('#department_name').attr('disabled', 'disabled');
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
		<legend>Cadastro de Departamentos</legend>
		<form id="form" name="formRep" action="department-update" method="post">
			<br />
			<div class="holder">Código:</div>
			<input type="text" id="department_id" name="department.id"
				value="${department.id}" disabled="disabled" />
			<input type="hidden" id="department_id" name="department.id"
				value="${department.id}" />

			<br />
			<div class="holder">Nome:</div>
			<input type="text" id="department_name" name="department.name" size="25"
				maxlength="40" value="${department.name}" />

			<br />
			<div class="holder">Criação:</div>
			<input type="text" id="department_creationDate" name="department.creationDate" size="25"
				maxlength="40" value="${department.creationDateString}" disabled="disabled" />
			<input type="hidden" id="department_creationDate" name="department.creationDate"
				value="${department.creationDate}" />

			<br />
			<div class="holder">Última modificação:</div>
			<input type="text" id="department_modificationDate" name="department.modificationDate" size="25"
				maxlength="40" value="${department.modificationDateString}" disabled="disabled" />
			<input type="hidden" id="department_modificationDate" name="department.modificationDate"
				value="${department.modificationDate}" />

			<br />
			<div class="holder"></div>

			<s:fielderror fieldName="department.name" />

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
