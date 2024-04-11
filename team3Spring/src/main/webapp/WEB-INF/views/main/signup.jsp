<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
.전체화면박스{
width: 100%;
display:flex;
}
.왼쪽여백,
.오른쪽여백{
border:1px solid black;
 width: 20%;
 height: 700px;
 }
 .signup-select{
 text-align:center;
 margin:0 auto;
 margin-right: auto;
 border: 1px solid black;
width: 100%;
height: 700px;
 }
.choice{
margin:0 auto;
border: 1px solid blue;
width: 800px;
height: 700px;

}
.aTag-btn1{
margin-right: auto;
}
.aTag-btn1,
.aTag-btn2{
    width:200px;
    background-color:#222;
    color:#fff;
}

</style>
</head>
<body>
<div class="전체화면박스">
	<div class="왼쪽여백"></div>
	<div class="signup-select">
		<div class="choice">
		<a class="aTag-btn1" href="<c:url value='/member/signup'/>">개인 회원가입</a>
		<a class="aTag-btn2" href="<c:url value='/main/certification'/>">사업자 회원가입</a>
		</div>
	</div>
	<div class="오른쪽여백"></div>
</div>	
</body>
</html>