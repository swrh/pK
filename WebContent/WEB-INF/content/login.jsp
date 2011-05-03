<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>  
  <header>  
    <title>perspeKtiva :: login</title>  
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">  
  </header>  
  <body>  
    <div id="login">  
      <fieldset>
            <form name="formLogin" action="login" method="post">
                <div class="holder">Login: </div><input type="text" name="usuario.login" size="20" maxlength="45"/><br />
                <div class="holder">Senha: </div><input type="password" name="usuario.senha" size="20" maxlength="20"/><br />
                <div class="holder"><a href="senha.jsp">Esqueci a senha!</a></div><br />
                <s:fielderror fieldName="usuario.login"/>
                <s:fielderror fieldName="usuario.senha"/>
                <s:fielderror fieldName="usuario.invalid"/>
                <div class="holder"><input type="submit" value="Login" /></div>
            </form>
        </fieldset>
    </div>  
  </body>  
</html>  