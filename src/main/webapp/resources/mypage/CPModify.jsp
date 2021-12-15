<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원 정보수정</title>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
	<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
	<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
	<meta name="description" content="Your description">
    <meta name="author" content="Your name">
    
	 <style>* {
    margin: 0;
    padding: 0
}

html {
    height: 100%
}

p {
    color: grey
}

#heading {
    text-transform: uppercase;
    color: #000000;
    font-weight: normal
}

#msform {
    text-align: center;
    position: relative;
    margin-top: 20px
}

#msform fieldset {
    background: white;
    border: 0 none;
    border-radius: 0.5rem;
    box-sizing: border-box;
    width: 100%;
    margin: 0;
    padding-bottom: 20px;
    position: relative
}

.form-card {
    text-align: left
}

#msform fieldset:not(:first-of-type) {
    display: none
}

#msform input,
#msform textarea {
    padding: 8px 15px 8px 15px;
    border: 1px solid black;
    border-radius: 0px;
    margin-bottom: 25px;
    margin-top: 2px;
    width: 100%;
    box-sizing: border-box;
    font-family: montserrat;
    color: #2C3E50;
    background-color: #ECEFF1;
    font-size: 16px;
    letter-spacing: 1px
}

#msform input:focus,
#msform textarea:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid rgb(255, 111, 97);
    outline-width: 0
}

#msform .action-button {
    width: 100px;
    background: rgb(255, 111, 97);
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 0px;
    cursor: pointer;
    padding: 10px 5px;
    margin: 10px 0px 10px 5px;
    float: right
}

#msform .action-button:hover,
#msform .action-button:focus {
    background-color: #000000
}

#msform .action-button-previous {
    width: 100px;
    background: #616161;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 0px;
    cursor: pointer;
    padding: 10px 5px;
    margin: 10px 5px 10px 0px;
    float: right
}

#msform .action-button-previous:hover,
#msform .action-button-previous:focus {
    background-color: #000000
}

.card {
    z-index: 0;
    border: none;
    position: relative
}

.fs-title {
    font-size: 25px;
    color: #000000;
    margin-bottom: 15px;
    font-weight: normal;
    text-align: left
}

.purple-text {
    color: #673AB7;
    font-weight: normal
}

.steps {
    font-size: 25px;
    color: gray;
    margin-bottom: 10px;
    font-weight: normal;
    text-align: right
}

.fieldlabels {
    color: gray;
    text-align: left
}

#progressbar {
    margin-bottom: 30px;
    overflow: hidden;
    color: lightgrey
}

#progressbar .active {
    color: rgb(255, 111, 97);
}

#progressbar li {
    list-style-type: none;
    font-size: 15px;
    width: 25%;
    float: left;
    position: relative;
    font-weight: 400
}

#progressbar #account:before {
    font-family: FontAwesome;
    content: "\f13e"
}

#progressbar #personal:before {
    font-family: FontAwesome;
    content: "\f007"
}

#progressbar #payment:before {
    font-family: FontAwesome;
    content: "\f030"
}

#progressbar #confirm:before {
    font-family: FontAwesome;
    content: "\f00c"
}

#progressbar li:before {
    width: 50px;
    height: 50px;
    line-height: 45px;
    display: block;
    font-size: 20px;
    color: #ffffff;
    background: lightgray;
    border-radius: 50%;
    margin: 0 auto 10px auto;
    padding: 2px
}

#progressbar li:after {
    content: '';
    width: 100%;
    height: 2px;
    background: lightgray;
    position: absolute;
    left: 0;
    top: 25px;
    z-index: -1
}

#progressbar li.active:before,
#progressbar li.active:after {
    background: rgb(255, 111, 97);
}

.progress {
    height: 20px
}

.progress-bar {
    background-color: rgb(255, 111, 97);
}

