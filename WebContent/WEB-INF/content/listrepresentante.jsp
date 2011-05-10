<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp"/>

<jsp:useBean id="dao" class="com.dasho2.pk.dao.impl.RepresentanteDAO" />

<div id="tabela">
<br/>

<a href="representanteNew" class="linknew">Criar Novo Representante</a><br/><br/>

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
<br/>
</div>
<c:import url="footer.jsp"/>