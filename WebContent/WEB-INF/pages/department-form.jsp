<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<s:if test="department == null || department.id == null">
	<s:set name="title" value="%{'Adicionar novo departamento'}" />
</s:if>
<s:else>
	<s:set name="title" value="%{'Atualizar departamento'}" />
</s:else>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="department-index" />
			<jsp:param name="deleteUrl" value="department-crud!delete?department.id=${department.id}" />
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
						<s:form action="department-crud!save.action" method="post">
							<s:hidden name="department.id" value="%{department.id}" />

							<s:textfield name="department.id"                      value="%{department.id}"                      label="Código"         cssClass="textField_id"        disabled="true" />
							<s:textfield name="department.name"                    value="%{department.name}"                    label="Nome"           cssClass="textField_name"      />
							<s:textfield name="department.creationDateString"      value="%{department.creationDateString}"      label="Criado em"      cssClass="textField_dateTime"  disabled="true" />
							<s:textfield name="department.modificationDateString"  value="%{department.modificationDateString}"  label="Modificado em"  cssClass="textField_dateTime"  disabled="true" />

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