.fit-image {
    width: 100%;
    object-fit: cover
}</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body oncontextmenu='return false' class='snippet-body'>
	
	<jsp:include page="/header.jsp" flush="false"/>
	
    <div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-11 col-sm-9 col-md-7 col-lg-6 col-xl-5 text-center p-0 mt-3 mb-2">
            <div class="card px-0 pt-4 pb-0 mt-3 mb-3">
                <h2 id="heading" style="padding-top:50px;">기업 계정 정보수정</h2>
                <p>모든 칸은 작성되어야 합니다.</p>
                <form id="msform" action="/CPmodify.mem" method="post">
                    <!-- progressbar -->
                    <ul id="progressbar">
                        <li class="active" id="account"><strong>계정</strong></li>
                        <li id="personal"><strong>기업 정보</strong></li>
                        <li id="payment"><strong>프로필 사진</strong></li>
                        <li id="confirm"><strong>완료</strong></li>
                    </ul>
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                    </div> <br> <!-- fieldsets -->
                    <fieldset>
                        <div class="form-card">
                            <div class="row">
                                <div class="col-7">
                                    <h2 class="fs-title">계정정보 :</h2>
                                </div>
                                <div class="col-5">
                                    <h2 class="steps">단계 1 - 4</h2>
                                </div>
                            </div> <label class="fieldlabels">이메일: *</label> 
                            <input type="email" id="email" name="email" placeholder="Email" value="${dto.email }"/> 
                            <label class="fieldlabels">아이디: * (수정 불가능)</label> <span id= "checkResult"></span><input type="text" id="id" name="id" placeholder="Id" value="${dto.id }" readonly/> 
                            <label class="fieldlabels">비밀번호: * (최소 8글자 이상 최대 16글자)</label> <input type="password" id="pw" name="pw" placeholder="Password"/> 
                            <label class="fieldlabels">비밀번호 확인: *</label> <span id= "pwCheckResult"></span> <input type="password" id="pwd" name="pwd" placeholder="Confirm Password" />
                        </div> <input type="button" id="step1" name="next" class="next action-button" value="다음" />
                    </fieldset>
                    <fieldset>
                        <div class="form-card">
                            <div class="row">
                                <div class="col-7">
                                    <h2 class="fs-title">기업 정보:</h2>
                                </div>
                                <div class="col-5">
                                    <h2 class="steps">단계 2 - 4</h2>
                                </div>
                            </div> 
                            <label class="fieldlabels">기업상호: *</label> <input type="text" id="name" name="name" placeholder="Company Name" value="${dto.name }"/>
                            <label class="fieldlabels">대표자명: *</label> <input type="text" id="rpt_cp" name="rpt_cp" placeholder="Representative Name" value="${dto.rpt }"/>
                            <label class="fieldlabels">사업자번호: * ('-'제외 10자리 숫자입력)</label> <input type="text" id="crunumber" name="crunumber" placeholder="Corporate Registration Number" value="${dto.crnumber }"/> 
                            <label class="fieldlabels">매출액: (단위 만원)</label> <input type="text" id="sales" name="sales" placeholder="Total sales" value="${dto.sales }"/>
                            <label class="fieldlabels">연락처: * ('-'제외 입력)</label> <input type="text" id="phone" name="phone" placeholder="Contact No." value="${dto.phone }"/> 
                            <label class="fieldlabels">우편번호: * <button type="button" class="btn btn-dark" id="search" style="background-color:rgb(255, 111, 97);">주소 검색</button></label> <input type="text" id="postcode" name="zipcode" placeholder="Zipcode." value="${dto.zipcode }" readonly/>
                            <label class="fieldlabels">주소1: * </label> <input type="text" id="roadAddress" name="address1" placeholder="Address." value="${dto.address1 }"readonly />
                            <label class="fieldlabels">주소2: *</label> <input type="text" id="address2" name="address2" placeholder="Detail Address." value="${dto.address2 }"/>
                          	<label class="fieldlabels">비밀번호 찾기 힌트: * 
                          	<select id="pwAsk" name="pwAsk"> 
                          	<option>내가 다니던 초등학교는?</option>
                          	<option>내가 좋아하는 가수는?</option>
                          	<option>내가 좋아하는 숫자는?</option>
                          	<option>내가 존경하는 인물은?</option>
                          	</select>
                          	</label> <input type="text" id="pwAnswer" name="pwAnswer" placeholder="" />
                          	
 
                        </div> <input type="button" id="step2" name="next" class="next action-button" value="다음" /> <input type="button" name="previous" class="previous action-button-previous" value="이전" />
                    </fieldset>
                    <fieldset>
                        <div class="form-card">
                            <div class="row">
                                <div class="col-7">
                                    <h2 class="fs-title">프로필 사진 업로드:</h2>
                                </div>
                                <div class="col-5">
                                    <h2 class="steps">단계 3 - 4</h2>
                                </div>
                            </div> 
                            <label class="fieldlabels">Upload Signature Photo:</label> <input type="file" id="photo" name="photo" accept="image/*">
                        </div> 
                        <input type="button" id="step3" name="next" class="next action-button" value="제출" /> <input type="button" name="이전" class="previous action-button-previous" value="이전" />                        
                    </fieldset>
                    
                    <fieldset>
                        <div class="form-card">
                            <div class="row">
                                <div class="col-7">
                                    <h2 class="fs-title">정보수정 완료:</h2>
                                </div>
                                <div class="col-5">
                                    <h2 class="steps">단계 4 - 4</h2>
                                </div>
                            </div> <br><br>
                            <h2 class="black-text text-center"><strong>정보수정 성공 !</strong></h2> <br>
                            <div class="row justify-content-center">
                                <div class="col-3"> <img src="https://i.imgur.com/GwStPmg.png" class="fit-image"> </div>
                            </div> <br><br>
                            <div class="row justify-content-center">
                                <div class="col-7 text-center">
                                    <h5 class="black-text text-center">확인을 누르시면 정보수정이 완료되며 <br> 마이 페이지로 이동합니다.</h5>
                                </div>
                            </div>
                            <div class="row justify-content-center">
                            	<button type="submit" class="btn btn-dark" style="background-color:rgb(255, 111, 97); width:20%;" id="goLogin">확인</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/footer.jsp" flush="false"/>
