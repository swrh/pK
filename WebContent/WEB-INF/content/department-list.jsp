<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<c:import url="header.jsp" />

<jsp:useBean id="dao" class="com.dasho2.pk.dao.impl.DepartmentDAO" />
<div id="tabela">
	<br />
	<a href="department-new" class="linknew">Criar Novo Departamento</a><br />
	<br />

	<table class="sofT">
		<tr>
			<td colspan="4" class="helpHed">Listagem de Departamentos</td>
		</tr>

		<tr>
			<td class="helpHed">Código</td>
			<td class="helpHed">Nome</td>
			<td class="helpHed">Data de Criação</td>
			<td class="helpHed">Última modificação</td>
		</tr>

		<c:forEach var="c" items="${dao.list}">
			<tr style="cursor: pointer"
				onclick="document.location='department-edit?department.id=${c.id}'">
				<td class="helpBod">${c.id}</td>
				<td class="helpBod">${c.name}</td>
				<td class="helpBod">${c.creationDateString}</td>
				<td class="helpBod">${c.modificationDateString}</td>
			</tr>
		</c:forEach>

	</table>
	<br />
</div>

<c:import url="footer.jsp" />
