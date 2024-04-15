<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>병원 중개 사이트</title>
<style type="text/css">
.전체화면박스{
padding-top:50px;
width: 100%;
display:flex;
}
.왼쪽여백,
.오른쪽여백{
 width: 20%;
 height: 700px;
 }
 .signup-select{
 text-align:center;
 margin:0 auto;
 margin-right: auto;
width: 100%;
height: 700px;
 }
.choice{

display:flex;
margin:0 auto;
width: 1000px;
height: 700px;

}
.aTag-btn1{
margin-right: auto;
} 
.aTag-btn2{
margin-left: auto;
} 
.aTag-btn1,
.aTag-btn2{
	
	margin-top:100px;
    display: inline-block;
    width: 300px;
    height: 400px;
    color: black;
    text-decoration:none;
    text-align: center;
    line-height: 350px;
    text-decoration: none;
    box-shadow: 1px 1px 2px 1px #C12DFF;
}
.aTag-btn1:hover,
.aTag-btn2:hover{
text-decoration:none;
  box-shadow: 2px 2px 4px 1px #C12DFF; /* 그림자 효과 추가 */

	
}
.btn-box{
	margin: 0 auto;
}
</style>
</head>
<body>

<div class="전체화면박스">
	<div class="왼쪽여백"></div>
	<div class="signup-select" >
		<h1>관리 목록</h1>
		<div class="choice">
			<a class="aTag-btn1" href="<c:url value='/admin/hospital'/>">회원 관리</a>
			<a class="aTag-btn1" style="margin-left: 26px;" href="<c:url value='/admin/member/main'/>">병원 관리</a>
			<a class="aTag-btn2" href="<c:url value='/community'/>">커뮤니티 관리</a>
		<!-- /main/certification 사업자 회원가입 데이터 저장 후 다시 바꿔넣기 -->
		</div>
	</div>
	<div class="오른쪽여백"></div>
</div>
	

</body>
</html>