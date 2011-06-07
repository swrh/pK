<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<script language="javascript" type="text/javascript">
			$(window).load(function () {
				$(':input:visible:enabled:first').focus();
			});
		</script>
	</head>

	<body>
		<div id="divlogin">
			<fieldset>
				<s:actionerror />
				<s:actionmessage />
				<s:form action="login" method="post">
					<s:textfield name="employee.email"    label="E-mail" size="20" />
					<s:password  name="employee.password" label="Senha"  size="20" />
					<s:submit id="btn_salvar" value="Login" />
				</s:form>
				<s:fielderror fieldName="employee.invalid" />
				<a href="forgot-password">Esqueci a senha!</a>
			</fieldset>
		</div>
	</body>
</html>
