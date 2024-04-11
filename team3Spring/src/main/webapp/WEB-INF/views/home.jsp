<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>병원 중개 사이트</title>
<style type="text/css">
.home-box{
width: 100%;height: 500px;
text-align: center;
background: url('<c:url value="/resources/img/elnas.jpg"/>');
z-index: 9999;
}
.search-box{
margin:0 auto;
}
.search{
margin-top: 200px;
}
.header-box{
width: 100%;
height: 100px;
display: flex;
background-color:rgba(0,0,0,0);
}
.header-box:hover {
	background-color: white;
}

</style>
</head>
<body>
<div class="home-box">
	<div class="header-box">
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
	<div class="search-box">
		<input type="search" class="search">
		<button>검색</button>
	</div>
</div>
</body>
</html>