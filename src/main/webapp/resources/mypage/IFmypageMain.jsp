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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.lineicons.com/3.0/lineicons.css"
		rel="stylesheet">
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		rel="stylesheet" />
	<link
		href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css"
		rel="stylesheet" />	
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

#profile-box {
	display: flex;
	justify-content: center;
}

.img-profile {
	border-radius: 70%;
	width: 90%;
	height: 90%;
}

.profile-detail {
	text-align: center;
}

.name {
	font-weight: bold;
}

.list li {
	margin-top: 5px;
}

.label {
	font-size: 12px;
}
.grade{
	display:flex;
	justify-content: center;
	font-weight: bold;
}
.detail{
	display:flex;
	flex-direction:column;
	flex:1 1;
	justify-content: flex-end;
}
.icon-box{
	flex:1 1;
	height:100px;
}
.icon-icon{
	flex:1 1;
}

.detail-title-one{
	display:flex;
	flex-direction:column;
	flex:1 1;
	justify-content: center;
}
</style>

<script type="text/javascript">
	
</script>
<body>
	

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
						<div class="row">
							<div class="grade">${dto.grade }</div>
							<div class="col" id="profile-box">
								<img id="profile" class="img-profile"
									src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">
							</div>
						</div>
						<ul class="meta list list-unstyled profile-detail">
							<li class="name">${dto.name }</li>
							<li class="label" style="margin: 0; padding: 0">인플루언서</li>
							<li class="email">${dto.email }</li>
							<li class="activity">Last logged in: Today at 2:18pm</li>
						</ul>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<div class="d-grid"></div>
						<h5 class="my-3">My Page</h5>
						<div class="fm-menu">
							<div class="list-group list-group-flush">
								<a href="/modify.mem" class="list-group-item py-1"><i class="bx bx-cool me-2"></i><span>개인 정보 수정</span></a> 							
								<a href="/Ifprofile.mem" class="list-group-item py-1"><i class="bx bx-face me-2"></i><span>프로필 수정</span></a> 
								<a href="/IFKkanbuList.mem" class="list-group-item py-1"><i class="bx bx-heart me-2"></i><span>깐부 관리</span></a>
								<a href="" class="list-group-item py-1"><i class="bx bx-like me-2"></i><span>리뷰 관리</span></a>
								<a href="" class="list-group-item py-1"><i class="bx bx-highlight me-2"></i><span>커뮤니티 관리</span></a>
								<a href="" class="list-group-item py-1"></i><span>회원탈퇴</span></a>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="col-12 col-lg-9">
				<div class="card">
					<div class="card-body">
						<div class="row mt-3">
							<div class="col-12 col-lg-4">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">
											<div class="fm-icon-box radius-15 bg-primary text-white icon-box">
												<i class="fa fa-address-card-o fa-2x" aria-hidden="true"></i>
											</div>
											<div class="detail">
												<h6 class="detail-title">GRADE</h6>
												<p class="detail-detail"><span>${dto.grade }</span></p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12 col-lg-4">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">
											<div class="fm-icon-box radius-15 bg-danger text-white icon-box">
												<i class="fa fa-heart-o fa-2x"></i>
											</div>
										<div class="detail-title-one">
												<h6 class=""><a href="/IFKkanbuList.mem" style="text-decoration: none;">깐부관리</a></h6>
												<%-- <p class="detail-detail"><span>이동</span></p>--%>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12 col-lg-4">
								<div class="card shadow-none border radius-15">
									<div class="card-body" align=center>
										<div class="d-flex">
											<div class="fm-icon-box radius-15 bg-warning text-white icon-box">
												<i class="fa fa-thumbs-o-up fa-2x" aria-hidden="true"></i>
											</div>
											<div class="detail-title-one">
												<h6 class=""><a href="/IFReviewList.mem" style="text-decoration: none;">리뷰관리</a></h6>
												<%-- <p class="detail-detail"><span>이동</span></p>--%>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="table-responsive mt-3">
							<div class="drive-wrapper drive-list-view">
								<div class="table-responsive drive-items-table-wrapper">
									<table class="table">
										<thead>
											<tr>
												<th class="type"></th>
												<th class="name truncate">Name</th>
												<th class="date">Uploaded</th>
												<th class="size">Size</th>
											</tr>
										</thead>
										
									</table>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/footer.jsp" flush="false"/>
	</div>
</body>
</html>