<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://fonts.googleapis.com/css?family=Slabo+27px"
	rel="stylesheet">
<meta charset="utf-8">

<title>DNZR</title>
<style type="text/css">
#chartContainer {
	width: 940px;
	padding: 40px 10px;
	height: 400px;
	margin: auto;
}
</style>
<!--{
margin
:
 
0
px
;

	
padding
:
 
0
px
;


}
body, html {
	
}

nav {
	position: absolute;
	height: 100px;
	width: 100%;
	text-align: center;
	line-height: 140px;
	z-index: 2;
}

nav a {
	color: #fff;
	font-family: 'Slabo 27px', serif;
	text-decoration: none;
	font-size: 24px;
	margin-right: 5px;
	padding: 15px 15px;
	transition: all 0.4s ease-in-out;
}

nav a:HOVER {
	background: black;
	border-radius: 0.5em 3em/2em 1em 4em;
	/* -moz-border-radius: 2em 1em 4em/0.5em 3em;
	-webkit-border-radius: 2em 1em 4em/0.5em 3em; */
}

.gorsel {
	height: 100%;
	background-color: lightblue;
	background-size: cover;
}

.bant {
	height: 50%;
	background-color: lightgreen;
}

#gor1 {
	background: url("<c:url value="/ resources/ images/ bicerdover.jpg " />");
}

#gor2 {
	background: url("<c:url value="/ resources/ images/ bugday.jpg " />");
}

#gor3 {
	background: url("<c:url value="/ resources/ images/ grass.jpg " />");
}

.anasayfa {
	position: absolute;
	float: left;
}

.anayazi {
	width: 100%;
	height: 100%;
	z-index: 1;
	text-align: center;
	margin-top: 250px;
}

.anafiltre {
	width: 100%;
	height: 100%;
	background-color: black;
	opacity: 0.34;
	z-index: 0;
	position: fixed;
}
</style>

</head>
 <body>
	<nav>
		<a href="#gor1">HOME</a> <a href="#gor2">ABOUT</a> <a href="#gor3">WORKS</a>
		<a href="#services">SERVICES</a> <a href="#portfolio">PORTFOLIO</a> <a
			href="#contact">CONTACT</a>
	</nav>

	<div id="gor1" class="gorsel">

		<div class="anasayfa anayazi">
			<h1>CREATIVE STUDIO</h1>

			<P>Lorem Ipsum Dolat Sit
			<p>

				<span>get more info..</span>
		</div>
		<div class="anasayfa anafiltre"></div>

	</div>


	<div id="bant1" class="bant"></div>
	<div id="gor2" class="gorsel"></div>
	<div id="bant2" class="bant"></div>
	<div id="gor3" class="gorsel"></div>
	<div id="bant3" class="bant"></div>

</body>




</html>
 -->

<!--------------------------------------------------------------------------------------------------------------------->
<%-- <header>
	<div id="header-container">
		<div id="header-main">
			<div id="header-main-buffer"></div>
			<h1>PAHARA ONLINE ALISVERİS SİTESİ</h1>
			<h2>created by Emrah DENİZER</h2>
			<div id="header-download-button">
				<span>İndirmek İçin Tıklayın</span>
			</div>
		</div>
		<div id="header-logo"></div>
	</div>
</header>
<section id="content">
	<div id="content-container">
		<div id="content-main">
			<br> <br>
			<h2>DENEM DENEME DENEME</h2>
			<H3>ASDASDAS ASDASD ASDAS ASD ASDLK ŞALSKD ŞLWJ ŞALKSJD
				ŞALSKJDŞAL KSD</H3>
		</div>
		<div id="content-logo">
			<img src="<c:url value="/resources/images/duzenle.png"/>" alt="">
		</div>
	</div>
</section>

