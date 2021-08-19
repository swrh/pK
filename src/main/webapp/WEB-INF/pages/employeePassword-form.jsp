<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<s:set name="title" value="%{'Alterar senha do usuário'}" />






<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="employee-crud!input?employee.id=${employee.id}" />
			<jsp:param name="deleteUrl" value="#" />
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
						<s:form action="employeePassword-update!save" method="post">
							<s:hidden name="employee.id" value="%{employee.id}" />

							<s:textfield name="employee.id"                      value="%{employee.id}"                      label="Código"               size="20" disabled="true" />
							<s:textfield name="employee.name"                    value="%{employee.name}"                    label="Nome"                 size="40" disabled="true" />
							<s:textfield name="employee.email"                   value="%{employee.email}"                   label="E-mail"               size="40" disabled="true" />
							<s:password  name="newPassword"                      value=""                                    label="Senha"                size="40" />
							<s:password  name="confirmPassword"                  value=""                                    label="Confirmação"          size="40" />
							<s:textfield name="employee.creationDateString"      value="%{employee.creationDateString}"      label="Criado em"            size="40" disabled="true" />
							<s:textfield name="employee.modificationDateString"  value="%{employee.modificationDateString}"  label="Modificado em"        size="40" disabled="true" />

							<s:submit id="btn_salvar" value="Salvar" />
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
