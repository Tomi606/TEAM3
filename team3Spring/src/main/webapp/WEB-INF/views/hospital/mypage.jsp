<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body-tag {
width: 100%;
display: felex;flex-direction: column;
align-items: center;
}
.input-box {
	border:1px solid white;
	width: 100%;height:100%; 
	margin: 0 auto;
	padding: 5px;
}
.input-tag {
    border: 1px solid #ccc; 
    outline: none;
    margin-bottom: 15px; 
    width: 400px;
    padding: 10px;
}
.input-tag:focus {
    border-bottom-color:  #C12DFF; 
    box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
}
.btn {
	text-decoration: none;
	border:1px solid  #C12DFF;
	width: 100px;
}
.btn:hover {
	background-color:  #C12DFF;
	color: white;
}
.signup-btn {
text-align:center;font-size:20px;font-weight:bold;
width: 400px;height:40px;border-radius:0;
padding: 2px;border-bottom: 1px solid  #C12DFF;
margin-left:34px;
}
select {
	margin-left:34px;
    padding: 10px;
    font-size: 16px; 
    border: 1px solid #ccc; 
    background-color: #ffff; 
    outline: none; 
    width: 200px; 
}
select:focus {
    border-color:  #C12DFF; 
    box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
}
select:hover {
    background-color: #eaeaea;
}
img {
 width: 30px;
}
.duplicate {
    float:right;
	border-radius:0;
	height: 43px;
}
label {
	margin-left: 30px;
}
.program{
width: 500px;height: 300px;border: 1px solid black;

}
 
 .hos_my_page_inner{width: 100%; display:flex; flex-wrap: wrap;}
 .program_check_wrap{display: grid; grid-template-columns: 1fr 1fr; grid-gap: 20px;}
</style>

</head>
<body>
<div class="body-tag">

		<div class="input-box">
		<div class="hos_my_page_inner">
			<div class="hos_my_page_input_wrap">
				<div>
					<h1>병원 마이페이지입니다.</h1>
					<img alt="아이디 이미지" src="<c:url value="/resources/img/ceo.svg"/>">
					<input type="text" class="input-tag" id="id" name="ho_id"  readonly="readonly" placeholder="아이디 수정 불가능"/>
					<label class="text-danger textId" id="laId"></label>
				</div>
				<div>
			    	<input type="hidden" id="id2" name="site_id">
				</div>
				<div>
					<img alt="비번 이미지" src="<c:url value="/resources/img/password.svg"/>">
					<input type="password" class="input-tag" id="pw" name="ho_pw"  readonly="readonly"/>
					<label id="pw-error" class="error text-danger" for="pw"></label>
				</div>
				<div>
					<img alt="비번확인 이미지" src="<c:url value="/resources/img/passwordcheck.svg"/>">
					<input type="password" class="input-tag" id="pw2" name="ho_pw2" readonly="readonly"/>
					<label id="pw2-error" class="error text-danger" for="pw2"></label>
				</div>
				<div>
					<img alt="이메일 이미지" src="<c:url value="/resources/img/email.svg"/>">
					<input type="email" class="input-tag" id="email" name="ho_email" readonly="readonly"/>
					<!-- 데이터 추가 후 풀기 <input type="email" class="input-tag" id="email" name="ho_email" readonly value="${email}"/> -->
					<label id="email-error" class="error text-danger" for="email"></label>
				</div>
				<div>
					<img alt="상호명 이미지" src="<c:url value="/resources/img/quote.svg"/>">
					<input type="text" class="input-tag" id="name" name="ho_name" readonly="readonly"/>
					<label id="name-error" class="error text-danger" for="name"></label>
				</div>
				<div>
					<img alt="대표자명 이미지" src="<c:url value="/resources/img/user.svg"/>">
					<input type="text" class="input-tag" id="ceo" name="ho_ceo" readonly="readonly"/>
					<label id="ceo-error" class="error text-danger" for="ceo"></label>
				</div>
				<div>
					<img alt="사업자번호 이미지" src="<c:url value="/resources/img/job.svg"/>">
					<input type="text" class="input-tag" id="num" name="ho_num" readonly="readonly" placeholder="사업자번호 수정 불가능"/>
					<label id="num-error" class="error text-danger" for="num"></label>
				</div>
				<div>
					<img alt="대표 전화번호 이미지" src="<c:url value="/resources/img/phone2.svg"/>">
					<input type="text" class="input-tag" id="phone" name="ho_phone"readonly="readonly"/>
					<label id="phone-error" class="error text-danger" for="phone"></label>
				</div>
				
			</div>
				
				
			<div class="program_check_wrap">
				<div class="program">
					<a href="#">프로그램 관리</a>
					
				</div>
				<div class="program">
					<a href="#">예약 관리</a>
				</div>
				<div class="program">
				 
				</div>
				<div class="program">
				
				</div>
			</div>
		</div>
			
			
			<div class="subject">
			<div class="hr" style="margin-top:30px; margin-bottom:40px; border: 1px solid #d2d2d2; width: 100%;"></div>
				<select id="subject" name="ho_hs_num" style="width: 400px; margin-bottom: 20px" required>
					<option value="none">진료과목을 선택하세요</option>
					<c:forEach items="${hospitalList}" var="hs">
						<option value="${hs.hs_num}">${hs.hs_title}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<select name="sd_num" class="sd_num" style="width: 400px; margin-bottom: 20px" required>
					<option value="none">시/도를 선택해주세요</option>
					<c:forEach items="${sidoList}" var="sd">
						<option value="${sd.sd_num}">${sd.sd_name}</option>
					</c:forEach>
				</select>	
				<select name="sgg_num" class="sgg_num" style="width: 400px; margin-bottom: 20px" required>
					<option value="none">시/군/구를 선택해주세요</option>
				</select>	
			 	<select name="emd_num" class="emd_num" style="width: 400px; margin-bottom: 20px" required>
			         <option value="none">읍/면/동을 선택해주세요</option>
			    </select>
			</div>
		</div>
		
</div>








</body>
</html>