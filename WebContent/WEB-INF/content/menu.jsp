<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Begin Meta Tags -->
<title>perspektiva ::</title>
<meta name="keywords"
	content="enter keywords in lowercase, seperate keywords with comma and space, example:keyword1, keyword2, keyword3, keyword4" />
<meta name="description"
	content="Enter Page Meta Descrition - Max Length 160 Chars - Make This Visually Appealing And Try To Include Important Keywords" />
<!-- End Meta Tags -->
<link href="css/style_sheet.css" rel="stylesheet" type="text/css" />
<link href="css/general.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="favicon.ico" />
<!-- Image Showcase Invoke -->
<script language="javascript" src="js/showcase.js"
	type="text/javascript"></script>
<script language="javascript" src="js/all.js" type="text/javascript"></script>
<script language="javascript" src="js/jquery-1.5.2.min.js"
	type="text/javascript"></script>
<script language="javascript" type="text/javascript">
	function clearText(field) {
		if (field.defaultValue == field.value)
			field.value = '';
		else if (field.value == '')
			field.value = field.defaultValue;
	}
</script>
<script language="javascript" type="text/javascript">
	$(document).ready(function() {

		$("ul.subnav").parent().append("<span></span>"); //Only shows drop down trigger when js is enabled - Adds empty span tag after ul.subnav

		$("ul.topnav li span").click(function() { //When trigger is clicked...

			//Following events are applied to the subnav itself (moving subnav up and down)
			$(this).parent().find("ul.subnav").slideDown('fast').show(); //Drop down the subnav on click

			$(this).parent().hover(function() {
			}, function() {
				$(this).parent().find("ul.subnav").slideUp('slow'); //When the mouse hovers out of the subnav, move it back up
			});

			//Following events are applied to the trigger (Hover events for the trigger)
		}).hover(function() {
			$(this).addClass("subhover"); //On hover over, add class "subhover"
		}, function() { //On Hover Out
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
		<div id="header">
			<div id="logo_area">
				<div id="logo">
					<a href="home"><img src="images/header_novo.jpg" width="930"
						height="187" border="none" />
					</a>
				</div>
				<div id="tag_line">
					<!-- Delete This Line And Type Here To Insert A Line Of Text Under Your Logo -->
				</div>
				<div class="cleaner"></div>
			</div>
			<!-- Logo End -->
			<!-- Nav Menu -->
			<div id="menu">
				<ul class="topnav">
					<li><a href="home">Home</a>
					</li>
					<li><a href="#">Cadastros</a>
						<ul class="subnav">
		                    <li><a href="customer-index">Clientes</a></li>
		                    <li><a href="department-index">Departamentos</a></li>
		                    <li><a href="#">Funcion&aacute;rios</a></li>
		                    <li><a href="representative-index">Representantes</a></li>
		                    <li><a href="product-index">Produtos</a></li>
		                    <li><a href="#">Status de Propostas</a></li>
		                    <li><a href="indication-index">Indica&ccedil;&otilde;es</a></li>
		                    <li><a href="#">A&ccedil;&otilde;es</a></li>
		                    <li><a href="#">Motivos Encerramento</a></li>
						</ul>
					</li>
					<li><a href="#">Prospects</a>
					</li>
					<li><a href="#">Relat&oacute;rios</a>
					</li>
					<li><a href="#">Op&ccedil;&otilde;es</a>
					</li>
					<li><a href="#">Logout</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- Nav Menu End -->
		<!-- Image Showcase Embed -->
		<!-- Image Showcase Embed End -->
		<!-- Begin Left Page Content -->
		<div id="content_area">
			<div id="left">
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
</div>
             <!-- End Of Left Content -->
            <!-- Begin Right Sidebar Content -->
                           
      </div>
      <div class="cleaner"></div>
      <div id="footer_background">
        <div id="footer">
            Copyright &copy; <a href="#">perspeKtiva</a>
            | Designed by perspeKtiva Dev Team <br/>
            <a href="#" target="_parent">Pol&iacute;ca de Uso</a> | <a href="#" target="_parent">Contato</a><br/>
        </div>  
        </div>        
</div>
</body>
</html>