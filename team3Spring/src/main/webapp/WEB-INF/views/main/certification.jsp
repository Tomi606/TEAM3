<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 이메일 인증</title>

<style type="text/css">
.home-box1 {
	width: 100%;
	height: 500px;
	background: url('<c:url value="/resources/img/white_pattern.jpg"/>');
	background-repeat: no-repeat;
	background-size: cover;
    background-origin: content-box;
}

.page-title{
color:rgba(0, 100, 60, 0.8);
	text-align: left;
	font-size: 50px;
	font-weight: bold;
	margin: 0 0 80px 0;
}

.all-container {
	padding: 60px 80px 100px;
    margin: -250px auto 70px auto;
    width: 55%;
    background-color: white;
    border-radius: 15px;
    display: block;
    box-shadow: 0 1px 5px 2px rgba(0, 0, 0, 0.2);
}

.email-box {
	margin-bottom: 20px;
}

.label {
	color:#555;
	text-align: center;
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 0px;
}
.btn-email, .btn-ce{
	margin-top: 10px;
	float: right;
}
.number_box{
	margin-top: 10px; 
}
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px;">
		<div class="page-title">
			이메일 인증
		</div>
	</div>
</div>
<div class="all-container">
	<div class="email-box">
		<label for="email" class="label">이메일 입력</label> 
		<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요.">
	<button class="btn btn-outline-success btn-email">이메일 인증</button>
	</div>
	<br>
	<div class="ce_numbox"></div>
</div>



<!-- 이메일 인증 보내기 -->
<script type="text/javascript">
let code = null;
function emailCheck(){
	  var email = $("#email").val();
	    if (email.length == 0 || email == "") {
	       alert("이메일을 입력 하세요.");
	       return;
	    }
	    let res = null;
	    $.ajax({
	    	async : false,
	        url: '<c:url value="/hospital/checkEmail"/>',
	        type: "get",
	        data: { "site_email": email }, 
	        success: function(response) {
	            if (response.hoEmailCheck == null) {
	               alert("사용 가능한 이메일입니다.");
	               res = true;
	            } else {
	               alert("이미 사용중인 이메일입니다.");
	               res = false;
	            }
	        }
	    }); // ajax end;
	    return res;
}

$(".btn-email").click( function() {
	code = displaySuccessBtn();
	console.log(code);
});

function displaySuccessBtn(){
	let res = emailCheck();
	
 	let em = null; 
  	if(res){
  		let email = $('[name=email]').val() 
		//서버로 전송
		$.ajax({
			async : false,
			url : '<c:url value="/certification/email"/>', 
			type : 'post', 
			data : {
  				"email" : email
  			}, 
			success : function (data){
					let str = 
					`
						<div class="number_box">
							<label for="ce_num" class="label">인증번호</label>
							<input type="text" class="form-control" id="ce_num" name="ce_num" placeholder="인증번호를 입력하세요." >
							<button class="btn btn-outline-success btn-ce">인증하기</button>
						</div>
					`
					$(".ce_numbox").html(str);
					em = data.ctfEmail
			}, 
		});
  	}else{
  		alert("이메일 인증에 문제가 생겼습니다. 다시 시도해 주세요");
  		location.reload(true);
  	}
  	return em;
}

$(document).on("click", ".btn-ce", function(){
	let newCeNum = $("[name=ce_num]").val();
	let url = document.referrer;
    // ceNum 함수의 매개변수로 전달된 값도 함께 보냅니다.
    $.ajax({
        async : 'true',
        url : '<c:url value="/certification/num"/>', 
        type : 'post', 
        data : { "newCeNum": newCeNum, "data": code },
        success: function(data) {
            if(!data){
                alert("인증에 실패했습니다");
            }else{
                alert("인증에 성공했습니다. 회원가입 페이지로 이동합니다.");
               	let email= $("[name=email]").val();
               	if(${num} == 2){               		
               		location.href = '<c:url value="/hospital/signup"/>?email=' + encodeURIComponent(email);
               	}else if(${num} == 1){
               		location.href = '<c:url value="/member/signup"/>?email=' + encodeURIComponent(email);
               	}else{
               		alert("잘못된 접근입니다.");
               		location.reload(true);
               	}
            }
        }
    });
})

</script>
</body>
</html>
