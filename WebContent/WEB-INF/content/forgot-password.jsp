<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>perspeKtiva :: senha</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <link href="css/login.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="login">
      <fieldset>
        <form name="formSenha" action="senhaRecover" method="post">
          <div class="holder">E-mail:</div><input type="text" name="user.login" size="20" maxlength="45" /><br /><br />
          <s:fielderror fieldName="user.login"/>
          <div class="holder"><input type="submit" value="Recuperar senha!" /></div>
        </form>
      </fieldset>
    </div>
  </body>
</html>
<!-- vim:set et: -->
<!-- vi:set sw=2 ts=2: -->
