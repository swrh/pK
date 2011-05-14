<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>perspeKtiva :: login</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="js/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
    $(document).ready(function() {
    	$('#user_login').focus();
    })
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
<!-- vim:set et: -->
<!-- vi:set sw=2 ts=2: -->
