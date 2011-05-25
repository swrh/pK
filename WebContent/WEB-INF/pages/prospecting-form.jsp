<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<s:if test="prospecting == null || prospecting.id == null">
	<s:set name="title" value="%{'Criar nova prospecção'}" />
</s:if>
<s:else>
	<s:set name="title" value="%{'Atualizar prospecção'}" />
</s:else>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="prospecting-index" />
			<jsp:param name="deleteUrl" value="prospecting-crud!delete?prospecting.id=${prospecting.id}" />
		</jsp:include>
	</head>

	<body>
		<div class="container">
			<div id="header">
				<jsp:include page="../include/banner.jsp" />
			</div>

			<div id="content_area">
				<div id="left">

					<div id="cadastro">
						<br />
						<h1>
							<s:property value="#title" />
						</h1>
						<s:actionerror />
						<s:actionmessage />
						<s:form action="prospecting-crud!save.action" method="post">
							<s:hidden name="prospecting.id" value="%{prospecting.id}" />

							<s:textfield name="prospecting.id"                      value="%{prospecting.id}"                      label="Código"                 size="20" disabled="true" />
							<s:select    name="prospecting.finishingReason.id"      value="%{prospecting.finishingReason.id}"      label="Razão de Encerramento"  listKey="id" listValue="name"    list="finishingReasons" />
							<s:select    name="prospecting.employee.id"             value="%{prospecting.employee.id}"             label="Funcionário"            listKey="id" listValue="name"    list="employees" />
							<s:select    name="prospecting.operation.id"            value="%{prospecting.operation.id}"            label="Ação"                   listKey="id" listValue="name"    list="operations" />
							<s:select    name="prospecting.indication.id"           value="%{prospecting.indication.id}"           label="Indicação"              listKey="id" listValue="partner" list="indications" />
							<s:select    name="prospecting.proposalStatus.id"       value="%{prospecting.proposalStatus.id}"       label="Estado da Proposta"     listKey="id" listValue="name"    list="proposalStatuss" />
							<s:select    name="prospecting.customer.id"             value="%{prospecting.customer.id}"             label="Cliente"                listKey="id" listValue="name"    list="customers" />
							<s:textfield name="prospecting.creationDateString"      value="%{prospecting.creationDateString}"      label="Criado em"              size="40" disabled="true" />
							<s:textfield name="prospecting.modificationDateString"  value="%{prospecting.modificationDateString}"  label="Modificado em"          size="40" disabled="true" />

							<s:submit id="btn_salvar" value="Salvar" />
							<s:submit id="btn_apagar" value="Excluir" />
							<s:submit id="btn_cancelar" value="Cancelar" />
						</s:form>
					</div>

				</div>
			</div>
			<div class="cleaner"></div>
			<div id="footer_background">
				<jsp:include page="../include/footer.jsp" />
			</div>
		</div>
	</body>
</html>
