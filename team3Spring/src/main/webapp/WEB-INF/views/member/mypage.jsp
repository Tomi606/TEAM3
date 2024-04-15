<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style type="text/css">
.body-tag{
padding:200px 0 200px;
width: 100%;
display: felex;flex-direction: column;
align-items: center;
}
.input-box{
	border:1px solid white;
	width: 100%;height:100%; 
	margin: 0 auto;
	padding: 5px;
}
.input-tag{
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
.btn{
	text-decoration: none;
	border:1px solid  #C12DFF;
	width: 100px;
}
.btn:hover {
	background-color:  #C12DFF;
	color: white;
}
.signup-btn{
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
img{
 width: 30px;
}
.duplicate{
    float:right;
	border-radius:0;
	height: 43px;
}
label {
	margin-left: 30px;
}
.gender-buttons {
     display: inline-block;
     margin-right: 15px;
 }
 
 .gender-buttons label {
 	width:100px;text-align:center;
 	border:1px solid  #007bff;
     display: inline-block;
     padding: 8px 16px;
     border-radius: 5px;
     cursor: pointer;
 }
 
 #male:checked + label {
     background-color: #007bff;
     color: #fff;
 }
 
 #female:checked + label {
     background-color: #ff69b4;
     color: #fff;
 }
 
 .gender-buttons input[type="radio"] {
     display: none;
 }
 
 .program{
width: 500px;height: 300px;border: 1px solid black;

}
 
 .mem_my_page_inner{width: 100%; display:flex; flex-wrap: wrap;}
 .program_check_wrap{display: grid; grid-template-columns: 1fr 1fr; grid-gap: 20px;}

</style>
</head>
<body>
<h1>마이페이지입니다.</h1>

<div class="input-box">
	<div class="mem_my_page_inner">
			<div class="mem_my_page_input_wrap">
			<div>
				<img  alt="아이디이미지" src="<c:url value="/resources/img/user.svg"/>">
			    <input  type="text" id="id" name="site_id" class="input-tag" readonly="readonly">
			    <label class="text-danger textId" id="laId"></label>
			  <!--<a type="button" class="check-duplicate btn duplicate">중복 확인</a> -->
			</div>
			<div>
		    	<input type="hidden" id="id2" name="me_id">
			</div>
			<div>
				<img alt="아이디이미지" src="<c:url value="/resources/img/password.svg"/>">
		    	<input   type="password" id="pw" name="me_pw"  readonly="readonly" class="input-tag">
		    	<label for="me_pw" class="text-danger"></label>
			</div>
			<div>
				<img alt="아이디이미지" src="<c:url value="/resources/img/passwordcheck.svg"/>">
		   	 	<input   type="password" id="pw2" name="me_pw2"  readonly="readonly" class="input-tag">
		   	 	<label for="me_pw2" class="text-danger"></label>
			</div>
			<div>
				<img alt="아이디이미지" src="<c:url value="/resources/img/name.svg"/>">
		    	<input   type="text" id="name" name="me_name"  readonly="readonly" class="input-tag">
		    	<label for="me_name" class="text-danger"></label>
			</div>
			<!-- 이메일  -->
			<div>
				<img alt="아이디이미지" src="<c:url value="/resources/img/mail.svg"/>">
		    	<input  type="text" id="email" name="site_email"  readonly="readonly" class="input-tag">
		    	<!-- <a type="button" class="email-btn btn duplicate">중복확인</a> -->
		    	<label for="me_email" class="text-danger etext"></label>
			</div>
			<div>
		    	<input type="hidden" id="email2" name="me_email">
			</div>
			<div class="gender-buttons">
				<img alt="아이디이미지" src="<c:url value="/resources/img/gender.svg"/>">
		   		 <input type="radio" id="male" name="me_gender" value="남자" readonly="readonly">
		   		 <label for="male">남자</label>
			</div>
	
			<div class="gender-buttons">
			    <input type="radio" id="female" name="me_gender" value="여자" readonly="readonly">
			    <label for="female"style="border:1px solid #ff69b4;">여자</label>
			</div>
			<div style="margin-top: 15px;">
				<img alt="아이디이미지" src="<c:url value="/resources/img/job.svg"/>">
		   	 	<input   type="text" id="job" name="me_job" readonly="readonly" class="input-tag">
		    	<label for="me_job" class="text-danger"></label>
			</div>
			<div>
				<img alt="아이디이미지" src="<c:url value="/resources/img/phone.svg"/>">
		    	<input   type="text" id="phone" name="site_phone" readonly="readonly" class="input-tag">
		    	<label for="me_phone" class="text-danger textPhone" id="idcheck-phone"></label>
			</div>
			<!-- 핸드폰  -->
			<div>
		    	<input type="hidden" id="phone2" name="me_phone">
			</div>
			<div class="program_check_wrap">
				<div class="program">
				1
					<a href="#">예약관리</a>
				</div>
				<div class="program">
				2
					<a href="#">커뮤니티 관리</a>
				</div>
				<div class="program">
				3
				 	<a href="#">북마크</a>
				</div>
				<div class="program">
				
				</div>
			</div>
		</div>
			<div class="subject">
			<div class="hr" style="margin-top:30px;margin-bottom:40px;border: 1px solid #d2d2d2;width: 100%;"></div>
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
	</div>


</body>
</html>