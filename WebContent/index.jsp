<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

html, body {
	height: 100%;
}

#chartContainer {
	border-bottom: 2px solid grey;
	margin: 5% 35%;
	padding: 20px;
	padding-bottom: 0px;
}

.brand {
	margin-left: 30%;
	position: relative;
}

body {
	background-image: url("<c:url value="/ resources/ images/ bicerdover.jpg " />");
	background-position: center center;
	/* Background image doesn't tile */
	background-repeat: no-repeat;
	/* Background image is fixed in the viewport so that it doesn't move when 
     the content's height is greater than the image's height */
	background-attachment: fixed;
	/* This is what makes the background image rescale based
     on the container's size */
	background-size: cover;
	/* Set a background color that will be displayed
     while the background image is loading */
	background-color: #a4d4f4;
}

input {
	background-image: url("<c:url value="/ resources/ images/ bicerdover.jpg " />");
	filter: alpha(opacity : 0.9);
	KHTMLOpacity: 0.40;
	MozOpacity: 0.40;
	opacity: 0.9;
	height: 25px;
	border: none;
	border-bottom-color: 1px solid grey;
	border-right: 1px solid grey;
	outline: none;
	background-color: none;
	font-style: inherit;
	border-bottom-color: 1px solid red;
}

#girisBtn {
	width: 100%;
	margin-top: 10px;
	margin-bottom: 0px;
}
</style>
</head>
<body>

	<div id="chartContainer">
		<div class="brand">
			<a href="/araziedindirme"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/bakanlik.png"
				width="65px"></a>
		</div>
		<br> LÜTFEN KULLANICI BİLGİLERİNİZİ GİRİNİZ <br>
		<form action="login" method="post">
			<table>
				<tr>
					<td align="left">Kullanıcı Adınız</td>
					<td>: <input name="isimSoyisim" type="text" />
					</td>
				</tr>
				<tr>
					<td align="left">Şifreniz</td>
					<td>: <input name="sifre" type="password" />
					</td>
				</tr>
			</table>
			<input type="submit" value='GİRİŞ' class="btn btn-success"
				id="girisBtn">
		</form>
	</div>
</body>
</html>