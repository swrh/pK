<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<s:if test="report == null || report.id == null">
	<s:set name="title" value="%{'Adicionar novo relatório'}" />
</s:if>
<s:else>
	<s:set name="title" value="%{'Atualizar relatório'}" />
</s:else>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="report-index" />
			<jsp:param name="deleteUrl" value="report-crud!delete?report.id=${report.id}" />
		</jsp:include>
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
						<h1>Selecione uma prospecção para criar o relatório</h1>
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
							<s:iterator value="prospectings" status="status">
								<s:url action="report-create!save" id="createUrl">
									<s:param name="prospecting.id" value="id" />
								</s:url>
								<tr style="cursor: pointer" onclick="document.location='<s:property value="#createUrl"/>'">
									<td class="helpBod"><s:property value="id" /></td>
									<td class="helpBod"><s:property value="visitDate" /></td>
									<td class="helpBod"><s:property value="employee.name" /></td>
									<td class="helpBod"><s:property value="operation.name" /></td>
									<td class="helpBod"><s:property value="proposalStatus.name" /></td>
									<td class="helpBod"><s:property value="customer.name" /></td>
									<td class="helpBod"><s:property value="finishingReason.name" /></td>
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
