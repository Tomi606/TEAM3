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
width: 800px;
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
}
.aTag-btn1:hover,
.aTag-btn2:hover{
text-decoration:none;
box-shadow: 1px 1px 1px 1px #C12DFF;

	
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