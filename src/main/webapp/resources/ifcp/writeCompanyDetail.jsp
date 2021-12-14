<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>blog detail page - Bootdey.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<jsp:include page="/header.jsp" flush="false" />
	<div class="blog-single gray-bg">
		<div class="container">
			<div class="row align-items-start">
				<div class="col-lg-8 m-15px-tb">
					<article class="article">
						<form action="/upload.ifcp" method="post"
							enctype="multipart/form-data">
							<div class="article-img">
								<img src="/resources/ifcp/img/표지.jpeg" title="" alt=""
									id="cpPhoto" style="display: block; margin: 0 auto;">
							</div>
							<div class="article-title">
								<div class="media">
									<div class="avatar"></div>
									<div class="media-body">
										<label>제목</label> <br> <input type="text"
											style="width: 435px;" name="title" id="title"><br>
										<br> <label>소개글</label><br>
										<textarea rows="5" cols="50" name="intro" id="intro"></textarea>
										<br> <label>원하는 조건</label><br>
										<textarea rows="5" cols="50" name="condition" id="condition"></textarea>
										<br>
										<br> <label id="fileUpload"> 사진선택<input
											type="file" name="file" accept="jpg,jpeg,png"
											style="display: none;">
										</label>
									</div>
								</div>
							</div>
							<div class="article-content">

								<!-- <p>내용</p> -->




							</div>
					</article>
				</div>
				<div class="col-lg-4 m-15px-tb blog-aside">
					<!-- Author -->
					<div class="widget widget-author">
						<div class="widget-body">
							<div class="media align-items-center">
								<div class="media-body">
									<div class="nav tag-cloud">
										<a href="#" style="text-decoration: none;"><button
												id="complete">작성완료</button></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					</form>
					<!-- End Author -->

					<!-- Latest Post -->
					<div class="widget widget-latest-post">
						<div class="widget-title">
							<h3>사업자번호</h3>
							<h6>${cpList[0].crnumber}</h6>
						</div>
						<div class="widget-title">
							<h3>대표자</h3>
							<h6>${cpList[0].rpt}</h6>
						</div>
						<div class="widget-title">
							<h3>이메일</h3>
							<h6>${cpList[0].email}</h6>
						</div>
						<div class="widget-title">
							<h3>연락처</h3>
							<h6>${cpList[0].email}</h6>
						</div>
						<div class="widget-title">
							<h3>매출액</h3>
							<h6>${cpList[0].sales}</h6>
						</div>
						<div class="widget-title">
							<h3>등급</h3>
							<h6>${cpList[0].grade}</h6>
						</div>
					</div>
				</div>
			</div>
			<!-- End Latest Post -->
		</div>
	</div>
	<script>
		$("#complete").on("click", function() {
			if ($("#title").val() == "") {
				alert("제목을 입력하세요.");
				return false;
			}
			if ($("#intro").val() == "") {
				alert("소개글을 입력하세요.");
				return false;
			}

			if ($("#condition").val() == "") {
				alert("원하는 조건을 입력하세요.");
				return false;
			}
			alert("작성완료");
		})
	</script>
	<style type="text/css">

#fileUpload {
	border: 1px solid black;
	border-radius: 5px;
}

#fileUpload:hover {
	background-color: black;
	cursor: pointer;
}

button {
	background-color: transparent;
	border: 0px;
	color: white;
}

#heart {
	color: red;
}

body {
	margin-top: 20px;
}

.blog-listing {
	padding-top: 30px;
	padding-bottom: 30px;
}

.gray-bg {
	background-color: #f5f5f5;
	margin-top: 50px;
}
/* Blog 
---------------------*/
.blog-grid {
	box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
	border-radius: 5px;
	overflow: hidden;
	background: #ffffff;
	margin-top: 15px;
	margin-bottom: 15px;
}

.blog-grid .blog-img {
	position: relative;
}

.blog-grid .blog-img .date {
	position: absolute;
	background: #fc5356;
	color: #ffffff;
	padding: 8px 15px;
	left: 10px;
	top: 10px;
	border-radius: 4px;
}

.blog-grid .blog-img .date span {
	font-size: 22px;
	display: block;
	line-height: 22px;
	font-weight: 700;
}

.blog-grid .blog-img .date label {
	font-size: 14px;
	margin: 0;
}

