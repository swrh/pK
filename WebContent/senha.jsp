<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>  
  <header>  
    <title>perspeKtiva :: senha</title>  
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
    <link href="css/login.css" rel="stylesheet" type="text/css" />
  </header>  
<body>  
    <div id="login">  
      <fieldset>
            <form name="formSenha" action="senhaRecover" method="post">
                <div class="holder">E-mail: </div><input type="text" name="usuario.login" size="20" maxlength="45"/><br /><br />
                <s:fielderror fieldName="usuario.email"/>
                <div class="holder"><input type="submit" value="Recuperar senha!" /></div>
            </form>
        </fieldset>
    </div>  
  </body>  
</html>  