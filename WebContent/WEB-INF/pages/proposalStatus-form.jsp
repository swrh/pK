<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<s:if test="proposalStatus == null || proposalStatus.id == null">
	<s:set name="title" value="%{'Adicionar novo estado de proposta'}" />
</s:if>
<s:else>
	<s:set name="title" value="%{'Atualizar estado de proposta'}" />
</s:else>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="proposalStatus-index" />
			<jsp:param name="deleteUrl" value="proposalStatus-crud!delete?proposalStatus.id=${proposalStatus.id}" />
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
						<s:form action="proposalStatus-crud!save.action" method="post">
							<s:hidden name="proposalStatus.id" value="%{proposalStatus.id}" />

							<s:textfield name="proposalStatus.id"                      value="%{proposalStatus.id}"                      label="Código"         size="20" disabled="true" />
							<s:textfield name="proposalStatus.name"                    value="%{proposalStatus.name}"                    label="Nome"           size="40" />
							<s:checkbox  name="proposalStatus.finishing"               value="%{proposalStatus.finishing}"               label="Fechamento" />
							<s:textfield name="proposalStatus.creationDateString"      value="%{proposalStatus.creationDateString}"      label="Criado em"      size="40" disabled="true" />
							<s:textfield name="proposalStatus.modificationDateString"  value="%{proposalStatus.modificationDateString}"  label="Modificado em"  size="40" disabled="true" />

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
