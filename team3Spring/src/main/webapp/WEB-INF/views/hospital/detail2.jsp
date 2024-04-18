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
	<form action='<c:url value="/hospital/info"/>' method="post" name="page1" id="page1" class="page active">
        <h1>1. 병원 소개 페이지</h1>
        <div class="info">
        	<label for="hd_info" style="font-weight: bold">병원 소개</label>
        	<textarea class="hd_info col-10 row-10" id="hd_info" name="hd_info" readonly placeholder="병원 소개"></textarea>
        </div>
        <table class="hd_time" id="hd_time">
	    <thead>
	        <tr>
	            <th>진료 시간</th>
	        </tr>
	    </thead>
	    <tbody>
	        <tr>
	            <td>월요일</td>
	            <td><input type="text" class="mon" name="mon" readonly placeholder="9:00~18:00"></td>
	        </tr>
	        <tr>
	            <td>화요일</td>
	            <td><input type="text" class="tue" name="tue" readonly placeholder="9:00~18:00"></td>
	        </tr>
	        <tr>
	            <td>수요일</td>
	            <td><input type="text" class="wed" name="wed" readonly placeholder="9:00~18:00"></td>
	        </tr>
	        <tr>
	            <td>목요일</td>
	            <td><input type="text" class="thu" name="thu" readonly placeholder="9:00~18:00"></td>
	        </tr>
	        <tr>
	            <td>금요일</td>
	            <td><input type="text" class="fri" name="fri" readonly placeholder="9:00~18:00"></td>
	        </tr>
	        <tr>
	            <td>토요일</td>
	            <td><input type="text" class="sat" name="sat" readonly placeholder="9:00~13:00"></td>
	        </tr>
	        <tr>
	            <td>일요일</td> 
	            <td><input type="text" class="sun" name="sun" readonly placeholder="휴무"></td>
	        </tr>
	    </tbody>
	</table>
        <div class="hd_park" id="hd_park">
        	<label for="hd_park" style="font-weight: bold">주차 정보</label>
        	<textarea class="hd_park col-10 row-10" id="hd_park" name="hd_park" readonly placeholder="주차 정보"></textarea>
        </div>
        <div class="hd_announce">
        	<label for="hd_announce" style="font-weight: bold">공지 사항</label>
        	<textarea class="hd_announce col-10 row-10" id="hd_announce" name="hd_announce" readonly placeholder="공지 사항"></textarea>
        </div>
        <div class="hd_etc">
        	<label for="hd_etc" style="font-weight: bold">기타 사항</label>
        	<textarea class="hd_etc col-10 row-10" id="hd_etc" name="hd_etc" readonly placeholder="기타 사항"></textarea>
        </div>
    </form>

    <form action='<c:url value="/hospital/subject"/>' method="post" id="page2" class="page">
        <h1>2. 진료 과목 페이지</h1>
        <div class="subject-represent">        
	        <label for="subject-represent">대표 진료 과목</label>
	        <div class="subject-checkbox">
	        	<c:forEach items="${hsList}" var="hs">
			    	<input type="checkbox" name="subject" value="${hs.hs_num}">${hs.hs_title}
	        	</c:forEach>
	        </div>
        </div>
        <div>
        	<label for="hd_etc">상세 진료 항목</label>
	       	<textarea class="hd_etc col-10 row-10" id="hd_etc" name="hd_etc" readonly style="width: 80%"
	       	placeholder="상세 진료 항목 : 감염성 질환 / 알레르기 / 만성 질환 / 호흡기 질환 / 피부 질환..."></textarea>
        </div>
    </form>

    <form action='<c:url value="/hospital/review"/>' method="post" id="page3" class="page">
        <h1>3. 리뷰</h1>
        <h3>등록된 리뷰가 없습니다.</h3>
        <label for="review">회원 아이디</label>
        <textarea id="review" rows="4" cols="70"></textarea>
        <button type="submit" class="review-btn" name="review-btn">리뷰 등록</button>
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