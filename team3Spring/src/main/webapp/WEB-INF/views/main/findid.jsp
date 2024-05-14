<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<h1>아이디 찾기</h1>
<div class="all-container">
	<div class="input-container">
		<div class="email-box">		
			<label for="site_email" class="label">이메일</label>
			<input type="text" class="site_email" id="site_email" name="site_email" placeholder="이메일을 입력하세요">
		</div>
		<div class="phone-box">
			<label for="site_phone" class="label">휴대폰 번호 및 대표 전화번호</label>
			<input type="text" class="site_phone" id="site_phone" name="site_phone" placeholder="휴대폰 번호 및 대표 전화번호를 입력하세요">
		</div>
	</div>
	<button class="btn btn-outline-success btn-find">아이디 찾기</button>
</div>

<script type="text/javascript">
$('.btn-find').click(function() {
	let obj = {
		email : $('[name=site_email]').val(),
		phone : $('[name=site_phone]').val()
	}
	
	$.ajax({
		async : true,
		url : '<c:url value="/main/findid"/>',
		type : 'post', 
		data : obj, 
		dataType : "json", 
		success : function (data) {
			if(data.result == true) {
				alert("회원님의 아이디는 " + data.user.site_id + " 입니다.");
			}
			else if(data.result == false) {				
				alert('일치하는 이메일 또는 일치하는 전화번호가 없습니다.');
			}
			else {
				alert('알 수 없는 오류 발생!');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
});
</script>
</body>
</html>