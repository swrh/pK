<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>perspeKtiva :: login</title>
</head>

<body>
<div id="login" style="width:200px;">
<fieldset>
<legend>Login Information</legend>
    <form name="formLogin" action="login" method="post">
        Login: <input type="text" name="usuario.login" size="20" maxlength="45"/><br />
        Senha: <input type="password" name="usuario.senha" size="20" maxlength="20"/><br />
        <a href="#">Esqueci a senha!</a><br />
        <s:fielderror fieldName="usuario.login"/>
        <s:fielderror fieldName="usuario.senha"/>
        <s:fielderror fieldName="usuario.invalid"/>
        <input type="submit" value="Login" />
    </form>
</fieldset>
</div>

</body>
</html>