<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<s:if test="product == null || product.id == null">
	<s:set name="title" value="%{'Adicionar novo produto'}" />
</s:if>
<s:else>
	<s:set name="title" value="%{'Atualizar produto'}" />
</s:else>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="product-index" />
			<jsp:param name="deleteUrl" value="product-crud!delete?product.id=${product.id}" />
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
						<s:form action="product-crud!save.action" method="post">
							<s:hidden name="product.id" value="%{product.id}" />

							<s:textfield name="product.id"                      value="%{product.id}"                      label="Código"         cssClass="textField_id"           disabled="true" />
							<s:textfield name="product.name"                    value="%{product.name}"                    label="Nome"           cssClass="textField_name"         />
							<s:textfield name="product.creationDateString"      value="%{product.creationDateString}"      label="Criado em"      cssClass="textField_dateTime"     disabled="true" />
							<s:textfield name="product.modificationDateString"  value="%{product.modificationDateString}"  label="Modificado em"  cssClass="textField_dateTime"     disabled="true" />

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
