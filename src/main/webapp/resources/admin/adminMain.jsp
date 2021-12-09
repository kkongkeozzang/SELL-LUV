<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 태그 라이브러리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<html lang="en">
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style type="text/css">
body {
	margin-top: 20px;
	background-color: #f7f7ff;
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0px solid rgba(0, 0, 0, 0);
	border-radius: .25rem;
	margin-bottom: 1.5rem;
	box-shadow: 0 2px 6px 0 rgb(218 218 253/ 65%), 0 2px 6px 0
		rgb(206 206 238/ 54%);
}

.fm-file-box {
	font-size: 25px;
	background: #e9ecef;
	width: 44px;
	height: 44px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: .25rem;
}

.ms-2 {
	margin-left: .5rem !important;
}

.fm-menu .list-group a {
	font-size: 16px;
	color: #5f5f5f;
	display: flex;
	align-items: center;
}

.list-group-flush>.list-group-item {
	border-width: 0 0 1px;
}

.list-group-item+.list-group-item {
	border-top-width: 0;
}

.py-1 {
	padding-top: .25rem !important;
	padding-bottom: .25rem !important;
}

.list-group-item {
	position: relative;
	display: block;
	padding: .5rem 1rem;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, .125);
}

.radius-15 {
	border-radius: 15px;
}

.fm-icon-box {
	font-size: 32px;
	background: #ffffff;
	width: 52px;
	height: 52px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: .25rem;
}

.font-24 {
	font-size: 24px;
}

.ms-auto {
	margin-left: auto !important;
}

.font-30 {
	font-size: 30px;
}

.user-groups img {
	margin-left: -14px;
	border: 1px solid #e4e4e4;
	padding: 2px;
	cursor: pointer;
}

.rounded-circle {
	border-radius: 50% !important;
}

#header {
	margin-bottom: 100px;
}

</style>
<script type="text/javascript">
	
</script>
<body>
	<link href="https://cdn.lineicons.com/3.0/lineicons.css"
		rel="stylesheet">
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		rel="stylesheet" />
	<link
		href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css"
		rel="stylesheet" />

	<div class="container">
		<div class="row" id="header">
			<div class="col">
				<jsp:include page="/header.jsp" flush="false" />
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-3">
				<div class="card">
					<div class="card-body">
						<div class="d-grid"></div>
						<div class="list-group list-group-flush">
							<a href="/adminMain.admin" class="list-group-item py-1">
							<h5 class="my-3">DashBoard</h5></a>
						</div>
						<div class="fm-menu">
							<div class="list-group list-group-flush">
								<a href="/adminCard.admin" class="list-group-item py-1"><i
									class="bx bx-folder me-2"></i><span>카드 관리</span></a> 
								<a href="/adminBoard.admin" class="list-group-item py-1"><i
									class="bx bx-devices me-2"></i><span>자유게시판 관리</span></a> 
								<a href="/adminMember.admin" class="list-group-item py-1"><i
									class="bx bx-file me-2"></i><span>회원관리</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-lg-9">
				<div class="card">
					<div class="card-body">
						<div class="row mt-3">
						<h5>DashBoard</h5>
							<div class="col-12 col-lg-4">
								<div class="card shadow-none border radius-15">
									<div class="card-body">
										<div class="d-flex align-items-center">
											<div class="fm-icon-box radius-15 bg-primary text-white">
											<i class="far fa-address-card"></i>
											</div>
											<div class="ms-auto font-24"></div>
										</div>
										<h6 class="mt-3 mb-0">총 카드 수</h6>
										<p class="mb-1 mt-4">
											<span>3333건</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-12 col-lg-4">
								<div class="card shadow-none border radius-15">
									<div class="card-body">
										<div class="d-flex align-items-center">
											<div class="fm-icon-box radius-15 bg-danger text-white">
												<i class="far fa-edit"></i>
											</div>
										</div>
										<h6 class="mt-3 mb-0">총 자유게시판 글 수</h6>
										<p class="mb-1 mt-4">
											<span>3333건</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-12 col-lg-4">
								<div class="card shadow-none border radius-15">
									<div class="card-body">
										<div class="d-flex align-items-center">
											<div class="fm-icon-box radius-15 bg-warning text-dark">
												<i class="fas fa-user-friends"></i>
											</div>
											<div class="ms-auto font-24"></div>
										</div>
										<h6 class="mt-3 mb-0">총 회원수</h6>
										<p class="mb-1 mt-4">
											<span>3333명</span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="table-responsive mt-3">
							<table class="table table-striped table-hover table-sm mb-0">
							<h6 class="mt-3 mb-0">등급 별 회원</h6><br>
							<canvas id="myChart" width="400vw" height="300vh"></canvas><br>
								<script>
									const ctx = document.getElementById('myChart').getContext('2d');
									const myChart = new Chart(ctx, {
									    type: 'doughnut',
									    data: {
									        labels: ['골드', '실버', '브론즈'],
									        datasets: [{
									            label: '# of Votes',
            									data: [12, 19, 3],
            									backgroundColor: [
                									'rgba(255, 217, 0, 0.5)',
                									'rgba(192, 192, 192, 0.5)',
                									'rgba(168, 128, 74, 0.5)',
            										],
            									borderColor: [
                									'rgba(255, 217, 0)',
                									'rgba(192, 192, 192)',
                									'rgba(168, 128, 74)',
           											],
            									borderWidth: 1
        										}]
    									},
    									options: {
    										responsive: false,
        									scales: {
            									y: {
                								beginAtZero: true
            									}
        									}
    									}
									});
								</script>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="footer">
			<div class="col">
				풋터
			</div>
		</div>
	</div>
</body>
</html>