<section id="content2">
	<div id="content2-container">
		<h2>DOKUMANTASYON</h2>
		<H3>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
			do eiusmod tempor incididunt ut labore et dolore magna aliqua.</H3>


		<div class="content2-tile">
			<div class="content2-tile-img">
				<img alt="" src="<c:url value="/resources/images/gthbLogo.png" />">
			</div>
			<div class="content2-tile-heading">Nedir?</div>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris n</p>

		</div>

		<div class="content2-tile">
			<div class="content2-tile-img">
				<img alt="" src="<c:url value="/resources/images/Delete-32.png" />">
			</div>
			<div class="content2-tile-heading">Ne Değildir?</div>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris n</p>

		</div>


		<div class="content2-tile">
			<div class="content2-tile-img">
				<img alt="" src="<c:url value="/resources/images/gthbLogo.png" />">
			</div>
			<div class="content2-tile-heading">Nedir?</div>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris n</p>

		</div>


		<div class="content2-tile">
			<div class="content2-tile-img">
				<img alt="" src="<c:url value="/resources/images/Delete-32.png" />">
			</div>
			<div class="content2-tile-heading">Nedir?</div>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris n</p>

		</div>

		<div style="clear: both;"></div>

		<h2 style="margin-top: 20px">Kayıtlar</h2>
		<span style="text-align: justify;">
			<h3>M.Ö. 45 tarihinde Çiçero tarafından yazılan "de Finibus
				Bonorum et Malorum"un 1.10.33 sayılı bölümü</h3>
			<p>"At vero eos et accusamus et iusto odio dignissimos ducimus
				qui blanditiis praesentium voluptatum deleniti atque corrupti quos
				dolores et quas molestias excepturi sint occaecati cupiditate non
				provident, similique sunt in culpa qui officia deserunt mollitia
				animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis
				est et expedita distinctio. Nam libero tempore, cum soluta nobis est
				eligendi optio cumque nihil impedit quo minus id quod maxime placeat
				facere possimus, omnis voluptas assumenda est, omnis dolor
				repellendus. Temporibus autem quibusdam et aut officiis debitis aut
				rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint
				et molestiae non recusandae. Itaque earum rerum hic tenetur a
				sapiente delectus, ut aut reiciendis voluptatibus maiores alias
				consequatur aut perferendis doloribus asperiores repellat."</p>
		</span>
	</div>
</section>

<section id="deneme">
	<BR> <BR> <BR> 
</section> --%>
<!--------------------------------------------------------------------------------------------------------------------->

<div id="chartContainer">
	<div class="brand">
		<a href="/araziedindirme"><img alt=""
			src="${pageContext.request.contextPath}/resources/images/gthbLogo2.png"
			width="65px"></a>
	</div>
	<br> LÜTFEN KULLANICI BİLGİLERİNİZİ GİRİNİZ <br>
	<form:form action="login" method="post" commandName="kullanici"
		autocomplete="off">
		<form:hidden path="id" />
		<table>
			<tr>
				<td align="left">Kullanıcı Adınız</td>
				<td>: <form:input path="isimSoyisim" type="text"
						style="border-radius: 5px; border: none;"
						placeholder=" Lütfen adınızı giriniz..!" />
				</td>
			</tr>
			<tr>
				<td align="left">Şifreniz</td>
				<td>: <form:input path="sifre" type="password"
						style="border-radius: 5px; border: none;"
						placeholder=" Lütfen şifrenizi giriniz..!" />
				</td>
			</tr>
		</table>
		<input type="submit" value='GİRİŞ' class="btn btn-success">
	</form:form>
</div>
<%-- 
<!--   -->
<c:if test="${girisBasarili == '1'}">
	<script type="text/javascript">
		$("#uyari").hide();
	</script>
</c:if>

<div id='uyari' class="conteiner-fluid"
	style='z-index: 20000; margin: 0px; padding: 0px; align: center; border-radius: 5px; text-align: center; top: 50%; box-sizing: border-box; left: 50%; border: 2px groove #ff9900; font-size: 20px; display: inline; position: fixed; background-color: white; -webkit-transform: translate(-50%, -50%); opacity: 1; filter: alpha(opacity = 90); width: 100%; height: 100%;'>
	<div
		style='text-align: center; position: fixed; top: 10%; box-sizing: border-box; left: 30%; width: auto; height: auto; border: 7px outset #ff8800; border-radius: 10px;'>
		<div class="brand">
			<a href="/arazisatis"><img alt=""
				src="${pageContext.request.contextPath}/assets/gthbLogo.png"
				width="65px"></a>
		</div>
		<BR> LÜTFEN KULLANICI BİLGİLERİNİZİ GİRİNİZ<br>
		<form action="login" method="get">
			<table class="table">
				<tr>
					<td align="left">Kullanıcı Adınız</td>
					<td>: <input name="isim" type="text"
						style="border-radius: 5px; border: none;"
						placeholder=" Lütfen adınızı giriniz..!">
					</td>
				</tr>
				<tr>
					<td align="left">Şifreniz</td>
					<td>: <input name="sifre" type="password"
						style="border-radius: 5px; border: none;"
						placeholder=" Lütfen şifrenizi giriniz..!">
					</td>
				</tr>
			</table>
			<input type="submit" value='GİRİŞ' class="btn btn-success">
		</form>
	</div>
</div> --%>