<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<c:import url="header.jsp" />

<jsp:useBean id="dao" class="com.dasho2.pk.dao.impl.CustomerDAO" />
<div id="tabela">
	<br />
	<a href="customer-new" class="linknew">Criar Novo Cliente</a><br />
	<br />

	<table class="sofT">
		<tr>
			<td colspan="2" class="helpHed">Listagem de Clientes</td>
		</tr>

		<tr>
			<td class="helpHed">Código</td>
			<td class="helpHed">Nome</td>
			<td class="helpHed">E-mail</td>
			<td class="helpHed">Telefone</td>
			<td class="helpHed">Cidade</td>
		</tr>

		<c:forEach var="c" items="${dao.list}">
			<tr style="cursor: pointer"
				onclick="document.location='customer-edit?customer.id=${c.id}'">
				<td class="helpBod">${c.code}</td>
				<td class="helpBod">${c.name}</td>
				<td class="helpBod">${c.email}</td>
				<td class="helpBod">${c.phone}</td>
				<td class="helpBod">${c.city}</td>
			</tr>
		</c:forEach>

	</table>
	<br />
</div>

<c:import url="footer.jsp" />