</div>

<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
<script type='text/Javascript'>
$(document).ready(function(){

var current_fs, next_fs, previous_fs; //fieldsets
var opacity;
var current = 1;
var steps = $("fieldset").length;

setProgressBar(current);

$("#step1").click(function(){

current_fs = $(this).parent();
next_fs = $(this).parent().next();


let regexMail = /^[a-zA-Z\d]{1,}@[a-z]{1,}.com$/;
let resultMail = regexMail.test($("#email").val());
if(resultMail == false){
    alert("이메일을 다시 확인해주세요")
    return false;
}


let regexPw = /^[a-zA-Z\d]{8,16}$/;
let resultPw = regexPw.test($("#pw").val());
if(resultPw == false){
    alert("비밀번호 형식이 올바르지않습니다.")
    return false;
}


if($("#pw").val() != $("#pwd").val()){
	 alert("비밀번호를 다시 확인 해주세요")
     return false;
}

//Add Class Active
$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

//show the next fieldset
next_fs.show();


//hide the current fieldset with style
current_fs.animate({opacity: 0}, {
step: function(now) {
// for making fielset appear animation
opacity = 1 - now;

current_fs.css({
'display': 'none',
'position': 'relative'
});
next_fs.css({'opacity': opacity});
},
duration: 500
});
setProgressBar(++current);
});

$("#step2").click(function(){

	current_fs = $(this).parent();
	next_fs = $(this).parent().next();

	let regexName = /^[a-zA-Z가-힣\d]{1,}$/;
	let resultName = regexName.test($("#name").val());
	if(resultName == false){
	    alert("기업상호 형식이 올바르지 않습니다.")
	    return false;
	}
	 
     let regexRpt = /^[가-힣]{1,5}$/
     let resultRpt = regexRpt.test($("#rpt_cp").val());
     if(resultRpt == false){
         alert("대표자명을 다시 확인 해주세요")
         return false;
     }
     
     let regexCru = /^[\d]{10}$/
     let resultCru = regexCru.test($("#crunumber").val());
     if(resultCru == false){
    	 alert("사업자 번호 형식이 올바르지 않습니다.")
    	 return false;
     }
     
     let regexSales = /^[\d]{0,}$/
         let resultSales = regexSales.test($("#sales").val());
         if(resultSales == false){
        	 alert("매출액은 숫자로만 입력이 가능합니다.")
        	 return false;
         }
     
     let regexPhone = /^010-?\d{4}-?\d{4}$/;
     let resultPhone = regexPhone.test($("#phone").val());
     if(resultPhone == false){
         alert("휴대폰 번호가 올바르지않은 형식입니다.")
         return false;
     }
     
     let regexAddress1 = /^[가-힣\d]{1,}/;
     let resultAddress1 = regexAddress1.test($("#roadAddress").val());
     if(resultAddress1 == false){
         alert("주소를 입력해주세요.")
         return false;
     }
     
     let regexAddress2 = /^[가-힣\d]{1,}/;
     let resultAddress2 = regexAddress2.test($("#address2").val());
     if(resultAddress2 == false){
         alert("상세주소를 입력해주세요.")
         return false;
     }
     
     let regexpwAnswer = /^[a-zA-Z가-힣\d]{1,}/;
     let resultAnswer = regexpwAnswer.test($("#pwAnswer").val());
     if(resultAnswer == false){
         alert("비밀번호 힌트 답변을 입력해주세요.")
         return false;
     }
     
	//Add Class Active
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

	//show the next fieldset
	next_fs.show();


	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
	step: function(now) {
	// for making fielset appear animation
	opacity = 1 - now;

	current_fs.css({
	'display': 'none',
	'position': 'relative'
	});
	next_fs.css({'opacity': opacity});
	},
	duration: 500
	});
	setProgressBar(++current);
	});
	
