<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>perspeKtiva :: representantes</title>
<link href="css/general.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" " src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$('#representante_razaosocial').focus();
	
	$('#btn_cancelar').click(function(){
		$.fn.disable_form();
		$.fn.clear_form();
		$.fn.clear_errors();
		document.location='representantes';
	});
	
	$('#btn_salvar').click(function(){
		$('#btn_salvar').attr('disabled', 'disabled');
		$('#form').submit();
	});
	
	$('#btn_apagar').click(function(){
		
		if (confirm("Deseja realmente apagar este registro?")) {
				document.location='representanteDelete?representante.id='+$('#representante_id').val();
			}
		
		});

	});

	$.fn.disable_form = function() {
		$('#representante_razaosocial').attr('disabled', 'disabled');
		$('#representante_contato').attr('disabled', 'disabled');
		$('#representante_responsavel').attr('disabled', 'disabled');
	};

	$.fn.clear_errors = function() {
		$('.errorMessage').hide();
	};

	$.fn.clear_form = function() {
		$(':input', '#form').not(':button, :submit, :reset, :hidden').val('')
				.removeAttr('checked').removeAttr('selected');
	};
</script>
</head>

<body>

<div id="cadastro">
<fieldset>
<legend>Cadastro de Representantes</legend>
    <form id="form" name="formRep" action="representanteEdit" method="post">
        
        <div class="holder">Código:</div> 
        <input type="hidden" id="representante_id" name="representante.id" value="${representante.id}"/>
        <input type="text" id="representante_id" size="5" maxlength="3" value="${representante.id}" disabled="disabled"/><br/> 
        <div class="holder">Razão Social:</div>  
        <input type="text" id="representante_razaosocial" name="representante.razaosocial" size="25" maxlength="40" value="${representante.razaosocial}" /><br/>
        <div class="holder">Contato:</div> 
        <input type="text" id="representante_contato" name="representante.contato" size="14" maxlength="14" value="${representante.contato}"/><br />
        <div class="holder">Responsável:</div> 
        <input type="text" id="representante_responsavel" name="representante.responsavel" size="25" maxlength="40" value="${representante.responsavel}"/><br />
        
        <div class="holder"></div>
        <s:fielderror fieldName="representante.razaosocial"/>
        <s:fielderror fieldName="representante.contato"/>
        <s:fielderror fieldName="representante.responsavel"/>
        
        <input type="submit" id="btn_salvar" value="Salvar" />
        <input type="button" id="btn_cancelar" value="Cancelar" />
        <input type="button" id="btn_apagar" value="Apagar" />

    </form>
    
    <div class="holder"></div>
    <div id="lista"/>
    
</fieldset>
</div>

</body>
</html>