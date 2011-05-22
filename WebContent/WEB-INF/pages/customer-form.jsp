<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<s:if test="customer == null || customer.id == null">
	<s:set name="title" value="%{'Adicionar novo cliente'}" />
</s:if>
<s:else>
	<s:set name="title" value="%{'Atualizar cliente'}" />
</s:else>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="customer-index" />
			<jsp:param name="deleteUrl" value="customer-crud!delete?customer.id=${customer.id}" />
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
						<s:form action="customer-crud!save.action" method="post">
							<s:hidden name="customer.id" value="%{customer.id}" />

							<s:textfield name="customer.id"                        value="%{customer.id}"                        label="Código"         size="20" disabled="true" />
							<s:textfield name="customer.name"                      value="%{customer.name}"                      label="Nome"           size="40" />
							<s:textfield name="customer.companyName"               value="%{customer.companyName}"               label="Razão Social"   size="40" />
							<s:textfield name="customer.cnpj"                      value="%{customer.cnpj}"                      label="CNPJ"           size="40" />
							<s:textfield name="customer.ie"                        value="%{customer.ie}"                        label="I.E."           size="40" />
							<s:textfield name="customer.email"                     value="%{customer.email}"                     label="E-mail"         size="40" />
							<s:textfield name="customer.phone"                     value="%{customer.phone}"                     label="Telefone"       size="40" />
							<s:textfield name="customer.mobile"                    value="%{customer.mobile}"                    label="Celular"        size="40" />
							<s:textfield name="customer.fax"                       value="%{customer.fax}"                       label="FAX"            size="40" />
							<s:textfield name="customer.address"                   value="%{customer.address}"                   label="Rua"            size="40" />
							<s:textfield name="customer.neighborhood"              value="%{customer.neighborhood}"              label="Bairro"         size="40" />
							<s:textfield name="customer.city"                      value="%{customer.city}"                      label="Cidade"         size="40" />
							<s:textfield name="customer.state"                     value="%{customer.state}"                     label="Estado"         size="40" />
							<s:textfield name="customer.country"                   value="%{customer.country}"                   label="País"           size="40" />
							<s:textfield name="customer.zipCode"                   value="%{customer.zipCode}"                   label="CEP"            size="40" />
							<s:textfield name="customer.creationDateString"        value="%{customer.creationDateString}"        label="Criado em"      size="40" disabled="true" />
							<s:textfield name="customer.modificationDateString"    value="%{customer.modificationDateString}"    label="Modificado em"  size="40" disabled="true" />

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
