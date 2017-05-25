<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE tiles-definitions PUBLIC
       "-//Apache Software Foundation//DTD Tiles Configuration 3.0//EN"
       "http://tiles.apache.org/dtds/tiles-config_3_0.dtd">


<html>
<head>
<meta http-equiv="Content-Type"
	content="application/vnd.ms-excel; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Dashboard Template for Bootstrap</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<script	src='<c:url value= "/resources/css/ie-emulation-modes-warning.js"/>'></script>

<script
	src='<c:url value="/resources/jquery-3.1.1.min.js"/>'></script>
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
<script src="<c:url value="/resources/script/dist/holder.min.js"/>"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script
	src="<c:url value= "/resources/css/ie10-viewport-bug-workaround.js"/>"></script>
<script src="<c:url value="/resources/dist/bootstrap.min.js"/>"></script>
<script src='<c:url value="/resources/script/genel2.js"  ></c:url>'></script>
<link rel="shortcut icon"
	href="<c:url value="/resources/images/bakanlik.png"/>" />
<title>${title}&nbsp;|&nbsp;AraziEdindirme</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title><tiles:insertAttribute name="title" ignore="true" /></title>

</head>
<body>


	<tiles:insertAttribute name="header" />

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<tiles:insertAttribute name="menu" />
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>

	<!-- style="height: px; clear: both; background-color: #555; color: white; padding: 5px; text-align: center"  -->
	<%-- <div id="footer" class="container">
			<tiles:insertAttribute name="footer" />
		</div> --%>


</body>
</html>
