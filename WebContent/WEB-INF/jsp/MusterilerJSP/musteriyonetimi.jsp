<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${titles }</title>
</head>
<body>
 <div class="container">

		<h2></h2>

	</div> 
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-10" id="sabitle">
				<!-- <div class="container "> -->
					<div class="row">
						<div class="col-sm-10">
							<div class="well">
								<table class="table">
									<tr>
										<td>#</td>
										<td>İsim</td>
										<td>asda</td>
										<td>asdad</td>
										<td>asdad</td>
										<td>asdad</td>
										<td>asda</td>
									</tr>
									<c:forEach items="${tumMuteriListesi}" var="musteri"
										varStatus="siraNo">

										<tr>
											<td>${siraNo.count}</td>
											<td>${musteri.mahalle.isim}</td>
											<td>${musteri.eMail}</td>
											<td>${musteri.eMail}</td>
											<td>${musteri.eMail}</td>
											<td>${musteri.eMail}</td>
											<td>${musteri.eMail}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					<!-- </div> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>