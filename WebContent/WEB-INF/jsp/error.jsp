<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE HTML>


<html>
<head>
<meta http-equiv="Content-Type"
	content="application/vnd.ms-excel; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<c:url value="/assets/gthbLogo.png"/>" />
<title>Error |AraziEdindirme</title>

<!-- Bootstrap core CSS -->
<link href='<c:url value="/resources/css/bootstrap.min.css"/>'
	rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link
	href='<c:url value= "/resources/css/ie10-viewport-bug-workaround.css"/>'
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href='<c:url value="/resources/css/dashboard.css" />'
	rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src='<c:url value= "/resources/css/ie-emulation-modes-warning.js"/>'></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
</script>
<script src="<c:url value="/resources/script/dist/bootstrap.min.js"/>"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
   <script
		src="<c:url value= "/resources/css/ie10-viewport-bug-workaround.js"/>"></script>
    <script src="<c:url value="/resources/dist/bootstrap.min.js"/>"></script>
    
<link rel="shortcut icon"
	href="<c:url value="/resources/images/bakanlik.png"/>" />

</head>
<body>

	<!-- header -->
	<jsp:include page="header.jsp" />
	<!-- /header -->

	<!-- sidebar -->
	<!-- /sidebar -->
	<h1>HATA</h1>
	<h1>${errorMessage}</h1>
	<c:if test="${empty errorMessage}">
		<div id="page-content-wrapper" class="page-content-toggle">


			<div class="container-fluid">

				<div class="row">
					<div id="content" class="col-md-8 col-md-offset-1 col-xs-12">
						<h3>Sayfa Bulunamadı...</h3>
						
					</div>
				</div>
				<!-- /row -->
			</div>

			<!-- footer -->
			<jsp:include page="footer.jsp" />
			<!-- /footer -->
		</div>
	</c:if>
</body>
</html>