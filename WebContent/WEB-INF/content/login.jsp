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
		<div id="login">
			<fieldset>
				<form name="formLogin" action="login" method="post">
					<div class="holder">Login:</div><input type="text" id="user_login" name="user.login" size="20" maxlength="45"/><br />
					<div class="holder">Senha:</div><input type="password" id="user_password" name="user.password" size="20" maxlength="20"/><br />
					<div class="holder"><a href="forgot-password">Esqueci a senha!</a></div><br />
					<s:fielderror fieldName="user.login" />
					<s:fielderror fieldName="user.password" />
					<s:fielderror fieldName="user.invalid" />
					<div class="holder"><input type="submit" value="Login" /></div>
				</form>
			</fieldset>
		</div>
	</body>
</html>
