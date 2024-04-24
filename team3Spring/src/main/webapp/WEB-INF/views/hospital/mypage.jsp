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
 /*아래부터 병원 마이페이지 구현
 패딩,마진은 상 우 하 좌 시계 방향으로 설정 하면 됨.
 */
 .mypage-container{width: 1905px;height:800px;padding: 0 300px 0 300px;border: 1px solid black;display: flex;}
 .mypage-profile{width: 400px;height: 100%;border: 1px solid black;}
 .profile-img{width: 250px;height: 250px;border:1px solid black;margin: 0 auto;margin-top: 50px;border-radius:100%;  }
 .profile-name{margin: 0 auto;text-align: center;}
 .profile-anything{border: 1px solid black;width: 300px;height: 400px;margin: 0 auto;}
 
 .profile-container{width: 1000px;height: 800px;border: 1px solid black; display: block;background-color: lightgray;}
 .mypage-profile-info{	padding:0 50px;
	width: 800px;
	height: 777px;
	border: 1px solid black;
	margin: 11px 20px 40px 120px;
	background-color: white;
	border-radius: 30px; }
 .mypage-profile-detail{width: 600px;height:325px;border: 1px solid black; margin: 0px 20px 80px 250px;background-color: pink;border-radius:30px; }
.profile-img-name-container {
	width: 100%;
	height: 150px;
	display: flex;
}
.mypage-img-name {
	align-content: space-around;
	flex-direction: column;
	flex-wrap: wrap;
	display: flex;
	width:1000px;
	margin: 30px auto;
	height: 125px;
	padding: 20px;
}
.hr {width: 100%;border: 1px solid green;}
 .mypage-img{display:flex;width: 125px;height: 125px;border:1px solid white;margin: 30px 0 0 30px;border-radius:100%;background-color: white;}
 
 .mypage-phone {
	margin:auto 0;
	height:70px;
	width: 100%;
	display: flex;
}

.mypage-email {
	height:70px;
	width: 100%;
	display: flex;
}

.mypage-hospital-name {
	display: flex;
	margin: 40px 48px 0 47px;
}
 .mypage-hospital-num{display:flex;margin: 20px 48px 0 47px;}
 .mypage-hospital-address{display:flex;margin: 20px 48px 0 47px;}
 
 
 
 
 
 
 
 
 
  .anything-box{
 	margin-top:50px;
 }
.choose-box{
	padding:15px;
	text-align:center;
	display:flex;
	width: 100%;height: 75px;
 	flex-direction: column;
}
.choose-box a{
	border-radius:5px;
	line-height:45px;
	margin:0 auto;
	border:1px solid black;
	width:90%;height:50px;
	color:black;
	text-decoration:none;
}
.subject{
width: 100%; 
height: 70px;

}
.phone-width{
width: 80%;
margin:auto;
display: flex;
justify-content: space-between;
}
.email-width{
width: 80%;
margin:auto;
display: flex;
justify-content: space-between;
}
.job-width{
width: 80%;
margin:auto;
display: flex;
justify-content: space-between;
}
.subject-width{
width: 80%;
margin: 20px auto;
display: flex;
justify-content: space-between;
}
.address-width{
width: 93%;
margin:auto;
display: flex;
justify-content: space-between;
}
select {
    width: 300px;
    padding: 8px; 
    font-size: 16px;
    border: 1px solid #ccc;
    appearance: none;  
    background-color: #fff;
    background-image: linear-gradient(to bottom, #f9f9f9, #e9e9e9);  
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); 
    cursor: pointer;  
}

select:hover {
    border-color: #999; 
}

select:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); 
}
 
</style>
</head>
<body>
<div class="mypage-container">
	<div class="mypage-profile">
			<div class="profile-img">
			</div>
			<div class="profile-name">
				<!-- 화면에서 아이디랑 이메일 가져와서 입력하시면 됩니다 -->
				<h4>${huser.ho_id}</h4>
				<p>${huser.ho_email}</p>
			</div>
			<div class="profile-anything">
				<div class="choose-box">			
					<a href='<c:url value="/hospital/detail/detail?hdNum=1"/>'>병원 상세 페이지 조회</a>
				</div>
				<div class="choose-box">
					<a href='<c:url value="/hospital/detail/insert"/>'>2. 병원 상세 페이지 등록/수정</a>
				</div>
				<div class="choose-box">			
					<a href='<c:url value="/hospital/item/insert"/>'>3. 프로그램 등록/수정/삭제</a>
				</div>
					<div class="choose-box">
					<a>4. 예약 관리</a>
				</div>
				<div class="choose-box">			
					<a>6. 커뮤니티 관리</a>
				</div>
			</div>
	</div>
	<div class="profile-container">
		<div class="mypage-profile-info">
		<div class="profile-img-name-container">
			
			<div class="mypage-img-name">
				<h4 style="display: flex;">${huser.ho_ceo}</h4>
				<p style="margin-right: auto;">${huser.ho_email}</p>
				<span ><a href="#">실명수정</a></span>
				<span ><a href="#">비밀번호 변경</a></span>
			</div>
		</div>
			<div class="hr"></div>
			<div class="mypage-phone">
				<p style="margin-right: auto">${huser.ho_phone}</p>
				<span><a href="#">변경</a></span>
			</div>
			<div class="hr"></div>
			<div class="mypage-email">
				<p style="margin-right: auto">${huser.ho_email}</p>
				<span><a href="#">변경</a></span>
			</div>
		
		</div>
		<div class="mypage-profile-detail">
				<div class="mypage-hospital-name" >
					<h5 style="margin-right: auto">${huser.ho_name}</h5>
					<span><a href="#">변경</a></span>
				</div>
				<div class="hr"></div>
				<div class="mypage-hospital-num">
					<h5>사업자번호 : </h5><span>${huser.ho_num}</span>
				</div>
				<div class="hr"></div>
				<div class="mypage-hospital-address">
					<p style="margin-right: auto">${huser.ho_address}</p>
					<span><a href="#">변경</a></span>
				</div>
			</div>
 		</div>
</div>
</body>
</html>