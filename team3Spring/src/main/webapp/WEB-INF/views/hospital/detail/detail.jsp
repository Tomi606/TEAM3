<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 상세 페이지 조회</title>
</head>
<body>
<div class="detail-page">
	<h2>병원 상세 페이지 조회</h2>
	<div class="">
		<label for="">상호명</label>
		<input class="" id="" name="" value="${hospital.ho_name}" readonly>
	</div>
	<div class="">
		<label for="">주소</label>
		<input class="" id="" name="" value="${hospital.ho_address}" readonly>
	</div>
	<div class="">
		<label for="">연락처</label>
		<input class="" id="" name="" value="${hospital.ho_phone}" readonly>
	</div>
	<div>
		<a href='<c:url value="예약하기 버튼 url"/>' class="btn btn-outline-success">예약하기</a>
	</div>
	<hr style="border: 3px solid gray;">
	<div class="">
		<label for="">병원 소개</label>
		<input class="" id="" name="" value="${detail.hd_info}" readonly>
	</div>
</div>
</body>
</html>