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
		jq(".arazi").mouseover(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "242",
				"height" : "3",
				"transform" : "rotate(180deg)",
			})

		})

		jq(".arazi").mouseleave(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "0",
				"transform" : "rotate(-180deg)",
			})

		})

		jq(".satis").mouseover(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "363",
				"height" : "3",
				"transform" : "rotate(180deg)",
			})

		})

		jq(".satis").mouseleave(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "0",
				"transform" : "rotate(-180deg)",
			})

		})

		jq(".cikis").mouseover(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "483",
				"height" : "3",
				"transform" : "rotate(180deg)",
			})

		})

		jq(".cikis").mouseleave(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "0",
				"transform" : "rotate(-180deg)",
			})

		})

		jq(".mahalle").mouseover(function() {
			//	alert("iletisim");

			jq('#nav-bar').css({
				"left" : "0",
				"width" : "121",
				"height" : "3",
				"transform" : "rotate(180deg)",
			})

		})

		jq(".mahalle").mouseleave(function() {
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
				<a href="?">ARAZİ EDİNDİRME ŞB. MD.</a>
			</div>

			<div id="nav-container">

				<div id="nav-bar-container">
					<div id="nav-bar"></div>
				</div>
				<div class="nav raporlar">
					<a href="${pageContext.request.contextPath}/raporlar/satisrapor">
						Raporlar</a>
				</div>

				<div class="nav cikis">
					<a href="${pageContext.request.contextPath}/"><span
						class="cikisSpan">Çıkış</span></a>
				</div>
				<div class="nav satis">
					<a href="${pageContext.request.contextPath}/satis-cesitleri/satis">Satış
						İşlemleri</a>
				</div>
				<div class="nav arazi">
					<a
						href="${pageContext.request.contextPath}/arazi-cikislari/arac-islemleri">Arazi
						Çıkışları</a>
				</div>
				<div class="nav mahalle">
					<a href="${pageContext.request.contextPath}/yer-ekleme/sabitler">
						Mahalle Ekleme</a>
				</div>



			</div>
		</div>

	</nav>

</body>
</html>