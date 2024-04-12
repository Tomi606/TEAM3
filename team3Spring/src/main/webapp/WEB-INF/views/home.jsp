<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>병원 중개 사이트</title>
<style type="text/css">
body {
    font-family: "Noto Sans KR", "Nanum Gothic", arial, Dotum, 돋움;
    font-size: 14px;
    font-weight: 300;
    letter-spacing: -0.075em;
}

.home-box{
width: 100%;height: 1000px;
text-align: center;
background: url('<c:url value="/resources/img/backgroundimg.jpg"/>');
background-repeat: no-repeat;
 background-size: cover;
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
padding:32px 0 5px;
margin:0 auto;
width: 30%;
}
.메뉴얼>a{
color:black;
text-decoration:none;
margin-right: 30px;
}
.긴공백{
width: 20%;
}
.로그인{
padding:20px 0 5px;
margin:0 auto;
width: 25%;
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
.header-box a{
color: white;
}
.header-box:hover{
color: black;
}
.header-box:hover a {
    color: black;
}
.header-box img {filter: invert(100%);}
.header-box:hover img {filter:none;}
.footer-group{border: 1px solid #a0a0a0;background-color:#a0a0a0; height: 300px;margin-bottom: auto;}
.홈 {width: 100%;height: 100%;display: flex;}
.홈왼쪽, .홈오른쪽 {display: flex;border: 1px solid black;width: 300px;height: 1000px;background-color:silver; }
.홈왼쪽 {margin-right: auto;}
.홈오른쪽 {margin-left: auto;}
.여기부터내용{padding:60px 0 80px;}
.롤링{width:1000px;height: 90px;border: 1px solid black;background-color: green;}
.hot-new{
	text-align: center;padding:60px 0 20px

}

<!-- -->
.hot-group{
border:1px solid black;
display:flex;
margin:0 auto;
width: 1150px;
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













</style>
</head>
<body>
<div class="home-box">
	<div class="header-box">
	<div class="공백"></div>
	<div class="로고">
		<a class="nav-link" href="<c:url value='/'/>">
			<img alt="로고이미지" style="width: 170px;height: 80px;" class="Logo-img"
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
					<a class="nav-link a" href="<c:url value='/main/login'/>">
					<img alt="로고이미지" style="width: 30px;" 
			src="<c:url value='/resources/img/user-white.svg'/>"> 로그인</a>
				</div>
				<div>
					<a class="nav-link a" href="<c:url value='/main/signup'/>">회원가입</a>
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
	<div class="search-box">
		<input type="search" class="search">
		<button>검색</button>
	</div>
</div>
<div class="홈">
	<div class="홈왼쪽">왼쪽 여백입니다.</div>
		<div class="여기부터내용">
			<div class="롤링">
				<h1 style="text-align: center;">홈화면</h1>
			</div>
			<div class="hot-new">
				<h3>Hot & New</h3>
				<p style="color: gray;">새롭고 재밌는 소식들을 여기서!</p>
			</div>
			<div class="hot-group">
				<a></a>
				<a></a>
				<a></a>
			</div>
		</div>	
	<div class="홈오른쪽">오른쪽 여백입니다</div>
</div>
 
</body>
<footer>
<div class="footer-group"  >
  <div class="footer">
  <h1>푸터푸터푸터푸터푸터푸터푸터푸터푸터푸터</h1>
  </div>
</div>
</footer>
</html>