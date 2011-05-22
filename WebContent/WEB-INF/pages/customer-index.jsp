<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-index.jsp" />
	</head>

	<body>
		<div class="container">
			<div id="header">
				<jsp:include page="../include/banner.jsp" />
			</div>

			<div id="content_area">
				<div id="left">

					<br />
					<div id="tabela">
						<s:url id="createUrl" action="customer-crud!input" />
						<a href="<s:property value="#createUrl" />" class="linknew">Criar Novo Cliente</a>
						<br />
						<br />
							<h1>Listagem de Clientes</h1>
						<br />
						<table class="sofT">
							<tr>
								<th class="helpHed">Código</th>
								<th class="helpHed">Nome</th>
								<th class="helpHed">Razão Social</th>
								<th class="helpHed">E-mail</th>
								<th class="helpHed">Telefone</th>
								<th class="helpHed">Celular</th>
								<th class="helpHed">Cidade</th>
								<th class="helpHed">Estado</th>
								<th class="helpHed">Criado em</th>
								<th class="helpHed">Modificado em</th>
							</tr>
							<s:iterator value="customers" status="status">
								<s:url action="customer-crud!input" id="editUrl">
									<s:param name="customer.id" value="id" />
								</s:url>
								<tr style="cursor: pointer" onclick="document.location='<s:property value="#editUrl"/>'">
									<td class="helpBod"><s:property value="id" /></td>
									<td class="helpBod"><s:property value="name" /></td>
									<td class="helpBod"><s:property value="reason" /></td>
									<td class="helpBod"><s:property value="email" /></td>
									<td class="helpBod"><s:property value="phone" /></td>
									<td class="helpBod"><s:property value="mobile" /></td>
									<td class="helpBod"><s:property value="city" /></td>
									<td class="helpBod"><s:property value="state" /></td>
									<td class="helpBod"><s:property value="creationDateString" /></td>
									<td class="helpBod"><s:property value="modificationDateString" /></td>
								</tr>
							</s:iterator>
						</table>
					</div>
					<br />

				</div>
			</div>
			<div class="cleaner"></div>
			<div id="footer_background">
				<jsp:include page="../include/footer.jsp" />
			</div>
		</div>
	</body>
</html>
