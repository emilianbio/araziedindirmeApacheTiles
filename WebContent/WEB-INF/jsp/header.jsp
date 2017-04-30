<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript"
	src="<c:url value="/resources/script/jquery-3.1.0.min.js" />">
	
</script>

<html>
<title>${title}</title>
<head>
<script type="text/javascript">
	var jq = jQuery.noConflict();

	jq(document).ready(function() {
		jq(".hakkinda").mouseover(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "242",
				"height" : "3",
				"transform" : "rotate(180deg)",
			})

		})

		jq(".hakkinda").mouseleave(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "0",
				"transform" : "rotate(-180deg)",
			})

		})

		jq(".iletisim").mouseover(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "363",
				"height" : "3",
				"transform" : "rotate(180deg)",
			})

		})

		jq(".iletisim").mouseleave(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "0",
				"transform" : "rotate(-180deg)",
			})

		})

		jq(".login").mouseover(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "483",
				"height" : "3",
				"transform" : "rotate(180deg)",
			})

		})

		jq(".login").mouseleave(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "0",
				"transform" : "rotate(-180deg)",
			})

		})

		jq(".urunler").mouseover(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "121",
				"height" : "3",
				"transform" : "rotate(180deg)",
			})

		})

		jq(".urunler").mouseleave(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "0",
				"transform" : "rotate(-180deg)",
			})

		})

	});
</script>


</head>

<body>
	<nav>
		<div id="nav">

			<div id="nav-logo"></div>
			<div id="nav-brand">
				<a href="?">pahara online</a>
			</div>

			<div id="nav-container">

				<div id="nav-bar-container">
					<div id="nav-bar"></div>
				</div>
				<div class="nav login">
					<a href="${pageContext.request.contextPath}/">Sisteme Giriş</a>
				</div>
				<div class="nav iletisim">
					<a href="${pageContext.request.contextPath}/">İletişim
						Bilgileri</a>
				</div>
				<div class="nav hakkinda">
					<a
						href="${pageContext.request.contextPath}/arazi-cikislari/arac-islemleri">Arazi
						Çıkışları</a>
				</div>
				<div class="nav urunler">
					<a href="${pageContext.request.contextPath}/yer-ekleme/sabitler">
						Ürünler</a>
				</div>

			</div>
		</div>

	</nav>

</body>
</html>