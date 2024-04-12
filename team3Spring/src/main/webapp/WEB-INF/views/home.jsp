<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>병원 중개 사이트</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
body {
	font-family: "Noto Sans KR", "Nanum Gothic", arial, Dotum, 돋움;
	font-size: 14px;
	font-weight: 300;
	letter-spacing: -0.075em;
}

.home-box {
	width: 100%;
	height: 1000px;
	text-align: center;
	background: url('<c:url value="/resources/img/doctor.jpg"/>');
	background-repeat: no-repeat;
	background-size: cover;
	z-index: 9999;
}

.search-box {
position: relative;
	margin: 0 auto;
}

.search {
	margin-top: 200px;
}

.header-box {
	width: 100%;
	height: 100px;
	display: flex;
	background-color: rgba(0, 0, 0, 0);
}

.header-box:hover {
	background-color: white;
}

.header-box {
	border-bottom: 1px solid #c8c8c8;
	width: 100%;
	height: 80px;
	display: flex;
	background-color: rgba(0, 0, 0, 0);
}

.공백 {
	width: 10%;
}

.로고 {
	width: 25%;
}

.메뉴얼 {
	padding: 35px 0 5px;
	margin: 0 auto;
	width: 40%;
}

.메뉴얼>a {
	color: black;
	text-decoration: none;
	margin: 30px;
}

.긴공백 {
	width: 10%;
}

.로그인 {
	padding: 20px 0 5px;
	margin: 0 auto;
	width: 35%;
}

.로그인 a {
	color: black;
	text-decoration: none;
}

.join-groub {
	display: flex;
}

.Logo-img {
	width: 170px;
	height: 80px;
}

.header-box a {
	color: white;
}

.header-box:hover a {
	color: black;
}

.header-box img {
	filter: invert(100%);
}

.header-box:hover img {
	filter: none;
}

.footer-group {
	position: relative;
    border: 1px solid #a0a0a0;
    background-color: #a0a0a0;
    height: 500px;
    margin-bottom: auto;
}

.홈 {
	width: 100%;
	height: 100%;
	display: flex;
}

.홈왼쪽, .홈오른쪽 {
	display: flex;
	border: 1px solid white;
	width: 300px;
	height: 100%;

	background-color: white;
}

.홈왼쪽 {
	margin-right: auto;
}

.홈오른쪽 {
	margin-left: auto;
}

.여기부터내용 {
	padding: 100px 0 80px;
}

.롤링 {
	width: 1000px;
	height: 90px;
	border: 1px solid black;
	overflow: hidden;
	position: relative;
}

.롤링-내용 {
	display: flex;
	transition: transform 0.5s ease;
}

.롤링-내용 h1 {
	flex: 0 0 1000px;
	text-align: center;
	line-height: 90px;
	margin: 0;
}

.hot-new {
	text-align: center;
	padding: 60px 0 20px
}

/*hot group*/
.hot-group {
	border: 1px solid white;
	display: flex;
	margin: 0 auto;
	width: 100%;
	height: 100%;
}

/*검색창 시작*/
.search-main-left, .search-main-right {
	display: flex;
	width: 300px;
	height: 100%;
}

.search-main-left {
	margin-right: auto;
}

.search-main-right {
	margin-left: auto; 
}

.hot-group {
	display: flex;
	justify-content: center; 
}

.hot-group a {
	display: inline-block;
	width: 300px;
	height: 300px;
	background-color: white;
	border: 2px solid black;
	text-align: center;
	line-height: 50px;
	margin: 15px;
	text-decoration: none;
	color: black;
}

.btnbtnbtn {
	padding-top: 70px;
}

.btnbtnbtn a {
	display: inline-block;
	width: 113px;
	height: 113px;
	position: relative;
	background-color: white;
	text-align: center;
	border-radius: 10px;
	line-height: 20px;
	margin: 30px;
	text-decoration: none;
	color: black;
}

.main-area {
	display: flex;
	width: 100%;
	height: 100%;
	margin: 0 auto;
	text-align: center;
}

.btnbtnbtn a span {
	position: absolute;
	bottom: 10px;
	left: 50%;
	transform: translateX(-50%);
	font-size: 13px;
	font-weight: bold;
}

.search {
	width: 1000px;
	height: 56px;
	line-height: 56px;
	background: rgba(255, 255, 255, .9);
	font-size: 20px;
	font-weight: 300;
	color: #333;
	padding: 0 68px 0 10px;
	border-radius: 5px;
}

