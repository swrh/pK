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
						<s:url id="createUrl" action="report-create" />
						<a href="<s:property value="#createUrl" />" class="linknew">Criar Novo Relatório</a>
						<br />
						<br />
							<h1>Listagem de Relatórios</h1>
						<br />
						<table class="sofT_125">
							<tr>
								<th class="helpHedCodigo">Código</th>
								<th class="helpHed">Última Visita</th>
								<th class="helpHed">Responsável</th>
								<th class="helpHed">Ação</th>
								<th class="helpHed">Proposta</th>
								<th class="helpHed">Cliente</th>
								<th class="helpHed">Motivo de Encerramento</th>
							</tr>
							<s:iterator value="reports" status="status">
								<s:url action="report-read" id="readUrl">
									<s:param name="report.id" value="id" />
								</s:url>
								<tr style="cursor: pointer" onclick="document.location='<s:property value="#readUrl"/>'">
									<td class="helpBod"><s:property value="id" /></td>
									<td class="helpBod"><s:property value="prospecting.visitDate" /></td>
									<td class="helpBod"><s:property value="prospecting.employee.name" /></td>
									<td class="helpBod"><s:property value="prospecting.operation.name" /></td>
									<td class="helpBod"><s:property value="prospecting.proposalStatus.name" /></td>
									<td class="helpBod"><s:property value="prospecting.customer.name" /></td>
									<td class="helpBod"><s:property value="prospecting.finishingReason.name" /></td>
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
