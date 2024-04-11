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
border: 1px solid black;
width: 100%;
height: 150px;
}

</style>
</head>
<body>

<div class="header-box navbar navbar-expand-sm bg-dark navbar-dark">
	<h1><a class="nav-link" href="<c:url value='/'/>">병원 중개</a></h1>
	<ul class="navbar-nav">
		<c:if test="${user == null }">	
			<li class="nav-item">
				<a class="nav-link" href="<c:url value='/main/login'/>">로그인</a>
			</li>
			<li>
				<a class="nav-link" href="<c:url value='/main/signup'/>">회원가입</a>
			</li>
		</c:if>
		<c:if test="${user != null}">
			<li class="nav-item">
				<a class="nav-link" href='<c:url value="/logout"/>'>로그아웃</a>
			</li>
		</c:if>
			<li class="nav-item">
					<a class="nav-link" href='<c:url value="/adimn/adminpage"/>'>관리자 페이지</a>
			</li>
	</ul>
	
</div>

</body>
</html>