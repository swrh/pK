<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>perspeKtiva :: listar</title>
<link href="css/general.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">

function ChangeColor(tableRow, highLight) {
		if (highLight) {
			tableRow.style.backgroundColor = '#dcfac9';
			tableRow.style.cursor="hand";
		} else {
			tableRow.style.backgroundColor = '#fafafa';
			tableRow.style.cursor="pointer";
		}
	}
</script>

</head>

<body>

<jsp:useBean id="dao" class="br.com.pk.dao.impl.RepresentanteDAO" />
<div id="tabela">

</p><a href="representanteNew">Criar Novo Representante</a><br/><br/>

<table class="sofT">

	<tr>
		<td colspan="4" class="helpHed">Listagem de Representantes</td>
	</tr>

	<tr>
		<td class="helpHed">ID</td>
		<td class="helpHed">Razão Social</td>
		<td class="helpHed">Contato</td>
		<td class="helpHed">Responsável</td>
	</tr>

	<c:forEach var="rep" items="${dao.lista}">
		<tr style="cursor:pointer" onclick="document.location='representanteSearch?representante.id=${rep.id}'">
			<td class="helpBod">${rep.id}</td>
			<td class="helpBod">${rep.razaosocial}</td>
			<td class="helpBod">${rep.contato}</td>
			<td class="helpBod">${rep.responsavel}</td>
		</tr>
	</c:forEach>

</table>

</div>

</body>
</html>