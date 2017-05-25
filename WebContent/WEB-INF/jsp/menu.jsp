

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	var pathname = window.location.pathname; // Returns path only
	var url = window.location.href;

	console.log(pathname + " " + url);
	jQuery(function() {
		// #sidebar-toggle-button
		jQuery('#sidebar-toggle-button').on('click', function() {
			jQuery('#sidebar').toggleClass('sidebar-toggle');
			jQuery('#page-content-wrapper').toggleClass('page-content-toggle');
			fireResize();
		});

		// sidebar collapse behavior
		jQuery('#sidebar').on('show.bs.collapse', function() {
			jQuery('#sidebar').find('.collapse.in').collapse('hide');
		});

		// To make current link active
		(function addActiveToNestedList() {
			var pageURL = jQuery(location).attr('href');
			var URLSplits = pageURL.split('/');

			var routeURL = '/' + URLSplits[URLSplits.length - 2] + '/'
					+ URLSplits[URLSplits.length - 1];
			var activeNestedList = jQuery(
					'.sub-menu > li > a[href$="' + routeURL + '"]').parent();

			if (activeNestedList.length !== 0
					&& !activeNestedList.hasClass('active')) {
				jQuery('.sub-menu > li').removeClass('active');
				activeNestedList.addClass('active');
			}
		})();

		function fireResize() {
			if (document.createEvent) { // W3C
				var ev = document.createEvent('Event');
				ev.initEvent('resize', true, true);
				window.dispatchEvent(ev);
			} else { // IE
				element = document.documentElement;
				var event = document.createEventObject();
				element.fireEvent("onresize", event);
			}
		}

	})
</script>




<div id="sidebar" class="sidebar-toggle">
	<ul class="nav nav-sidebar">
		<li><a href="${pageContext.request.contextPath}/anasayfa"> <i
				class="fa fa-home" aria-hidden="true"></i> <span>ANASAYFA</span>
		</a></li>
		<li role="separator" class="divider"></li>

		<!-- chart types -->
		<li data-toggle="collapse" href="#chart-types" aria-expanded="false"
			aria-controls="chart-types"><a href="#"> <i
				class="fa fa-area-chart" aria-hidden="true"></i><span>SATIŞLAR</span>
		</a></li>
		<li>
			<!-- !HATIRLATMA! sayfa yenilendiğinde aktif olan link sidebar kısmında seçili olarak geliyor -->
			<ul id="chart-types"
				class="sub-menu collapse ${fn:contains(pageContext.request.requestURI,'satis-cesitleri') ? 'in' : ''}">
				<!-- HATIRLATMA SONU! -->
				<li><a
					href="${pageContext.request.contextPath}/satis-cesitleri/satis">Satış
						Yoluyla Devir (5403)</a></li>
				<%-- <li><a
					href="${pageContext.request.contextPath}/satis-cesitleri/miras">Miras
						Yoluyla Devir (5403)</a></li>
				<li><a
					href="${pageContext.request.contextPath}/satis-cesitleri/3083">3083</a></li>
				<li><a
					href="${pageContext.request.contextPath}/satis-cesitleri/vasif">Vasıf</a></li> --%>
			</ul>
		</li>
		<c:if test="${cookie.id.value==1 || cookie.id.value==9}">
			<!-- /chart types -->
			<li role="separator" class="divider"></li>
			<li data-toggle="collapse" href="#features" aria-expanded="false"
				aria-controls="features"><a href="#"> <i
					class="fa fa-indent" aria-hidden="true"></i><span>RAPORLAR</span>
			</a></li>
			<li>
				<!-- !HATIRLATMA! sayfa yenilendiğinde aktif olan link sidebar kısmında seçili olarak geliyor -->
				<ul id="features"
					class="sub-menu collapse ${fn:contains(pageContext.request.requestURI,'raporlar') ? 'in' : ''}">
					<!-- HATIRLATMA SONU! -->
					<li><a
						href="${pageContext.request.contextPath}/raporlar/satisrapor">Satış
							Yoluyla Devir (5403)</a></li>
				</ul>
			</li>
			<!-- /chart types -->



			<li role="separator" class="divider"></li>

			<li data-toggle="collapse" href="#izin" aria-expanded="false"
				aria-controls="features"><a href="#"> <i
					class="fa fa-map-marker" aria-hidden="true"></i><span>İZİN
						İŞLEMLERİ</span>
			</a></li>
			<li>
				<!-- !HATIRLATMA! sayfa yenilendiğinde aktif olan link sidebar kısmında seçili olarak geliyor -->
				<ul id="izin"
					class="sub-menu collapse ${fn:contains(pageContext.request.requestURI,'izin-islemleri') ? 'in' : ''}">
					<!-- HATIRLATMA SONU! -->
					<li><a
						href="${pageContext.request.contextPath}/izin-islemleri/izin-formu">İzin
							İşlemleri</a></li>
				</ul>
			</li>
		</c:if>
		<!-- /chart types -->
		<li role="separator" class="divider"></li>
		<li data-toggle="collapse" href="#arazi" aria-expanded="false"
			aria-controls="features"><a href="#"> <i class="fa fa-star"
				aria-hidden="true"></i><span>ARAZİ ÇIKIŞLARI</span>
		</a></li>
		<li>
			<!-- !HATIRLATMA! sayfa yenilendiğinde aktif olan link sidebar kısmında seçili olarak geliyor -->
			<ul id="arazi"
				class="sub-menu collapse ${fn:contains(pageContext.request.requestURI,'arazi-cikislari') ? 'in' : ''}">
				<!-- HATIRLATMA SONU! -->
				<li><a
					href="${pageContext.request.contextPath}/arazi-cikislari/arac-islemleri">Araç
						İşlemleri</a></li>
			</ul>
		</li>

		<c:if test="${cookie.id.value==1 }">
			<!-- /chart types -->
			<li role="separator" class="divider"></li>
			<li data-toggle="collapse" href="#sabitler" aria-expanded="false"
				aria-controls="features"><a href="#"> <i class="fa fa-star"
					aria-hidden="true"></i><span>YÖNETİM PANELİ</span>
			</a></li>

			<li>
				<!-- !HATIRLATMA! sayfa yenilendiğinde aktif olan link sidebar kısmında seçili olarak geliyor -->
				<ul id="sabitler"
					class="sub-menu collapse ${fn:contains(pageContext.request.requestURI,'yer-ekleme') ? 'in' : ''}">
					<!-- HATIRLATMA SONU! -->
					<li><a
						href="${pageContext.request.contextPath}/yer-ekleme/sabitler">Köy/Mahalle/İlçe/İl
							Ekleme</a></li>
					<li><a
						href="${pageContext.request.contextPath}/roller/rol-yonetimi">Kullanici
							Yetki Belirleme</a></li>
				</ul>
			</li>
		</c:if>
	</ul>
</div>