<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
#toggle-slider {
    display: none;
}

label {
    cursor: pointer;
    width: 60px; 
    height: 30px; 
    text-indent: -9999em;
    background: #dff7fa;
    border-radius: 15px;
    position: relative;
    transition: 0.4s ease-out;
}

label::after {
    content: "";
    width: 20px; 
    height: 20px; 
    background: #a5cace;
    position: absolute;
    border-radius: 50%;
    top: 5px;
    left: 5px; 
    transition: 0.4s ease-out;
}

#toggle-slider:checked+label {
    background: #96e7ef;
}

#toggle-slider:checked+label::after {
    background: #1d6269;
    left: 35px; /* 좌측 위치 조정 */
}




#toggle-slider1 {
    display: none;
}

label {
    cursor: pointer;
    width: 60px; 
    height: 30px; 
    text-indent: -9999em;
    background: #dff7fa;
    border-radius: 15px;
    position: relative;
    transition: 0.4s ease-out;
}

label::after {
    content: "";
    width: 20px; 
    height: 20px; 
    background: #a5cace;
    position: absolute;
    border-radius: 50%;
    top: 5px;
    left: 5px; 
    transition: 0.4s ease-out;
}

#toggle-slider1:checked+label {
    background: #96e7ef;
}

#toggle-slider1:checked+label::after {
    background: #1d6269;
    left: 35px; /* 좌측 위치 조정 */
}

.login-box {
	border:1px solid white;
	border-radius:14%;
	background-color:#E8F5FF;
	text-align: center;
	margin-top: 100px;
}

.login-btn {
	margin: 0;
	padding: 0;
	width: 200px;
	height: 40px;
	color: gray;
	border: 1px solid gray;
	box-sizing: border-box;
}

.member-login-btn {
	
	border: none;
   	border-top: 4px solid #d5d5d5;
	color:rgba(0, 0, 0, .5);
    background-color: #f4f4f4;
    border-bottom: 3px solid #c8c8c8;
	margin-right: -3px;
}

.hospital-login-btn {
    border: none;
   border-top: 4px solid #d5d5d5;
	color:rgba(0, 0, 0, .5);
    background-color: #f4f4f4;
    border-bottom: 3px solid #c8c8c8;
	margin-left: -3px;
}

.login-btn-click {
    border: 2px solid white;
	border-top:3px solid #8AE634;
    margin-bottom: 1px;
    border-bottom: 3px solid white;
	color: black;
	background: white;
	font-weight: bold;
}

.member-login-btn:hover {
	color: black;
	background: white;
}

.hospital-login-btn:hover {
	color: black;
	background: white;
}

.login-form {
	width: 399px;
	height: 350px;
	text-align: center;
	display: inline-block;
	margin-top: -1px;
	border-top: 1px solid white; 
	background-color: white;
}

.input-group {
	margin-top: 40px;
	display: inline-block;
}

.input-box {
	width: 300px;
	height: 40px;
	margin-bottom: 10px;
	padding: 10px;
}

.submit-btn {
	width: 300px;
	height: 40px;
	margin-top: 20px;
}

.hospital-form-box {
	display: none;
}

.find-signup-box {
	margin-top: 20px;
	font-size: 13px;
	font-weight: bold;
}
.login-btn-r{
	border-style:none;
	background: #C6FF70	;
	color: white;
}
.login-btn-r:hover{
	border-style:none;
	background:#8AE634	;
	color: white;
}
.login-input-tag{
   position: relative;
    display: inline-block;
}
.auto-login{
	margin-bottom: 5px;
}

.input-box.id{
    margin-bottom: 10px;
     padding-right: 40px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-image: url('<c:url value="/resources/img/user.svg"/>'); 
    background-repeat: no-repeat; 
    background-position: right 10px center; 
    background-size: 20px; 
}
.input-box.pw{
    margin-bottom: 10px;
     padding-right: 40px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-image: url('<c:url value="/resources/img/passwordcheck.svg"/>'); 
    background-repeat: no-repeat; 
    background-position: right 10px center; 
    background-size: 20px; 
}
.input-box.num{
    margin-bottom: 10px;
     padding-right: 40px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-image: url('<c:url value="/resources/img/quote.svg"/>'); 
    background-repeat: no-repeat; 
    background-position: right 10px center; 
    background-size: 20px; 
}
.login-box-second{

background-color: white;
}

</style>
</head>
<body>
	<div class="login-box">
		<div class="login-box-second"></div>
		<div class="login-btns">
			<button type="button" class="login-btn member-login-btn login-btn-click">회원</button>
			<button type="button" class="login-btn hospital-login-btn">병원</button>
		</div>
		<div class="form-box member-form-box">
			<div class="login-form">
				<form action="<c:url value="/member/login"/>" method="post">
					<div class="input-group">
						<div class="auto-login">
							<span>자동로그인</span>
					 		<input type="checkbox" id="toggle-slider">
					 		<label for="toggle-slider">On/Off</label>
					 	</div>
					 	<div class="login-input-tag">
							<input type="text" placeholder="아이디" name="me_id" class="input-box id"> 
						</div>
					 	<div class="login-input-tag">
							<input type="password" placeholder="비밀번호" name="me_pw" class="input-box pw">
						</div>
					</div>
					<button class="submit-btn login-btn-r">로그인</button>
				</form>
				<div class="find-signup-box">
					<a class="" href="">아이디/비밀번호 찾기</a> <span>|</span> <a class=""
						href="<c:url value="/main/signup"/>">회원가입</a>
				</div>
			</div>
		</div>
		<div class="form-box hospital-form-box">
			<div class="login-form">
				<form action="<c:url value="/hospital/login"/>" method="post">
					<div class="input-group">	
						<div  class="auto-login">
							<span>자동로그인</span>
						 	<input type="checkbox" id="toggle-slider1">
						 	<label for="toggle-slider1">On/Off</label>
						</div>
						<div class="login-input-tag">
							<input type="text" placeholder="사업자번호" name="ho_num"
								class="input-box num" maxlength="10"> 
						</div>	
						<div class="login-input-tag">
							<input type="text" placeholder="아이디" name="ho_id" class="input-box id"> 
						</div>
						<div class="login-input-tag">
							<input type="password" placeholder="비밀번호" name="ho_pw" class="input-box pw">
						</div>
					</div>
					<button class="submit-btn login-btn-r">로그인</button>
				</form>
				<div class="find-signup-box">
					<a class="" href="">아이디/비밀번호 찾기</a> <span>|</span> <a class=""
						href="">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(".member-login-btn").click(function() {
		$(".hospital-form-box").hide();
		$(".member-form-box").show();
		$(".member-login-btn").addClass("login-btn-click");
		$(".hospital-login-btn").removeClass("login-btn-click");
	});
	$(".hospital-login-btn").click(function() {
		$(".member-form-box").hide();
		$(".hospital-form-box").show();
		$(".hospital-login-btn").addClass("login-btn-click");
		$(".member-login-btn").removeClass("login-btn-click");
	});
</script>
<script type="text/javascript">
	//300655f18482c4d8c0a57b772e5720fc
</script>
</html>