<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/5c87e9ee71.js" crossorigin="anonymous"></script>

	<!-- SEO Meta Tags -->
    <meta name="description" content="Your description">
    <meta name="author" content="Your name">
    
    <!-- OG Meta Tags to improve the way the post looks when you share the page on Facebook, Twitter, LinkedIn -->
	<meta property="og:site_name" content="" /> <!-- website name -->
	<meta property="og:site" content="" /> <!-- website link -->
	<meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
	<meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
	<meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
	<meta property="og:url" content="" /> <!-- where do you want your post to link to -->
	<meta name="twitter:card" content="summary_large_image"> <!-- to have large image post format in Twitter -->

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mainpage/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mainpage/css/fontawesome-all.min.css"> 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mainpage/css/swiper.css"> 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mainpage/css/styles.css"> 
	
	<!-- Favicon  -->
</head>
<body>
<!-- Navigation -->
    <nav id="navbarExample" class="navbar navbar-expand-lg fixed-top navbar-light" aria-label="Main navigation">
        <div class="container">

            <!-- Image Logo -->   <!-- SELL LUV LOGO -->
            <a class="navbar-brand logo-image" href="/index.jsp"><img src="/resources/mainpage/images/SELL_LUV_NEW1.png" alt="alternative"></a> 
	
            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <!-- <a class="navbar-brand logo-text" href="index.html">Nubis</a> -->

            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault" style="height:31%;">
                <ul class="navbar-nav ms-auto navbar-nav-scroll" align=center>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page	" href="#header"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/companyList.ifcp?cpage=1">기업</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/influencerList.ifcp?cpage=1">인플루언서</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/boardList.board?cpage=1">커뮤니티</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link" href="/msearch.search">검색</a>
                    </li>
                    <c:choose>
                    	<c:when test="${loginID == null }">
                    	 <li class="nav-item">
                    		<a class="btn-solid-sm" href="/login.mem" style="background-color: #000000;border:none;">로그인</a>
                    	</li>
                    	</c:when>
                    	<c:when test="${loginID eq 'kkanbu' }">
                   			<li class="nav-item">
                    			<a class="nav-link" href="/adminMain.admin">관리자페이지 </a>
                   			</li>
                   			<li class="nav-item">
                    			<a class="btn-solid-sm" href="/logout.mem" style="background-color: #000000;border:none;">로그아웃 </a>
                    		</li>
                   		</c:when>
                   		<c:otherwise>
                   			<li class="nav-item">
                    			<a class="nav-link" href="/resources/mypage/mypageMain.jsp">마이페이지 </a>
                   			</li>
                   			<li class="nav-item">
                    			<a class="btn-solid-sm" href="/logout.mem" style="background-color: #000000;border:none;">로그아웃 </a>
                    		</li>
                   		</c:otherwise>
                    </c:choose>
                </ul>
                
                <span class="nav-item">
                   

                    

                </span>
            </div> <!-- end of navbar-collapse -->
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->
    <script type="text/javascript">
	 // Navbar on mobile
	    var elementss;
	 	elementss = document.querySelectorAll(".nav-link:not(.dropdown-toggle)");
	
	    for (let i = 0; i < elementss.length; i++) {
	    	elementss[i].addEventListener("click", () => {
	    		document.querySelector(".offcanvas-collapse").classList.toggle("open");
	    	});
	    }
	
	    document.querySelector(".navbar-toggler").addEventListener("click", () => {
	      	document.querySelector(".offcanvas-collapse").classList.toggle("open");
	    });
    </script>
</body>
</html>