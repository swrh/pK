<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<s:if test="indication == null || indication.id == null">
	<s:set name="title" value="%{'Adicionar nova indicação'}" />
</s:if>
<s:else>
	<s:set name="title" value="%{'Atualizar indicação'}" />
</s:else>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="indication-index" />
			<jsp:param name="deleteUrl" value="indication-crud!delete?indication.id=${indication.id}" />
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
						<s:form action="indication-crud!save.action" method="post">
							<s:hidden name="indication.id" value="%{indication.id}" />

							<s:textfield name="indication.id" value="%{indication.id}" label="Código" size="20" disabled="true" />
							<s:textfield name="indication.partner" value="%{indication.partner}" label="Parceiro" size="40" />
							<s:textfield name="indication.region" value="%{indication.region}" label="Região" size="40" />

							<s:textfield name="indication.creationDateString" value="%{indication.creationDateString}" label="Criado em" size="40" disabled="true" />
							<s:textfield name="indication.modificationDateString" value="%{indication.modificationDateString}" label="Modificado em" size="40" disabled="true" />

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
