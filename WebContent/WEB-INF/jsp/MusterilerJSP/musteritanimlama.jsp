<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="springForm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${title}</title>
<style type="text/css">
#sabitler {
	position: fixed;
}

/* input {
	width: 100px;
	height: 20px;
	size: 50px;
	padding-left: 0px !important;
	padding-right: 0px !important;
	border: none;
	font-size: 15px;
	font-family: serif;
}

label {
	font-family: monospace;
	font-size: 12px;
	padding-left: 7px !important;
	padding-right: 0px !important;
	font-size: 12px;
}

td, th {
	padding: 0px !important;
	width: 20px !important;
	border-color: grey !important;
	border-height: 50px !important;
} */
</style>
</head>
<body>

	<div class="container">
		${yerListesi}
		<h2></h2>
	</div>
	<div class="col-sm-10" id="sabitler">
		<div class="container ">
			<div class="row">
				<form:form action="musteriEkle" methos="post" commandName="musteri"
					class="form-horizontal">
					<form:hidden path="id" />
					<table class="table table-hover table-responsive">
						<caption>Müşteri Bilgileri</caption>
						<tr>
							<th><form:label path="isim">İsim</form:label></th>
							<td><form:input path="isim" placeholder="İsminizi Giriniz" /></td>
							<th><form:label path="soyIsim" class="form-horizontal">Soyisim</form:label></th>
							<td><form:input path="soyIsim"
									placeholder="Soyisminizi Giriniz" /></td>

							<th><form:label path="eMail">E-Mail</form:label></th>
							<td><form:input path="eMail" type="mail"
									placeholder="Mail Adresinizi Giriniz" /></td>

							<th><form:label path="cepTelNo">Cep Telefonu</form:label></th>
							<td><form:input path="cepTelNo"
									placeholder="Cep Telefonu Giriniz" /></td>

						</tr>
						<tr>

							<th><form:label path="isyeri">İşyeri Adı</form:label></th>
							<td><form:input path="isyeri"
									placeholder="İş Yeri Adını Giriniz" /></td>


							<th><form:label path="binaNo">Bina No</form:label></th>
							<td><form:input path="binaNo" placeholder="Bina No Giriniz" /></td>


							<th><form:label path="icKapiNo">İç Kapı No</form:label></th>
							<td><form:input path="icKapiNo"
									placeholder="İç Kapı No Giriniz" /></td>



							<th><form:label path="kat">Kat</form:label></th>
							<td><form:input path="kat" placeholder="Kat No Giriniz" /></td>
						</tr>
						<tr>

							<th><form:label path="cbms">CBMS</form:label></th>
							<td><form:input path="cbms" placeholder="CBMS Giriniz" /></td>


							<th><form:label path="mahalle.id">Mahalle</form:label></th>
							<td><form:select path="mahalle.id"
									placeholder="Mahalle Adı Giriniz">
									<form:options items="${yerListesi}" itemLabel="isim"
										itemValue="id" />



								</form:select></td>

							<th><form:label path="meslek">Meslek</form:label></th>
							<td><form:input path="meslek"
									placeholder="Mesleğinizi Giriniz" /></td>

							<th><form:label path="referans">Referans</form:label></th>
							<td><form:input path="referans"
									placeholder="Referans Giriniz" /></td>


						</tr>
						<tr>
							<th><form:label path="isTelNo">İş Telefonu</form:label></th>
							<td><form:input path="isTelNo"
									placeholder="İş Telefonu Giriniz" /></td>
						</tr>

					</table>
					<a href="${pageContext.request.contextPath}/musteri/musteriEkle"
						type="button">Ekle</a>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