.search-btn {
	width: 50px;
	height: 40px;
	position: absolute;
	bottom: 8px;
	right: -14px; 
	transform : translateX( -50%);
	font-size: 0;
	transition: all 0.3s;
	transform: translateX(-50%);
}

.search-btn .search-btn {
	width: 20px;
	height: auto;
}

.btnbtnbtn img {
	margin-top: 15px;
	width: 60px;
	height: 60px;
}

a {
	text-decoration: inherit;
	color: inherit;
}
</style>
</head>
<body>
	<div class="home-box">
		<div class="header-box">
			<div class="공백"></div>
			<div class="로고">
				<a class="nav-link" href="<c:url value='/'/>"> <img alt="로고이미지"
					style="width: 170px; height: 80px;" class="Logo-img"
					src="<c:url value='/resources/img/Hospital.png'/>">
				</a>
			</div>
			<div class="메뉴얼">
				<a href="#">게시판1</a> <a href="#">게시판1</a> <a href="#">게시판1</a> <a
					href="#">게시판1</a>
			</div>
			<div class="긴공백"></div>
			<div class="로그인">
				<div class="join-groub">
					<c:if test="${user == null }">
						<div class="nav-item">
							<a class="nav-link a" href="<c:url value='/main/login'/>"> <img
								alt="로고이미지" style="width: 30px;"
								src="<c:url value='/resources/img/user-white.svg'/>"> 로그인
							</a>
						</div>
						<div style="line-height: 28px;">
							<a class="nav-link a" href="<c:url value='/main/signup'/>">회원가입</a>
						</div>
					</c:if>
					<c:if test="${user != null}">
						<div class="nav-item" style="line-height: 28px;">
							<a class="nav-link" href='<c:url value="/logout"/>'>로그아웃</a>
						</div>
					</c:if>
					<div class="nav-item" style="line-height: 28px;">
						<a class="nav-link" href='<c:url value="/admin/adminpage"/>'>관리자
							페이지</a>
					</div>
				</div>
			</div>
			<div class="공백"></div>
		</div>
		<div class="main-area">
			<div class="search-main-left"></div>
			<div class="main-search-area">
				<div class="search-box">
					<input type="search" class="search"> <input type="image"
						value="" class="search-btn"
						src="<c:url value='/resources/img/search.png'/>">
				</div>
				<div class="btnbtnbtn">
					<a href="#"> <img alt="로고이미지"
						src="<c:url value='/resources/img/hpbuild.png'/>"> <span>병원</span>
					</a> <a href="#"> <img alt="로고이미지"
						src="<c:url value='/resources/img/comment.png'/>"> <span>커뮤니티</span>
					</a> <a href="#"> <img alt="로고이미지"
						src="<c:url value='/resources/img/hpbuild.png'/>">
					</a> <a href="#"> <img alt="로고이미지"
						src="<c:url value='/resources/img/hpbuild.png'/>">
					</a> <a href="#"> <img alt="로고이미지"
						src="<c:url value='/resources/img/bookmark.png'/>"> <span>북마크</span>
					</a>

				</div>
			</div>
			<div class="search-main-right"></div>
		</div>
	</div>
	<div class="홈">
		<div class="홈왼쪽"></div>
		<div class="여기부터내용">
			<div class="롤링">
				<div class="롤링-내용">
					<h1 style="background-color: orange;">첫 번째 내용</h1>
					<h1 style="background-color: green;">두 번째 내용</h1>
					<h1 style="background-color: yellow;">세 번째 내용</h1>
				</div>
			</div>
			<div class="hot-new">
				<h3>Hot & New</h3>
				<p style="color: gray;">새롭고 재밌는 소식들을 여기서!</p>
			</div>
			<div class="hot-group">
				<a href="#"></a> 
				<a href="#"></a> 
				<a href="#"></a> 
			</div>
		</div>
		<div class="홈오른쪽"></div>
	</div>

</body>
<footer>
	<div class="footer-group">
		<div class="footer">
			<h1>푸터푸터푸터푸터푸터푸터푸터푸터푸터푸터</h1>
		</div>
	</div>
</footer>
<script type="text/javascript">
	$(document).ready(function() {
		var interval = setInterval(roll, 3000); // n초마다 롤링

		function roll() {
			var container = $('.롤링');
			var firstItem = container.find('.롤링-내용 h1:first');
			var itemWidth = firstItem.outerWidth(); // 롤링되는 각 내용의 너비

			container.find('.롤링-내용').animate({
				marginLeft : -itemWidth
			}, 500, function() {
				$(this).append(firstItem.remove()).css({
					marginLeft : 0
				});
			});
		}
	});
</script>
</html>