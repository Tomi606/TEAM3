<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 상세 페이지 - 하단</title>
<style type="text/css">
.toggle-button {
    padding: 10px 20px;
    margin: 10px;
    font-size: 16px;
    cursor: pointer;
}

.page {
    display: none;
    padding: 20px;
    border: 1px solid #ccc;
}

.page.active {
    display: block;
}
</style>
</head>
<body>
<h1>병원 상세 페이지 - 하단</h1>
<div class="toggle-btn">
	<button id="btn1" class="toggle-button">병원 소개</button>
	<button id="btn2" class="toggle-button">진료 과목</button>
	<button id="btn3" class="toggle-button">리뷰</button>
</div>
<div class="toggle-page">
	<form action='<c:url value="/hospital/info"/>' method="post" id="page1" class="page active">
        <h1>병원 소개 페이지</h1>
        <div class="hospital-info">
        	<label for="hospital-info">병원 소개</label>
        	<textarea id="hospital-info" rows="4" cols="50"></textarea>
        </div>
        <div class="hospital-map">
        	<label for="hospital-map">지도</label>
        </div>
        	<button type="submit">병원 소개 등록</button>
    </form>

    <form action='<c:url value="/hospital/subject"/>' method="post" id="page2" class="page">
        <h1>진료 과목 페이지</h1>
        <div class="subject-represent">        
	        <label for="subject-represent">대표 진료 과목</label>
	        <div class="subject-checkbox">
	        	<c:forEach items="${hsList}" var="hs">
			    	<input type="checkbox" name="subject" value="${hs.hs_num}">${hs.hs_title}
	        	</c:forEach>
	        </div>
        </div>
        <div>
        	<label for="subject-detail">상세 진료 항목</label>
	       	<textarea id="subject-detail" rows="4" cols="50" 
	       	placeholder="감염성 질환 / 알레르기 / 만성 질환 / 호흡기 질환 / 피부 질환..."></textarea>
        </div>
       	<button class="subject-btn" type="submit">진료 과목 등록</button>
    </form>

    <form action='<c:url value="/hospital/review"/>' method="post" id="page3" class="page">
        <h1>리뷰 페이지</h1>
        <label for="review">리뷰 등록</label>
      	<textarea id="review" rows="4" cols="50"></textarea>
      	<button type="submit">리뷰 등록</button>
    </form>
</div>
</body>
<!-- 토글 버튼 -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	let btn1 = document.getElementById('btn1');
	let btn2 = document.getElementById('btn2');
	let btn3 = document.getElementById('btn3');
	
	btn1.addEventListener('click', function() {
		activatePage(page1);
	});
	
	btn2.addEventListener('click', function() {
		activatePage(page2);
	});
	
	btn3.addEventListener('click', function() {
		activatePage(page3);
	});
	
	function activatePage(page) {
		//모든 화면의 active 클래스 제거
		document.querySelectorAll('.page').forEach(p => {
			p.classList.remove('active');
		});
		
		//선택한 화면에 active 클래스 추가
		page.classList.add('active');
	}
});
</script>

</html>