.blog-grid .blog-info {
	padding: 20px;
}

.blog-grid .blog-info h5 {
	font-size: 22px;
	font-weight: 700;
	margin: 0 0 10px;
}

.blog-grid .blog-info h5 a {
	color: #8488d4;
}

.blog-grid .blog-info p {
	margin: 0;
}

.blog-grid .blog-info .btn-bar {
	margin-top: 20px;
}

/* Blog Sidebar
-------------------*/
.blog-aside .widget {
	box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
	border-radius: 5px;
	overflow: hidden;
	background: #ffffff;
	margin-top: 15px;
	margin-bottom: 15px;
	width: 100%;
	display: inline-block;
	vertical-align: top;
}

.blog-aside .widget-body {
	padding: 15px;
}

.blog-aside .widget-title {
	padding: 15px;
	border-bottom: 1px solid #eee;
}

.blog-aside .widget-title h3 {
	font-size: 20px;
	font-weight: 700;
	color: #ff6F61;
	margin: 0;
}

.blog-aside .widget-author .media {
	margin-bottom: 15px;
}

.blog-aside .widget-author p {
	font-size: 16px;
	margin: 0;
}

.blog-aside .widget-author .avatar {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	overflow: hidden;
}

.blog-aside .widget-author h6 {
	font-weight: 600;
	color: #ff6F61;
	font-size: 22px;
	margin: 0;
	padding-left: 20px;
}

.blog-aside .post-aside {
	margin-bottom: 15px;
}

.blog-aside .post-aside .post-aside-title h5 {
	margin: 0;
}

.blog-aside .post-aside .post-aside-title a {
	font-size: 18px;
	color: FF6F61;
	font-weight: 600;
}

.blog-aside .post-aside .post-aside-meta {
	padding-bottom: 10px;
}

.blog-aside .post-aside .post-aside-meta a {
	color: #ff6F61;
	font-size: 12px;
	text-transform: uppercase;
	display: inline-block;
	margin-right: 10px;
}

.blog-aside .latest-post-aside+.latest-post-aside {
	border-top: 1px solid #eee;
	padding-top: 15px;
	margin-top: 15px;
}

.blog-aside .latest-post-aside .lpa-right {
	width: 90px;
}

.blog-aside .latest-post-aside .lpa-right img {
	border-radius: 3px;
}

.blog-aside .latest-post-aside .lpa-left {
	padding-right: 15px;
}

.blog-aside .latest-post-aside .lpa-title h5 {
	margin: 0;
	font-size: 15px;
}

.blog-aside .latest-post-aside .lpa-title a {
	color: #ff6F61;
	font-weight: 600;
}

.blog-aside .latest-post-aside .lpa-meta a {
	color: #ff6F61;
	font-size: 12px;
	text-transform: uppercase;
	display: inline-block;
	margin-right: 10px;
}

.tag-cloud a {
	padding: 4px 15px;
	padding-left: 50px;
	padding-right: 50px;
	font-size: 30px;
	color: #ffffff;
	background: #ff6F61;
	border-radius: 3px;
	margin-right: 4px;
	margin-bottom: 3px;
	margin-top: 25px;
	margin-left: 68px;
}

.tag-cloud a:hover {
	background: #ce8b85;
}

.blog-single {
	padding-top: 30px;
	padding-bottom: 30px;
}

.article {
	box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
	border-radius: 5px;
	overflow: hidden;
	background: #ffffff;
	padding: 15px;
	margin: 15px 0 30px;
}

.article .article-title {
	padding: 15px 0 20px;
}

.article .article-title h6 {
	font-size: 14px;
	font-weight: 700;
	margin-bottom: 20px;
}

.article .article-title h6 a {
	text-transform: uppercase;
	color: #fc5356;
	border-bottom: 1px solid #fc5356;
}

.article .article-title h2 {
	color: #ff6F61;
	font-weight: 600;
}

.article .article-title .media {
	padding-top: 15px;
	border-bottom: 1px dashed #ddd;
	padding-bottom: 20px;
}

.article .article-title .media .avatar {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	overflow: hidden;
}

.article .article-title .media .media-body {
	padding-left: 8px;
}

.article .article-title .media .media-body label {
	font-weight: 600;
	color: #fc5356;
	margin: 0;
}

