<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="ifcp/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="ifcp/img/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/ifcp/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<title>Insert title here</title>
<style>
#img {
	width: 100% px;
	height: 100% px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- Start Top Nav -->
	<jsp:include page="/header.jsp" flush="false" />
	<!-- Close Top Nav -->


	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light shadow">
		<div
			class="container d-flex justify-content-between align-items-center">
		</div>
	</nav>
	<!-- Close Header -->

	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>



	<!-- Start Content -->
	<div class="container py-5">
		<div class="row">

			<div class="col-lg-3">
				<h1 class="h2 pb-4">카테고리</h1>
				<!--  <ul class="list-unstyled templatemo-accordion"> -->
				<li class="pb-3"><a href="/companyList.ifcp?cpage=1"
					class="collapsed d-flex justify-content-between h3 text-decoration-none">
						기업 </a></li>
				<li class="pb-3"><a href="/influencerList.ifcp?cpage=1"
					class="collapsed d-flex justify-content-between h3 text-decoration-none">
						인플루언서 </a></li>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3"
								href="/influencerList.ifcp">등급</a></li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">리뷰</a></li>
								<c:if test="${loginID != null && cp != null}">
									<li class="list-inline-item"><a
										class="h3 text-dark text-decoration-none mr-3"
										href="write.ifcp">제품등록</a></li>
								</c:if>
						</ul>
					</div>
					<div class="col-md-6 pb-4">
						<div class="d-flex"></div>
					</div>
				</div>
				<div class="row">
					<!--ㅋㅏ드 시작 -->
					<c:forEach var="dto" items="${list }">
						<div class="col-md-4">
							<div class="card mb-4 product-wap rounded-0">
								<div class="card rounded-0">
									<img id="img" class="card-img rounded-0 img-fluid"
										src=${dto.value.photo }>
								</div>
								<div class="card-body">${dto.key.career_if} ${dto.key.seq_if} ${dto.value.seq }
									<a href="/influencerProfile.ifcp?seq=${dto.key.seq_if}"
										class="h3 text-decoration-none">${dto.value.name}</a>
									<ul
										class="w-100 list-unstyled d-flex justify-content-between mb-0">
										<li>${dto.value.grade }</li>
										<li class="pt-2"><span
											class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
											<span
											class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
											<span
											class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
											<span
											class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
											<span
											class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
										</li>
									</ul>
									<ul class="list-unstyled d-flex justify-content-center mb-1">
										<li><i class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i> <i
											class="text-muted fa fa-star"></i> <i
											class="text-muted fa fa-star"></i></li>
									</ul>
									<p class="text-center mb-0">${dto.value.grade }</p>
								</div>
							</div>
						</div>
					</c:forEach>
					<!--ㅋㅏ드 끝 -->

					<div div="row">
						<ul class="pagination pagination-lg justify-content-end">
							${navi }
						</ul>
					</div>
				</div>

			</div>
		</div>
		<!-- End Content -->





		<!-- Start Script -->
		<script src="<c:url value="/resources/ifcp/js/jquery-1.11.0.min.js"/>"></script>
		<script
			src="<c:url value="/resources/ifcp/js/jquery-migrate-1.2.1.min.js" />"></script>
		<script
			src="<c:url value="/resources/ifcp/js/bootstrap.bundle.min.js" />"></script>
		<script src="<c:url value="/resources/ifcp/js/templatemo.js" />"></script>
		<script src="<c:url value="/resources/ifcp/js/custom.js" />"></script>
		<!-- End Script -->
		<jsp:include page="/footer.jsp" flush="false" />
</body>
</html>