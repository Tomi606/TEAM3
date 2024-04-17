<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상세 페이지 등록</title>
</head>
<body>
<form action='<c:url value="/hospital/detail/insert"/>' method="post">
	<div id="page1" class="page">
	    <h2>병원 소개</h2>
	    <div class="info">
	    	<label for="hd_info" style="font-weight: bold">병원 소개</label>
	       	<input type="text" class="hd_info" id="hd_info" name="hd_info" readonly placeholder="병원 소개"/>
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
	            <td><input type="text" class="sat" name="sat" readonly placeholder="9:00~18:00"></td>
	        </tr>
	        <tr>
	            <td>일요일</td> 
	            <td><input type="text" class="sun" name="sun" readonly placeholder="9:00~18:00"></td>
	        </tr>
	    </tbody>
	</table>
	       <div class="hd_park" id="hd_park">
	       	<label for="hd_park" style="font-weight: bold">주차 정보</label>
	    	<input type="text" class="input-tag" id="hd_park" name="hd_park" readonly placeholder="주차 정보"/>
	    </div>
	    <div class="hd_announce">
	    	<label for="hd_announce" style="font-weight: bold">공지 사항</label>
	    	<input type="text" class="input-tag" id="hd_announce" name="hd_announce" readonly placeholder="공지 사항"/>
	    </div>
	    <div class="hd_etc">
	    	<label for="hd_etc" style="font-weight: bold">기타 사항</label>
	    	<input type="text" class="input-tag" id="hd_etc" name="hd_etc" readonly placeholder="기타 사항"/>
	    </div>
	    	<button type="submit" class="info-btn">병원 소개 등록</button>
	</div>
	
	<div id="page2" class="page">
	    <h2>진료 과목</h2>
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
	    	<input type="text" class="input-tag" id="hd_etc" name="hd_etc" readonly 
	    	placeholder="상세 진료 항목 : 감염성 질환 / 알레르기 / 만성 질환 / 호흡기 질환 / 피부 질환..."/>
	    </div>
	   	<button type="submit" class="subject-btn" name="subject-btn">진료 과목 등록</button>
	</div>
</form>


</body>
</html>
