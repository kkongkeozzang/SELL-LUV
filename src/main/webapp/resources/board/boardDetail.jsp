<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시판</title>
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 마이페이지 프로필 css 가져오기 -->
<link
href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css"
rel="stylesheet" />
<link href="https://cdn.lineicons.com/3.0/lineicons.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!-- 댓글 css 가져오기 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
	body {
		margin: 0;
		font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
			"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
			"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
		font-size: .88rem;
		font-weight: 400;
		line-height: 1.5;
		color: #495057;
		background-color: #eef1f3;
	}
	
	.mt-100 {
		margin-top: 80px;
	}
	
	.card {
		box-shadow: 0 0.46875rem 2.1875rem rgba(4, 9, 20, 0.03), 0 0.9375rem
			1.40625rem rgba(4, 9, 20, 0.03), 0 0.25rem 0.53125rem
			rgba(4, 9, 20, 0.05), 0 0.125rem 0.1875rem rgba(4, 9, 20, 0.03);
		border-width: 0;
		transition: all .2s;
		margin: auto;
	}
	
	.card-header:first-child {
		border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0
	}
	
	.card-header {
		display: flex;
		align-items: center;
		border-bottom-width: 1px;
		padding-top: 0;
		padding-bottom: 0;
		padding-right: .625rem;
		height: 3.5rem;
		background-color: #fff;
		border-bottom: 1px solid rgba(26, 54, 126, 0.125);
	}
	
	.btn-primary.btn-shadow {
		box-shadow: 0 0.125rem 0.625rem rgba(63, 106, 216, 0.4), 0 0.0625rem
			0.125rem rgba(63, 106, 216, 0.5);
	}
	
	.btn.btn-wide {
		padding: .375rem 1.5rem;
		font-size: .8rem;
		line-height: 1.5;
		border-radius: .25rem;
	}
	
	.btn-primary {
		color: #fff;
		background-color: #3f6ad8;
		border-color: #3f6ad8;
	}
	
	.form-control {
		display: block;
		width: 100%;
		height: calc(2.25rem + 2px);
		padding: .375rem .75rem;
		font-size: 1rem;
		font-weight: 400;
		line-height: 1.5;
		color: #495057;
		background-color: #fff;
		background-clip: padding-box;
		border: 1px solid #ced4da;
		border-radius: .25rem;
		transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	
	.card-body {
		flex: 1 1 auto;
		padding: 1.25rem
	}
	
	.flex-truncate {
		min-width: 0 !important
	}
	
	.d-block {
		display: block !important
	}
	
	a {
		color: #E91E63;
		text-decoration: none !important;
		background-color: transparent
	}
	
	.media img {
		width: 40px;
		height: auto
	}
	
	#board-title {
		text-align: center;
		height: 100px;
		line-height: 100px;
		padding: 100px 0;
	}
	
	#title {
		width: 50px;
		height: 50px;
	}
	
	.search-bar {
		margin: auto;
	}
	
	* {
		box-sizing: border-box;
	}
	
	.container {
		width: 1000px;
	}
	
	textarea {
		resize: none;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		width: 100%;
	}
	
	body {
		margin: 0;
		line-height: 1.5;
		color: #495057;
		text-align: left;
		background-color: #eef1f3
	}
	.profile-box{
		display:flex;
	}
	.img-profile {
		border-radius: 70%;
		width: 100%;
		height: 100%;
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
	.profile-detail{
		justify-content: flex-start;
	    flex-direction: column;
	}
	
	/* 리뷰 css */
	
	body {
    background: #eee
	}
	
	.date {
	    font-size: 11px
	}
	
	.comment-text {
	    font-size: 12px
	}
	
	.fs-12 {
	    font-size: 12px
	}
	
	.shadow-none {
	    box-shadow: none
	}
	
	.name {
	    color: #007bff
	}
	
	.cursor:hover {
	    color: blue
	}
	
	.cursor {
	    cursor: pointer
	}
	
	.textarea {
	    resize: none
	}
</style>
</head>
<body>
	<!-- 메인 네비바 -->
	<jsp:include page="/header.jsp" flush="false"/>
	
	<!-- 타이틀  -->
	<div class="container-fluid mt-100">
    <div id="board-title">
    <img id="title" src="/resources/board/image/title.png">
    <span>커뮤니티 게시판</span>
    <%= (String)session.getAttribute("cpage") %>
        <%= request.getParameter("cpage") %>
        <%= request.getParameter("seq") %>
    </div>       
    <br>
	
	<!-- 게시판 박스 -->
    <div class="card mb-3 col-xl-6 col-md-12">
    
      <form action="/done.board" method="post" id="frm" >
    <div class="container mb-4">
    	<div class="row" style="padding-bottom:5px;">
            <div class="col-sm-12">
            	<div class="row profile-detail">
								<div class="col profile-box mt-4 mb-2 ">
								<div class="img-box" style="height:100%;display:inline-block">
								<img id="profile" class="img-profile" style="width:50px;height:50px;"
									src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">
								</div>	
								<ul class="meta list list-unstyled profile-detail d-flex mb-0 ml-2">
									<li class="name mt-0">닉네임</li>
									<li class="label" style="margin: 0; padding: 0">인플루언서</li>
								</ul>
								</div>
							</div>
            </div>
        </div>
        <div class="row" style="padding-bottom:5px;">
            <div class="col-sm-12"><input type=text id=input-title name=title style="width:100%;" value="${dto.title}" readonly></div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <textarea id="contents" cols=170 rows=12 name="contents" readonly></textarea>
                <script>
                	$("#contents").text("${dto.contents}");
                </script>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12" style="text-align:right">
                <c:if test="${loginID==dto.writer }">
	                <button type="button" class="btn btn-dark" id="mod" style="background-color:rgb(255, 111, 97);">수정하기</button>
	                <button type="button" class="btn btn-dark" id="del" style="background-color:rgb(255, 111, 97);">삭제하기</button>
	                <button type="button" class="btn btn-dark" id="modDone" style="background-color:rgb(255, 111, 97);display:none;">수정완료</button>
	                <button type="button" class="btn btn-dark" id="cancle" style="background-color:rgb(255, 111, 97);display:none;">취소</button>
                </c:if>
                <button type="button" id="boardList" class="btn btn-dark" style="background-color:rgb(255, 111, 97);">목록으로</button>
                <script>
					$("#boardList").on("click",function(){
						location.href="/boardList.board?cpage=1";
					});
					
					// 기존 내용 백업
					let bkTitle = $("#input-title").val();					
					let bkContents = $("#contents").val();					
					$("#mod").on("click", function(){
                		$("#del").css("display","none");
                		$("#mod").css("display","none");
                		$("#boardList").css("display","none");
                		$("#modDone").css("display","inline-block");
                		$("#cancle").css("display","inline-block");
                		$("#frm").removeAttr("action");
                		$("#input-title").removeAttr("readonly");
                		$("#contents").removeAttr("readonly");
                		$("#contents").focus();
                		
                		$("#frm").attr("action","/modify.board?cpage=${cpage}&seq=${dto.seq}");
                		
                	});
                	$("#del").on("click", function(){
                		if(confirm("정말 삭제하시겠습니까? \r\n되돌릴 수 없습니다.")) {
	                		location.href="/delete.board?cpage=${cpage}&seq=${dto.seq}";
                		}
                	});
                	$("#modDone").on("click",function(){
                		$("#frm").submit();
                	})
                	$("#cancle").on("click",function(){
                		$("#input-title").val(bkTitle);
                		$("#contents").val(bkContents);
                		$("#input-title").attr("readonly","");
                		$("#contents").attr("readonly","");
                		$("#mod").css("display","inline-block");
                		$("#del").css("display","inline-block");
                		$("#modDone").css("display","none");
                		$("#cancle").css("display","none");
                		$("#boardList").css("display","inline-block");
                	})
				</script>
            </div>
        </div>
    </div>	
    </form>
    <hr>
    <!-- 댓글 칸 -->
    	<form action='/doneCmt.board?cpage=${cpage }&seq=${seq}' method="post" id="frm-cmt" >
    <div class="container mb-4">
    	<div class="row" style="padding-bottom:5px;">
            <div class="col-sm-12">
            	<div class="row profile-detail">
								<div class="col profile-box mt-4 mb-2 ">
								<div class="img-box" style="height:100%;display:inline-block">
								<img id="profile" class="img-profile" style="width:50px;height:50px;"
									src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">
								</div>	
								<ul class="meta list list-unstyled profile-detail d-flex mb-0 ml-2">
									<li class="name mt-0">닉네임</li>
									<li class="label" style="margin: 0; padding: 0">인플루언서</li>
								</ul>
								</div>
							</div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <textarea id="contents" cols=170 rows=4 name="contents-cmt"></textarea>
                <script>
                	// $("#contents").text("${dto.contents}"); 
                </script>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12" style="text-align:right">
            <button class="btn btn-dark" id="writeCmt" style="background-color:rgb(255, 111, 97);">등록</button>
            <script>
            </script>
                	<%--
                <c:if test="${loginID==댓글작성자 }">
	                <button type="button" class="btn btn-dark" id="mod" style="background-color:rgb(255, 111, 97);">수정하기</button>
	                <button type="button" class="btn btn-dark" id="del" style="background-color:rgb(255, 111, 97);">삭제하기</button>
	                <button type="button" class="btn btn-dark" id="modDone" style="background-color:rgb(255, 111, 97);display:none;">수정완료</button>
	                <button type="button" class="btn btn-dark" id="cancle" style="background-color:rgb(255, 111, 97);display:none;">취소</button>
                </c:if>
                <button type="button" id="boardList" class="btn btn-dark" style="background-color:rgb(255, 111, 97);">목록으로</button>
                <script>
					$("#boardList").on("click",function(){
						location.href="/boardList.board?cpage=1";
					});
					
					// 기존 내용 백업
					let bkTitle = $("#input-title").val();					
					let bkContents = $("#contents").val();					
					$("#mod").on("click", function(){
                		$("#del").css("display","none");
                		$("#mod").css("display","none");
                		$("#boardList").css("display","none");
                		$("#modDone").css("display","inline-block");
                		$("#cancle").css("display","inline-block");
                		$("#frm").removeAttr("action");
                		$("#input-title").removeAttr("readonly");
                		$("#contents").removeAttr("readonly");
                		$("#contents").focus();
                		
                		$("#frm").attr("action","/modify.board?cpage=${cpage}&seq=${dto.seq}");
                		
                	});
                	$("#del").on("click", function(){
                		if(confirm("정말 삭제하시겠습니까? \r\n되돌릴 수 없습니다.")) {
	                		location.href="/delete.board?cpage=${cpage}&seq=${dto.seq}";
                		}
                	});
                	$("#modDone").on("click",function(){
                		$("#frm").submit();
                	})
                	$("#cancle").on("click",function(){
                		$("#input-title").val(bkTitle);
                		$("#contents").val(bkContents);
                		$("#input-title").attr("readonly","");
                		$("#contents").attr("readonly","");
                		$("#mod").css("display","inline-block");
                		$("#del").css("display","inline-block");
                		$("#modDone").css("display","none");
                		$("#cancle").css("display","none");
                		$("#boardList").css("display","inline-block");
                	})
				</script>
                	--%>
            </div>
        </div>
    </div>	
    </form>
    
    
    
    </div>   
    
    <br>

    
    
    <!-- 푸터 -->
	<jsp:include page="/footer.jsp" flush="false"/>
</div>                            
<script type="text/javascript"></script>
</body>
</html>