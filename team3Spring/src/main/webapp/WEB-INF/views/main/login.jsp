<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
.login-box{
	text-align: center;
}

.login-btn{
	margin: 0;
	padding: 0;
	width: 200px;
	height: 40px;
	color: gray;
	border: 1px solid gray;
	box-sizing: border-box;
}

.member-login-btn{
	margin-right: -3px;
}

.hospital-login-btn{
	margin-left: -3px;
}

.login-btn-click{
	color: black;
	background: white;
}

.member-login-btn:hover{
	color: black;
	background: white;
}
.hospital-login-btn:hover{
	color: black;
	background: white;
}

.login-form{
	width: 399px;
	height: 400px;
	border: 1px solid gray;
	text-align: center;
	display: inline-block;
	margin-top: -1px;
}

.input-group{
	margin-top: 40px;
	display: inline-block;
}

.input-box{
	width: 300px;
	height: 40px;
	margin-bottom: 10px;
	padding: 10px;
}

.submit-btn{
	width: 300px;
	height: 40px;
	margin-top: 20px;
}

.hospital-form-box{
	display: none;
}




</style>
</head>
<body>
	<div class="login-box">
		<h1>로그인</h1>
		<div class="login-btns">
			<button type="button" class="login-btn member-login-btn login-btn-click">회원</button>
			<button type="button" class="login-btn hospital-login-btn">병원</button>
		</div>
		<div class="form-box member-form-box">
			<form action="<c:url value="/member/login"/>" method="post" class="login-form">
				<div class="input-group">
					<input type="text" placeholder="아이디" name="me_id" class="input-box">
					<input type="password" placeholder="비밀번호" name="me_pw" class="input-box">
				</div>
				<button class="submit-btn">로그인</button>
			</form>
		</div>
		<div class="form-box hospital-form-box">
			<form action="" method="post" class="login-form">
				<div class="input-group">
					<input type="text" placeholder="사업자번호" name="ho_num" class="input-box">
					<input type="text" placeholder="아이디" name="ho_id" class="input-box">
					<input type="password" placeholder="비밀번호" name="ho_pw" class="input-box">
				</div>
				<button class="submit-btn">로그인</button>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(".member-login-btn").click(function(){
		$(".hospital-form-box").hide();
		$(".member-form-box").show();
		$(".member-login-btn").addClass("login-btn-click");
		$(".hospital-login-btn").removeClass("login-btn-click");
	});
	$(".hospital-login-btn").click(function(){
		$(".member-form-box").hide();
		$(".hospital-form-box").show();
		$(".hospital-login-btn").addClass("login-btn-click");
		$(".member-login-btn").removeClass("login-btn-click");
	});
</script>
</html>