<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<s:if test="employee == null || employee.id == null">
	<s:set name="title" value="%{'Adicionar novo funcionário'}" />
</s:if>
<s:else>
	<s:set name="title" value="%{'Atualizar funcionário'}" />
</s:else>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="employee-index" />
			<jsp:param name="deleteUrl" value="employee-crud!delete?employee.id=${employee.id}" />
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
						<s:if test="employee != null && employee.id != null">
							<s:url id="passwordUpdateUrl" action="employeePassword-update!input" >
								<s:param name="employee.id" value="%{employee.id}" />
							</s:url>
							<a href="<s:property value="#passwordUpdateUrl" />" class="linknew">Trocar senha do usuário</a>
							<br />
						</s:if>
						<s:actionerror />
						<s:actionmessage />
						<s:form action="employee-crud!save.action" method="post">
							<s:hidden name="employee.id" value="%{employee.id}" />

							<s:textfield name="employee.id"                      value="%{employee.id}"                      label="Código"         cssClass="textField_id"           disabled="true" />
							<s:textfield name="employee.name"                    value="%{employee.name}"                    label="Nome"           cssClass="textField_name"         />
							<s:textfield name="employee.email"                   value="%{employee.email}"                   label="E-mail"         cssClass="textField_email"        />
							<s:select    name="employee.department.id"           value="%{employee.department.id}"           label="Departamento"   listKey="id" listValue="name"        list="departments" />
							<s:select    name="employee.representative.id"       value="%{employee.representative.id}"       label="Representante"  listKey="id" listValue="companyName" list="representatives" />
							<s:textfield name="employee.creationDateString"      value="%{employee.creationDateString}"      label="Criado em"      cssClass="textField_dateTime"     disabled="true" />
							<s:textfield name="employee.modificationDateString"  value="%{employee.modificationDateString}"  label="Modificado em"  cssClass="textField_dateTime"     disabled="true" />

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
