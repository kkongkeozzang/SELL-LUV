<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

</head>
 <style>
         *{box-sizing:border-box;}        
        .container{width:1000px;}
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
    </style>
<body>
	<jsp:include page="/header.jsp" flush="false"/>
	
	<form>
    <div class="container">
        <div class="row">
            <div class="col-sm-12" style="text-align:center; height:200px; line-height:250px; font-family:BlackHanSans;">커뮤니티 게시판 글쓰기</div>
        </div>
        <div class="row" style="padding-bottom:5px;">
            <div class="col-sm-2" style="text-align:center">
            <select name= boardTag style="width:100%; text-align:center;">
						<option>잡담</option>
						<option>정보</option>
					</select>
            </div>
            <div class="col-sm-10"><input type=text id=title name=title placeholder="제목을 작성하세요" style="width:100%;"></div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <textarea cols=170 rows=25>

                </textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8"><input type=file id=bFile name=bFile></div>
            <div class="col-sm-4" style="text-align:right">
                <button type="button" class="btn btn-dark" style="background-color:rgb(255, 111, 97);">목록으로</button>
                <button class="btn btn-dark" style="background-color:rgb(255, 111, 97);">작성하기</button>
            </div>
        </div>
    </div>
</form>
</body>
</html>