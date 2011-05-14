<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Begin Meta Tags -->
<title>perspektiva ::</title>
<meta name="keywords" content="enter keywords in lowercase, seperate keywords with comma and space, example:keyword1, keyword2, keyword3, keyword4" />
<meta name="description" content="Enter Page Meta Descrition - Max Length 160 Chars - Make This Visually Appealing And Try To Include Important Keywords" />
<!-- End Meta Tags -->
<link href="css/style_sheet.css" rel="stylesheet" type="text/css" />
<link href="css/general.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="favicon.ico" />
<!-- Image Showcase Invoke -->
<script language="javascript" src="js/showcase.js" type="text/javascript"></script>
<script language="javascript" src="js/all.js" type="text/javascript"></script>
<script language="javascript" src="js/jquery-1.5.2.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>
<script language="javascript" type="text/javascript"> 
$(document).ready(function(){
 
	$("ul.subnav").parent().append("<span></span>"); //Only shows drop down trigger when js is enabled - Adds empty span tag after ul.subnav
	
	$("ul.topnav li span").click(function() { //When trigger is clicked...
		
		//Following events are applied to the subnav itself (moving subnav up and down)
		$(this).parent().find("ul.subnav").slideDown('fast').show(); //Drop down the subnav on click
 
		$(this).parent().hover(function() {
		}, function(){	
			$(this).parent().find("ul.subnav").slideUp('slow'); //When the mouse hovers out of the subnav, move it back up
		});
 
		//Following events are applied to the trigger (Hover events for the trigger)
		}).hover(function() { 
			$(this).addClass("subhover"); //On hover over, add class "subhover"
		}, function(){	//On Hover Out
			$(this).removeClass("subhover"); //On hover out, remove class "subhover"
	});
 
});
</script> 
<!-- Image Showcase Invoke End -->
</head>
<!-- Head End -->
<!-- Logo -->
<body>
	<div class="container">
<div id="header"><div id="logo_area">
            	<div id="logo"><a href="#"><img src="images/header_novo.jpg" alt="#" width="930" height="187" border="none" /></a></div>
                <div id="tag_line">
                <!-- Delete This Line And Type Here To Insert A Line Of Text Under Your Logo -->
                </div>
               <div class="cleaner"></div>
            </div>
    <!-- Logo End -->
    <!-- Nav Menu -->
    <div id="menu">            
		<ul class="topnav"> 
            <li><a href="#">Home</a></li> 
            <li> 
                <a href="#">Cadastros</a> 
              <ul class="subnav"> 
                    <li><a href="#">Clientes</a></li> 
                    <li><a href="#">Departamentos</a></li> 
                    <li><a href="#">Funcion&aacute;rios</a></li> 
                    <li><a href="representantes">Representantes</a></li> 
                    <li><a href="product-list">Produtos</a></li> 
                    <li><a href="#">Status de Propostas</a></li> 
                    <li><a href="#">Indica&ccedil;&otilde;es</a></li> 
                    <li><a href="#">A&ccedil;&otilde;es</a></li> 
                    <li><a href="#">Motivos Encerramento</a></li> 
                </ul> 
            </li> 
          <li><a href="#">Prospects</a></li> 
          <li><a href="#">Relat&oacute;rios</a></li> 
          <li><a href="#">Op&ccedil;&otilde;es</a></li> 
            <li><a href="#">Logout</a></li> 
        </ul> 
	</div>            
      </div>
             <!-- Nav Menu End -->
             <!-- Image Showcase Embed -->
             <!-- Image Showcase Embed End -->
             <!-- Begin Left Page Content -->		
		     <div id="content_area">
             <div id="left">
             
             
