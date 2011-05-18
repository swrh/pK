<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<c:import url="header.jsp" />

<jsp:useBean id="dao" class="com.dasho2.pk.dao.impl.ProductDAO" />
<div id="tabela">
	<br />
	<a href="product-new" class="linknew">Criar Novo Produto</a><br />
	<br />

	<table class="sofT">
		<tr>
			<td colspan="2" class="helpHed">Listagem de Produtos</td>
		</tr>

		<tr>
			<td class="helpHed">Código</td>
			<td class="helpHed">Nome</td>
		</tr>

		<c:forEach var="p" items="${dao.list}">
			<tr style="cursor: pointer"
				onclick="document.location='product-edit?product.id=${p.id}'">
				<td class="helpBod">${p.code}</td>
				<td class="helpBod">${p.name}</td>
			</tr>
		</c:forEach>

	</table>
	<br />
</div>

<c:import url="footer.jsp" />