.article .article-title .media .media-body span {
	display: block;
	font-size: 12px;
}

.article .article-content h1, .article .article-content h2, .article .article-content h3,
	.article .article-content h4, .article .article-content h5, .article .article-content h6
	{
	color: #ff6F61;
	font-weight: 600;
	margin-bottom: 15px;
}

.article .article-content blockquote {
	max-width: 600px;
	padding: 15px 0 30px 0;
	margin: 0;
}

.article .article-content blockquote p {
	font-size: 20px;
	font-weight: 500;
	color: #fc5356;
	margin: 0;
}

.article .article-content blockquote .blockquote-footer {
	color: #ff6F61;
	font-size: 16px;
}

.article .article-content blockquote .blockquote-footer cite {
	font-weight: 600;
}

.article .tag-cloud {
	padding-top: 10px;
}

.article-comment {
	box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
	border-radius: 5px;
	overflow: hidden;
	background: #ffffff;
	padding: 20px;
}

.article-comment h4 {
	color: #ff6F61;
	font-weight: 700;
	margin-bottom: 25px;
	font-size: 22px;
}

img {
	max-width: 100%;
}

img {
	vertical-align: middle;
	border-style: none;
}

/* Contact Us
---------------------*/
.contact-name {
	margin-bottom: 30px;
}

.contact-name h5 {
	font-size: 22px;
	color: #ff6F61;
	margin-bottom: 5px;
	font-weight: 600;
}

.contact-name p {
	font-size: 18px;
	margin: 0;
}

.social-share a {
	width: 40px;
	height: 40px;
	line-height: 40px;
	border-radius: 50%;
	color: #ffffff;
	text-align: center;
	margin-right: 10px;
}

.social-share .dribbble {
	box-shadow: 0 8px 30px -4px rgba(234, 76, 137, 0.5);
	background-color: #ea4c89;
}

.social-share .behance {
	box-shadow: 0 8px 30px -4px rgba(0, 103, 255, 0.5);
	background-color: #0067ff;
}

.social-share .linkedin {
	box-shadow: 0 8px 30px -4px rgba(1, 119, 172, 0.5);
	background-color: #0177ac;
}

.contact-form .form-control {
	border: none;
	border-bottom: 1px solid #ff6F61;
	background: transparent;
	border-radius: 0;
	padding-left: 0;
	box-shadow: none !important;
}

.contact-form .form-control:focus {
	border-bottom: 1px solid #fc5356;
}

.contact-form .form-control.invalid {
	border-bottom: 1px solid #ff0000;
}

.contact-form .send {
	margin-top: 20px;
}

@media ( max-width : 767px) {
	.contact-form .send {
		margin-bottom: 20px;
	}
}

.section-title h2 {
	font-weight: 700;
	color: #ff6F61;
	font-size: 45px;
	margin: 0 0 15px;
	border-left: 5px solid #fc5356;
	padding-left: 15px;
}

.section-title {
	padding-bottom: 45px;
}

.contact-form .send {
	margin-top: 20px;
}

.px-btn {
	padding: 0 50px 0 20px;
	line-height: 60px;
	position: relative;
	display: inline-block;
	color: #ff6F61;
	background: none;
	border: none;
}

.px-btn:before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	border-radius: 30px;
	background: transparent;
	border: 1px solid rgba(252, 83, 86, 0.6);
	border-right: 1px solid transparent;
	-moz-transition: ease all 0.35s;
	-o-transition: ease all 0.35s;
	-webkit-transition: ease all 0.35s;
	transition: ease all 0.35s;
	width: 60px;
	height: 60px;
}

.px-btn .arrow {
	width: 13px;
	height: 2px;
	background: currentColor;
	display: inline-block;
	position: absolute;
	top: 0;
	bottom: 0;
	margin: auto;
	right: 25px;
}

.px-btn .arrow:after {
	width: 8px;
	height: 8px;
	border-right: 2px solid currentColor;
	border-top: 2px solid currentColor;
	content: "";
	position: absolute;
	top: -3px;
	right: 0;
	display: inline-block;
	-moz-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
}
</style>

	<script type="text/javascript">
		
	</script>
	<jsp:include page="/footer.jsp" flush="false" />
</body>
</html>