<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<s:if test="representative == null || representative.id == null">
	<s:set name="title" value="%{'Adicionar novo representante'}" />
</s:if>
<s:else>
	<s:set name="title" value="%{'Atualizar representante'}" />
</s:else>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="representative-index" />
			<jsp:param name="deleteUrl" value="representative-crud!delete?representative.id=${representative.id}" />
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
						<s:form action="representative-crud!save.action" method="post">
							<s:hidden name="representative.id" value="%{representative.id}" />

							<s:textfield name="representative.id"                      value="%{representative.id}"                      label="Código"         size="20" disabled="true" />
							<s:textfield name="representative.companyName"             value="%{representative.companyName}"             label="Razão Social"   size="40" />
							<s:textfield name="representative.contactName"             value="%{representative.contactName}"             label="Contato"        size="40" />
							<s:textfield name="representative.responsibleName"         value="%{representative.responsibleName}"         label="Responsável"    size="40" />
							<s:textfield name="representative.creationDateString"      value="%{representative.creationDateString}"      label="Criado em"      size="40" disabled="true" />
							<s:textfield name="representative.modificationDateString"  value="%{representative.modificationDateString}"  label="Modificado em"  size="40" disabled="true" />

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
