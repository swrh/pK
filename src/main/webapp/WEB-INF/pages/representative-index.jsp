<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
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
						<s:url id="createUrl" action="representative-crud!input" />
						<a href="<s:property value="#createUrl" />" class="linknew">Criar Novo Representante</a>
						<br />
						<br />
							<h1>Listagem de Representantes</h1>
						<br />
						<table class="sofT">
							<tr>
								<th class="helpHedCodigo">Código</th>
								<th class="helpHed">Razão Social</th>
								<th class="helpHed">Contato</th>
								<th class="helpHed">Responsável</th>
							</tr>
							<s:iterator value="representatives" status="status">
								<s:url action="representative-crud!input" id="editUrl">
									<s:param name="representative.id" value="id" />
								</s:url>
								<tr style="cursor: pointer" onclick="document.location='<s:property value="#editUrl"/>'">
									<td class="helpBod"><s:property value="id" /></td>
									<td class="helpBod"><s:property value="companyName" /></td>
									<td class="helpBod"><s:property value="contactName" /></td>
									<td class="helpBod"><s:property value="responsibleName" /></td>
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