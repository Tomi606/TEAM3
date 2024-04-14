<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<style type="text/css">
.header-box{
border-bottom: 1px solid #c8c8c8;
width: 100%;
height: 80px;
display: flex;
background-color:rgba(0,0,0,0);
}

.공백{
 width: 10%;
}
.로고{
width: 25%;

}
.메뉴얼{
padding:35px 0 5px;
margin:0 auto;
width: 40%;
}
.메뉴얼>a{
color:black;
text-decoration:none;
margin: 30px;
font-size: 18px;
}
.긴공백{
width: 10%;
}
.로그인{
padding:20px 0 5px;
margin:0 auto;
width: 35%;
}
.로그인 a{
color: black;
text-decoration: none;
}
.join-groub{
display: flex;
}
.Logo-img{
width: 170px;height: 80px;
}
</style>
</head>
<body>
<div class="header-box">
	<div class="공백"></div>
	<div class="로고">
		<a class="nav-link" href="<c:url value='/'/>">
			<img alt="로고이미지"  class="Logo-img"
			src="<c:url value='/resources/img/Hospital.png'/>">
		</a>
	</div>
	<div class="메뉴얼">
			<a href="#">게시판1</a>
			<a href="#">게시판1</a>
			<a href="#">게시판1</a>
			<a href="#">게시판1</a>
	</div>
	<div class="긴공백"></div>
	<div class="로그인">
		<div class="join-groub">
			<c:if test="${user == null }">	
				<div class="nav-item">
					<a class="nav-link" href="<c:url value='/main/login'/>">
					<img alt="로고이미지" style="width: 30px;"
			src="<c:url value='/resources/img/user-white.svg'/>"> 로그인</a>
				</div>
				<div>
					<a class="nav-link" href="<c:url value='/main/signup'/>">회원가입</a>
				</div>
			</c:if>
			<c:if test="${user != null}">
				<div class="nav-item">
					<a class="nav-link" href='<c:url value="/logout"/>'>로그아웃</a>
				</div>
			</c:if>
				<div class="nav-item">
						<a class="nav-link" href='<c:url value="/admin/adminpage"/>'>관리자 페이지</a>
				</div>
		</div>
	</div>
	<div class="공백"></div>
</div>
</body>
</html>