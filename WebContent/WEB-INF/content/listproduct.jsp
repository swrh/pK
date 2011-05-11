<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp"/>

<jsp:useBean id="dao" class="com.dasho2.pk.dao.impl.ProductDAO" />

<div id="tabela">
<br/>

<a href="productNew" class="linknew">Criar Novo Produto</a><br/><br/>

<table class="sofT">

	<tr>
		<td colspan="3" class="helpHed">Listagem de Produtos</td>
	</tr>

	<tr>
		<td class="helpHed">ID</td>
		<td class="helpHed">Nome</td>
		<td class="helpHed">Código</td>
	</tr>

	<c:forEach var="rep" items="${dao.list}">
		<tr style="cursor:pointer" onclick="document.location='productSearch?product.id=${rep.id}'">
			<td class="helpBod">${rep.id}</td>
			<td class="helpBod">${rep.name}</td>
			<td class="helpBod">${rep.code}</td>
		</tr>
	</c:forEach>

</table>
<br/>
</div>
<c:import url="footer.jsp"/>