$("#step3").click(function(){

	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	     
	//Add Class Active
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

	//show the next fieldset
	next_fs.show();


	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
	step: function(now) {
	// for making fielset appear animation
	opacity = 1 - now;

	current_fs.css({
	'display': 'none',
	'position': 'relative'
	});
	next_fs.css({'opacity': opacity});
	},
	duration: 500
	});
	setProgressBar(++current);
	});
	
$(".previous").click(function(){

current_fs = $(this).parent();
previous_fs = $(this).parent().prev();

//Remove class active
$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

//show the previous fieldset
previous_fs.show();

//hide the current fieldset with style
current_fs.animate({opacity: 0}, {
step: function(now) {
// for making fielset appear animation
opacity = 1 - now;

current_fs.css({
'display': 'none',
'position': 'relative'
});
previous_fs.css({'opacity': opacity});
},
duration: 500
});
setProgressBar(--current);
});

function setProgressBar(curStep){
var percent = parseFloat(100 / steps) * curStep;
percent = percent.toFixed();
$(".progress-bar")
.css("width",percent+"%")
}

});





</script>

<script>
	let result = document.getElementById("pwCheckResult");

	document.getElementById("pwd").oninput = function() {
      let pw1 = $("#pw").val();
      let pw2 = $("#pwd").val();
      if (pw1 != pw2) {
         result.innerHTML = "패스워드가 일치하지않습니다"

      }else if (pw1 ==""){
         result.innerHTML = ""
      } else if (pw2 ==""){
         result.innerHTML = ""
      }else {
         result.innerHTML = "패스워드가 일치합니다."
      }
   }
   document.getElementById("pw").oninput = function() {
      let pw1 = $("#pw").val();
      let pw2 = $("#pwd").val();
      if (pw1 != pw2) {
         result.innerHTML = "패스워드가 일치하지않습니다"

      } else if (pw1 ==""){
         result.innerHTML = ""
      } else if (pw2 ==""){
         result.innerHTML = ""
      }else  {
         result.innerHTML = "패스워드가 일치합니다."
      }
   }
	
	
	document.getElementById("search").onclick = function(){
        new daum.Postcode({
            oncomplete: function(data) {                                 
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = data.roadAddress;                   
            }            
        }).open();
    }
	
	if($("#photo").val() == ""){
		$("#photo").val() == "default";
	}
</script>


 	</body>
</html>