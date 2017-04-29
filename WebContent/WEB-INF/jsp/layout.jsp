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
<link rel="shortcut icon" href="<c:url value="/resources/images/pahara.png"/>" />
<title>${title}&nbsp;|&nbsp;PaharaOnline</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<title><tiles:insertAttribute name="title" ignore="true" /></title>

<%-- <link rel="stylesheet" href="<c:url value="/resources/css/style2.css"/>"> --%>
</head>
<body>


	 <tiles:insertAttribute name="header" /> 

	<tiles:insertAttribute name="menu" />

	<tiles:insertAttribute name="body" />


	<!-- style="height: px; clear: both; background-color: #555; color: white; padding: 5px; text-align: center"  -->
	<%-- <div id="footer" class="container">
			<tiles:insertAttribute name="footer" />
		</div> --%>


</body>
</html>
