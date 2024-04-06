<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 회원가입</title>
<style type="text/css">
 
</style>
</head>
<body>
<form class="container" action='<c:url value="/hospital/signup"/>' id="myForm" method="post">
	<h1 class="mt-3">사업자 회원가입</h1>
	<div>
		<label for="id">아이디</label>
		<input type="text" id="id" name="ho_id" required placeholder="아이디를 입력하세요."/>
	</div>
	<input type="hidden" id="id2" name="site_id">
	<div>
		<label for="pw">비밀번호</label>
		<input type="password" id="pw" name="ho_pw" required placeholder="비밀번호를 입력하세요."/>
	</div>
	<div>
		<label for="pw2">비밀번호 확인</label>
		<input type="password" id="pw2" name="ho_pw2" required placeholder="비밀번호를 한번 더 입력하세요."/>
	</div>
	<div>
		<label for="email">이메일</label>
		<input type="email" id="email" name="ho_email" required placeholder="이메일을 입력하세요."/>
	</div>
	<div>
		<label for="name">상호명</label>
		<input type="text" id="name" name="ho_name" required placeholder="상호명을 입력하세요."/>
	</div>
	<div>
		<label for="subject">대표 진료과목</label>
		<input type="text" id="subject" name="ho_hs_num" required placeholder="(숫자입력)대표 진료과목을 입력하세요."/>
	</div>
	<div>
		<label for="ceo">대표자명</label>
		<input type="text" id="ceo" name="ho_ceo" required placeholder="대표자명을 입력하세요."/>
	</div>
	<div>
		<label for="num">사업자번호</label>
		<input type="text" id="num" name="ho_num" required placeholder="'-'제외한 사업자번호를 입력하세요."/>
	</div>
	<div>
		<label for="address">소재지</label>
		<input type="text" id="address" name="ho_address" required placeholder="소재지 상세주소를 입력하세요."/>
	</div>
	<div>
		<label for="phone">대표 전화번호</label>
		<input type="text" id="phone" name="ho_phone" required placeholder="'-'제외한 대표 전화번호를 입력하세요."/>
	</div>
	<button type="button" onclick="hoIdForm()">회원가입</button>
</form>
<script type="text/javascript">
//입력한 아이디 = 사이트 아이디
function hoIdForm() {
	var hoId = document.getElementById("id").value;
	document.getElementById("id2").value = hoId;
	document.getElementById("myForm").submit(); 
}
</script>
</body>
</html>