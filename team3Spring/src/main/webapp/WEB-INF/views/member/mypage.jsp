<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<h1>마이페이지입니다.</h1>

<div class="input-box">	
		<div>
			<img  alt="아이디이미지" src="<c:url value="/resources/img/user.svg"/>">
		    <input  type="text" id="id" name="site_id" placeholder="아이디" autofocus="autofocus" class="input-tag">
		    <label class="text-danger textId" id="laId"></label>
		  <!--<a type="button" class="check-duplicate btn duplicate">중복 확인</a> -->
		</div>
		<div>
	    	<input type="hidden" id="id2" name="me_id">
		</div>
		<div>
			<img alt="아이디이미지" src="<c:url value="/resources/img/password.svg"/>">
	    	<input   type="password" id="pw" name="me_pw" placeholder="비밀번호" autofocus="autofocus" class="input-tag">
	    	<label for="me_pw" class="text-danger"></label>
		</div>
		<div>
			<img alt="아이디이미지" src="<c:url value="/resources/img/passwordcheck.svg"/>">
	   	 	<input   type="password" id="pw2" name="me_pw2" placeholder="비밀번호 확인" autofocus="autofocus" class="input-tag">
	   	 	<label for="me_pw2" class="text-danger"></label>
		</div>
		<div>
			<img alt="아이디이미지" src="<c:url value="/resources/img/name.svg"/>">
	    	<input   type="text" id="name" name="me_name" placeholder="이름" autofocus="autofocus" class="input-tag">
	    	<label for="me_name" class="text-danger"></label>
		</div>
		<!-- 이메일  -->
		<div>
			<img alt="아이디이미지" src="<c:url value="/resources/img/mail.svg"/>">
	    	<input  type="text" id="email" name="site_email" placeholder="이메일" autofocus="autofocus" class="input-tag">
	    	<!-- <a type="button" class="email-btn btn duplicate">중복확인</a> -->
	    	<label for="me_email" class="text-danger etext"></label>
		</div>
		<div>
	    	<input type="hidden" id="email2" name="me_email">
		</div>
		<div class="gender-buttons">
			<img alt="아이디이미지" src="<c:url value="/resources/img/gender.svg"/>">
	   		 <input type="radio" id="male" name="me_gender" value="남자">
	   		 <label for="male">남자</label>
		</div>

		<div class="gender-buttons">
		    <input type="radio" id="female" name="me_gender" value="여자" >
		    <label for="female"style="border:1px solid #ff69b4;">여자</label>
		</div>
		<div style="margin-top: 15px;">
			<img alt="아이디이미지" src="<c:url value="/resources/img/job.svg"/>">
	   	 	<input   type="text" id="job" name="me_job" placeholder="직업을 입력하세요" autofocus="autofocus" class="input-tag">
	    	<label for="me_job" class="text-danger"></label>
		</div>
		<div>
			<img alt="아이디이미지" src="<c:url value="/resources/img/phone.svg"/>">
	    	<input   type="text" id="phone" name="site_phone" placeholder="핸드폰 번호" autofocus="autofocus" class="input-tag">
	    	<label for="me_phone" class="text-danger textPhone" id="idcheck-phone"></label>
		</div>
		<!-- 핸드폰  -->
		<div>
	    	<input type="hidden" id="phone2" name="me_phone">
		</div>
		<div class="subject">
		<div class="hr" style="margin-top:30px;margin-bottom:40px;border: 1px solid #d2d2d2;width: 560px;"></div>
			<select id="subject" name="me_hs_num" style="margin-bottom: 15px;width: 500px" >
				<option value="none">관심 병원 과목을 선택하세요</option>
				<option value="none">없음</option>
				<c:forEach items="${list}" var="hs">
					<option value="${hs.hs_num}">${hs.hs_title}</option>
				</c:forEach>
			</select>
		</div>
		<div>
		 <select name="sd_num" required class="sd_num" style="width: 500px;margin-bottom: 20px">
		 		<option value="none">시/도를 선택해주세요</option>
	        <c:forEach items="${sidoList}" var="sd">
	            <option value="${sd.sd_num}">${sd.sd_name}</option>
	        </c:forEach>
	     </select>   
		 <select name="sgg_num" class="sgg_num" required style="width: 500px;margin-bottom: 20px">
	           <option value="none">시/군/구를 선택해주세요</option>
	     </select>   
	    <select name="emd_num" class="emd_num" required style="width: 500px;margin-bottom: 20px">
	         <option value="none">읍/면/동을 선택해주세요</option>
	 	</select>
		</div>
</div>


</body>
</html>