<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="header-araccikis">
	<table>
		<tr>
			<td rowspan="2">PERSONEL</td>
			<td rowspan="2">ARAÇ PLAKASI</td>
			<td rowspan="2">ÖZEL ARAÇ</td>
			<td colspan="2">GİDİLEN YER</td>
			<td ROWspan="2">TARİH</td>
			<td rowspan="2">ÇIKIŞ SAATİ</td>
			<td rowspan="2">GİRİŞ SAATİ</td>
			<td rowspan="2">İŞİN ÖZETİ</td>
		</tr>
		<tr>

			<td>İLÇE</td>
			<td>MAHALLE</td>

		</tr>
		<form:form class="form-inline">
			<tr>
				<td><select class="form-control">
						<option>Emrah Denizer</option>
						<option>Muharrem Cerit</option>
						<option>Harun Doğru</option>
				</select></td>
				<td><select class="form-control">
						<option>01 JDF 016</option>
						<option>01 R 132</option>
						<option>01 VD 152</option>
				</select></td>
				<td><input class="form-control" /></td>
				<td><input class="form-control" /></td>
				<td><input class="form-control" /></td>
				<td><input class="form-control" /></td>
				<td><input class="form-control" /></td>
				<td><input class="form-control" /></td>
				<td><input class="form-control" /></td>
			</tr>
			<tr>
				<td colspan="9" align="right"><input type="button"
					class="btn btn-primary" value="Ekle" /></td>
			</tr>
		</form:form>
	</table>

	<table class="table table-striped">

		<tr>
			<td>Sıra</td>
			<td>Personel</td>
			<td>Plaka</td>
			<td>Gidilen Yer</td>
			<td>Çıkış Saati</td>
			<td>Giriş Saati</td>
			<td>İşin Özeti</td>
		</tr>
		<tr>
			<td>1</td>
			<td>Emrah Denizer</td>
			<td>01 JDF 016</td>
			<td>Sarıçam-Yeniyayla</td>
			<td>09:30</td>
			<td>14:30</td>
			<td>XXXXXXXXXX</td>
		</tr>
		<tr>
			<td>2</td>
			<td>Muharrem Cerit</td>
			<td>01 JDF 016</td>
			<td>Sarıçam-Yeniyayla</td>
			<td>09:30</td>
			<td>14:30</td>
			<td>XXXXXXXXXX</td>
		</tr>

	</table>
</div>
