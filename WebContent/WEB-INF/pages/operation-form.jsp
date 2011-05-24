<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<s:if test="operation == null || operation.id == null">
	<s:set name="title" value="%{'Adicionar nova ação'}" />
</s:if>
<s:else>
	<s:set name="title" value="%{'Atualizar ação'}" />
</s:else>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="operation-index" />
			<jsp:param name="deleteUrl" value="operation-crud!delete?operation.id=${operation.id}" />
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
						<s:form action="operation-crud!save.action" method="post">
							<s:hidden name="operation.id" value="%{operation.id}" />

							<s:textfield name="operation.id"                      value="%{operation.id}"                      label="Código"         size="20" disabled="true" />
							<s:textfield name="operation.name"                    value="%{operation.name}"                    label="Nome"           size="40" />
							<s:textfield name="operation.creationDateString"      value="%{operation.creationDateString}"      label="Criado em"      size="40" disabled="true" />
							<s:textfield name="operation.modificationDateString"  value="%{operation.modificationDateString}"  label="Modificado em"  size="40" disabled="true" />

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
