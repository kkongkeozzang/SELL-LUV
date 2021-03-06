<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/header.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Search</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/search/css/main.css" rel="stylesheet" />
</head>
<style>
.choices {
	height:100%;
}
.choices__list.choices__list--dropdown{
	margin-top:0;
}
#search-desc {
	font-size:40px;
	color:black;
	font-weight:bolder;
}
</style>
 <body style="overflow-y:scroll;">
 
 
 	
	    <div class="s003" style="background-color: rgba(255, 111, 97);flex-direction: column;text-align:center">
	    <div id="search-desc" style="padding:30px"><div>SELL LUV 에는</div> <br> <div>어떤 회원들이 있을까요?</div></div>
	      <form>
	        <div class="inner-form">
	          <div class="input-field first-wrap input-category">
	            <div class="input-select" style="height:100%">
	              <select data-trigger="" name="choices-single-defaul" style="height:100%;">
	                <option>기업</option>
	                <option>인플루언서</option>
	              </select>
	            </div>
	          </div>
	          <div class="input-field second-wrap">
	            <input id="search" type="text" placeholder="이름을 입력하세요." />
	          </div>
	          <div class="input-field third-wrap">
	            <button class="btn-search" type="button" style="background-color: #000000;">
	              <svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
	                <path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
	              </svg>
	            </button>
	          </div>
	        </div>
	      </form>
	    </div>
    <script src="<c:url value="/resources/search/js/extention/choices.js" />"></script>
    <script>
      const choices = new Choices('[data-trigger]',
      {
        searchEnabled: false,
        itemSelectText: '',
      });
      
      $(".btn-search").on("click",function(){
    	  alert("미구현 기능입니다.");
    	  location.href="/index.jsp";
      })

    </script>
  </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
