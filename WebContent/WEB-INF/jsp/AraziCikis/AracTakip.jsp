<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript">
	jq(document).ready(function() {
		jq('#ozelPlaka').keypress(function(e) {
			var regex = new RegExp("^[a-zA-Z0-9-]+$");
			var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
			if (regex.test(str)) {
				return true;
			}

			e.preventDefault();
			return false;
		});

	})

	function buyukHarf() {
		jq('input[type=text]').val(function() {
			/* this.value.replace(" ", ""); */

			return this.value.toUpperCase().replace(" ", "");
		})

	};

	function ozelKarakterEngelle() {

	}

	function gidilenYer(deger) {
		alert(deger);
	}
	/*Firefox date input için script kodu  */
	 webshims.setOptions('waitReady', false);
	 webshims.setOptions('forms-ext', {types: 'date'});
	 webshims.polyfill('forms forms-ext');
	 /*Firefox script sonu  */
</script>
<div class="header-araccikis">
	<table>
		<tr>
			<td rowspan="2">PERSONEL</td>
			<td rowspan="2">ARAÇ PLAKASI</td>
			<td rowspan="2">ÖZEL ARAÇ</td>
			<td colspan="2" style="text-align: center;">GİDİLEN YER</td>
			<td ROWspan="2">TARİH</td>
			<td rowspan="2">ÇIKIŞ SAATİ</td>
			<td rowspan="2">GİRİŞ SAATİ</td>
			<td rowspan="2">İŞİN ÖZETİ</td>
		</tr>
		<tr>

			<td style="text-align: center;">İLÇE</td>
			<td style="text-align: center;">MAHALLE</td>

		</tr>
		<form:form commandName="arac" method="post" action="araziCikisEkle">
			<form:hidden path="id" />
			<tr>
				<td style="width: 200px;"><form:select path="kullanici.id"
						id="slctAltTip">
						<form:option value="0">Seçiniz</form:option>
						<form:options items="${girisYapanKullanici}" itemValue="id"
							itemLabel="adi" />
					</form:select></td>
				<td><form:select path="resmiPlaka" id="resmiPlaka">
						<form:option value="01R9567">01 R 9567</form:option>
					</form:select></td>
				<td><form:input path="ozelPlaka" type="text" id="ozelPlaka"
						onkeyup="buyukHarf();" /></td>
				<!--ilce-->
				<td><form:select path="ilce.id" id="slctAltTip"
						onChange="ikisibiradamarkala(this.value)">
						<form:option value="0">Seçiniz</form:option>
						<form:options items="${ilceListesi}" itemValue="id"
							itemLabel="isim" />
					</form:select></td>

				<td><form:select path="mahalle.id" id="slctMarka">
						<form:option value="0">Seçiniz</form:option>
						<form:options items="${markaListesi}" itemValue="id"
							itemLabel="isim" />
					</form:select></td>
				<td><form:input path="tarih" type="date" /></td>
				<td><form:select path="cikisSaati">
						<form:option value="08:00">08:00</form:option>
						<form:option value="08:30">08:30</form:option>
						<form:option value="09:00">09:00</form:option>
						<form:option value="09:30">09:30</form:option>
						<form:option value="10:00">10:00</form:option>
						<form:option value="10:30">10:30</form:option>
						<form:option value="11:00">11:00</form:option>
						<form:option value="11:30">11:30</form:option>
						<form:option value="12:00">12:00</form:option>
						<form:option value="12:30">12:30</form:option>
						<form:option value="13:00">13:00</form:option>
						<form:option value="13:30">13:30</form:option>
						<form:option value="14:00">14:00</form:option>
						<form:option value="14:30">14:30</form:option>
						<form:option value="15:00">15:00</form:option>
						<form:option value="15:30">15:30</form:option>
						<form:option value="15:00">16:00</form:option>
						<form:option value="15:30">16:30</form:option>
						<form:option value="15:00">17:00</form:option>
					</form:select></td>
				<td><form:select path="girisSaati">
						<form:option value="08:00">08:00</form:option>
						<form:option value="08:30">08:30</form:option>
						<form:option value="09:00">09:00</form:option>
						<form:option value="09:30">09:30</form:option>
						<form:option value="10:00">10:00</form:option>
						<form:option value="10:30">10:30</form:option>
						<form:option value="11:00">11:00</form:option>
						<form:option value="11:30">11:30</form:option>
						<form:option value="12:00">12:00</form:option>
						<form:option value="12:30">12:30</form:option>
						<form:option value="13:00">13:00</form:option>
						<form:option value="13:30">13:30</form:option>
						<form:option value="14:00">14:00</form:option>
						<form:option value="14:30">14:30</form:option>
						<form:option value="15:00">15:00</form:option>
						<form:option value="15:30">15:30</form:option>
						<form:option value="15:00">16:00</form:option>
						<form:option value="15:30">16:30</form:option>
						<form:option value="15:00">17:00</form:option>
					</form:select></td>
				<td><form:input path="aciklama" type="text" /></td>
			</tr>
			<tr>
				<td colspan="9" ><input type="submit"
					class="btn btn-primary" value="Ekle" /></td>
			</tr>
		</form:form>
	</table>
	<div class="tabloAyraci">
		<span>Çıkış Listesi</span>
	</div>
	<table class="table table-striped">

		<tr>
			<th>Sil</th>
			<th>edit</th>
			<td>Sıra</td>
			<td>Personel</td>
			<td>Plaka</td>
			<td>Gidilen Yer</td>
			<td>Çıkış Tarihi</td>
			<td>Çıkış Saati</td>
			<td>Giriş Saati</td>
			<td>İşin Özeti</td>
			<td>Kaydeden</td>
			<td>Kayıt Tarihi</td>
		</tr>
		<c:forEach items="${aracCikisListesi}" var="cikis" varStatus="sira">
			<tr>

				<td><img
					src="<c:url value="/resources/images/Delete-32.png" />"
					width="21px" onclick="tipsil(${sabitTips.id})"
					title="Silmek İçin Tıklayın" /></td>
				<td><a href="./duzenle/${cikis.id}"><img
						src="<c:url value="/resources/images/duzenle.png" />" width="21px"
						title="Değiştirmek İçin Tıklayın" /></a></td>


				<td>${sira.count }</td>
				<td>${cikis.kullanici.adi}</td>
				<c:if test="${!empty cikis.ozelPlaka}">
					<td>${cikis.ozelPlaka }</td>
				</c:if>

				<c:if test="${!empty cikis.resmiPlaka }">
					<td>${cikis.resmiPlaka }</td>
				</c:if>

				<td>${cikis.ilce.isim}-${cikis.mahalle.isim}</td>
				<td>${cikis.tarih}</td>
				<td>${cikis.cikisSaati}</td>
				<td>${cikis.girisSaati}</td>
				<td>${cikis.aciklama}</td>
				<td>${cikis.islemyapan.adi}</td>
				<td>${cikis.islemZamani}</td>
			</tr>
		</c:forEach>

	</table>

</div>
