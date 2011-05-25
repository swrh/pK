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
					<table>	
						<tr>
							<td width="75">Login:</td>
							<td><input type="text" id="user_login" name="user.login" size="20" maxlength="45"/></td>
						</tr>
						<tr>
							<td>Senha:</td>
							<td><input type="password" id="user_password" name="user.password" size="20" maxlength="20"/></td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td></td>
							<td><a href="forgot-password">Esqueci a senha!</a></td>
						</tr>
						<tr>
							<td colspan="2">
								<s:fielderror fieldName="user.login" />
								<s:fielderror fieldName="user.password" />
								<s:fielderror fieldName="user.invalid" />							
							</td>
						</tr>
						<tr>
							<td></td>
							<td><div class="cssbutton sample a"><input type="submit" value="Login" /></div></td>
						</tr>
					</table>
				</form>
			</fieldset>
		</div>
	</body>
</html>
