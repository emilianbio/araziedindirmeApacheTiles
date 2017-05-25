<jsp:forward page="homePage"></jsp:forward>
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
	background-color: rgba(255, 255, 255, 0.50);
	/*background-image: url("<c:url value="/ resources/ images/ bicerdover.jpg " />");*/
	filter: alpha(opacity : 0.9);
	KHTMLOpacity: 0.40;
	MozOpacity: 0.40;
	opacity: 0.9;
	height: 25px;
	border: none;
	border-bottom-color: 1px solid grey;
	border-right: 0px solid grey;
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
	${exception }
</body>
</html>
<!------------------------------------------------------------------------------------------------------>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--
<!DOCTYPE html>

<html>
<head>
<title>JQuery-validation demo | Bootstrap</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />

<script type="text/javascript"
	src="<c:url value="/resources/script/lib/jquery-1.11.1.js"/>"></script>
<script type="text/javascript"
	src='<c:url value="/resources/script/dist/jquery.validate.js"/>'></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				


				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Using feedback icons</h3>
					</div>
					<div class="panel-body">
						<form id="signupForm1" method="post" class="form-horizontal"
							action="">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="firstname1">First
									name</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="firstname1"
										name="firstname1" placeholder="First name" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="lastname1">Last
									name</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="lastname1"
										name="lastname1" placeholder="Last name" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="username1">Username</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="username1"
										name="username1" placeholder="Username" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="email1">Email</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="email1"
										name="email1" placeholder="Email" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="password1">Password</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="password1"
										name="password1" placeholder="Password" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="confirm_password1">Confirm
									password</label>
								<div class="col-sm-5">
									<input type="password" class="form-control"
										id="confirm_password1" name="confirm_password1"
										placeholder="Confirm password" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-5 col-sm-offset-4">
									<div class="checkbox">
										<label> <input type="checkbox" id="agree1"
											name="agree1" value="agree" />Please agree to our policy
										</label>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									<button type="submit" class="btn btn-primary" name="signup1"
										value="Sign up">Sign up</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$.validator.setDefaults({
			submitHandler : function() {
				alert("submitted!");
			}
		});

		$(document)
				.ready(
						function() {
							$("#signupForm")
									.validate(
											{
												rules : {
													firstname : "required",
													lastname : "required",
													username : {
														required : true,
														minlength : 2
													},
													password : {
														required : true,
														minlength : 5
													},
													confirm_password : {
														required : true,
														minlength : 5,
														equalTo : "#password"
													},
													email : {
														required : true,
														email : true
													},
													agree : "required"
												},
												messages : {
													firstname : "Please enter your firstname",
													lastname : "Please enter your lastname",
													username : {
														required : "Please enter a username",
														minlength : "Your username must consist of at least 2 characters"
													},
													password : {
														required : "Please provide a password",
														minlength : "Your password must be at least 5 characters long"
													},
													confirm_password : {
														required : "Please provide a password",
														minlength : "Your password must be at least 5 characters long",
														equalTo : "Please enter the same password as above"
													},
													email : "Please enter a valid email address",
													agree : "Please accept our policy"
												},
												errorElement : "em",
												errorPlacement : function(
														error, element) {
													// Add the `help-block` class to the error element
													error
															.addClass("help-block");

													if (element.prop("type") === "checkbox") {
														error
																.insertAfter(element
																		.parent("label"));
													} else {
														error
																.insertAfter(element);
													}
												},
												highlight : function(element,
														errorClass, validClass) {
													$(element)
															.parents(
																	".col-sm-5")
															.addClass(
																	"has-error")
															.removeClass(
																	"has-success");
												},
												unhighlight : function(element,
														errorClass, validClass) {
													$(element)
															.parents(
																	".col-sm-5")
															.addClass(
																	"has-success")
															.removeClass(
																	"has-error");
												}
											});

							$("#signupForm1")
									.validate(
											{
												rules : {
													firstname1 : "required",
													lastname1 : "required",
													username1 : {
														required : true,
														minlength : 2
													},
													password1 : {
														required : true,
														minlength : 5
													},
													confirm_password1 : {
														required : true,
														minlength : 5,
														equalTo : "#password1"
													},
													email1 : {
														required : true,
														email : true
													},
													agree1 : "required"
												},
												messages : {
													firstname1 : "Please enter your firstname",
													lastname1 : "Please enter your lastname",
													username1 : {
														required : "Please enter a username",
														minlength : "Your username must consist of at least 2 characters"
													},
													password1 : {
														required : "Please provide a password",
														minlength : "Your password must be at least 5 characters long"
													},
													confirm_password1 : {
														required : "Please provide a password",
														minlength : "Your password must be at least 5 characters long",
														equalTo : "Please enter the same password as above"
													},
													email1 : "Please enter a valid email address",
													agree1 : "Please accept our policy"
												},
												errorElement : "em",
												errorPlacement : function(
														error, element) {
													// Add the `help-block` class to the error element
													error
															.addClass("help-block");

													// Add `has-feedback` class to the parent div.form-group
													// in order to add icons to inputs
													element
															.parents(
																	".col-sm-5")
															.addClass(
																	"has-feedback");

													if (element.prop("type") === "checkbox") {
														error
																.insertAfter(element
																		.parent("label"));
													} else {
														error
																.insertAfter(element);
													}

													// Add the span element, if doesn't exists, and apply the icon classes to it.
													if (!element.next("span")[0]) {
														$(
																"<span class='glyphicon glyphicon-remove form-control-feedback'></span>")
																.insertAfter(
																		element);
													}
												},
												success : function(label,
														element) {
													// Add the span element, if doesn't exists, and apply the icon classes to it.
													if (!$(element)
															.next("span")[0]) {
														$(
																"<span class='glyphicon glyphicon-ok form-control-feedback'></span>")
																.insertAfter(
																		$(element));
													}
												},
												highlight : function(element,
														errorClass, validClass) {
													$(element)
															.parents(
																	".col-sm-5")
															.addClass(
																	"has-error")
															.removeClass(
																	"has-success");
													$(element)
															.next("span")
															.addClass(
																	"glyphicon-remove")
															.removeClass(
																	"glyphicon-ok");
												},
												unhighlight : function(element,
														errorClass, validClass) {
													$(element)
															.parents(
																	".col-sm-5")
															.addClass(
																	"has-success")
															.removeClass(
																	"has-error");
													$(element)
															.next("span")
															.addClass(
																	"glyphicon-ok")
															.removeClass(
																	"glyphicon-remove");
												}
											});
						});
	</script>
</body>
</html>
 --%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Signin Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href='<c:url value="/resources/css/bootstrap.min.css"/>'
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link
	href='<c:url value= "/resources/css/ie10-viewport-bug-workaround.css"/>'
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href='<c:url value="/resources/css/signin.css" />'
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


<script type="text/javascript"
	src="<c:url value="/resources/script/lib/jquery-1.11.1.js"/>"></script>
<script type="text/javascript"
	src='<c:url value="/resources/script/dist/jquery.validate.js"/>'></script>
</head>

<body>

	<div class="container">
		<form class="form-signin" action="login" method="post">
			<h3 class="form-signin-heading">Please sign in</h3>
			
			<label for="inputEmail" class="sr-only">Email address</label> <input
				name="isimSoyisim" type="text" id="inputEmail" class="form-control"
				placeholder="Email address" required autofocus> <label
				for="inputPassword" class="sr-only">Password</label> <input
				name="sifre" type="password" id="inputPassword" class="form-control"
				placeholder="Password" required>
			<!-- <div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div> -->
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
				in</button>
		</form>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="<c:url value= "/resources/css/ie10-viewport-bug-workaround.js"/>"></script>

</body>
</html>



