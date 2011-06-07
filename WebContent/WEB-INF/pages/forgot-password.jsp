<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
				<form name="formSenha" action="senhaRecover" method="post">
					<table>
						<tr>
					<td width="75">E-mail:</td>
					<td><input type="text" name="employee.email" size="20" maxlength="45" /></td>
						</tr>
						<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
						<tr>
					<td colspan="2"><s:fielderror fieldName="employee.email"/></td>
				</tr>
				<tr>
					<td></td>
					<td><div class="cssbutton sample a"><input type="submit" value="Recuperar senha!" /></div></td>
				</tr>
					</table>
				</form>
			</fieldset>
		</div>
	</body>
</html>

<!-- vim:set et: -->
<!-- vi:set sw=2 ts=2: -->
