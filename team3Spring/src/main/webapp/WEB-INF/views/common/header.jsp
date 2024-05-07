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
 .search-box {
  margin: 0 auto;
   position: relative;
   overflow: hidden;
    width: 800px; 
}

.search-input {
  margin-top: 100px;
     outline: none;
     font-size: 16px;
     padding: 8px;
     width: 100%; 
     position: relative; 
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
.로고 {
	display:flex;
	width: 65%;
}
.home-log{
margin-right: auto;
}

.메뉴얼 {
width:700px;
display:flex;
font-size: 16px;
font-weight: bold;

}
.메뉴얼 a:hover{
 text-decoration: none;
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
.메뉴얼 ul {
    list-style-type: none; 
    padding: 0; 
    display: flex; 
    justify-content: center; 
}

.메뉴얼 li {
	white-space:nowrap;
    margin: 15px 10px; 
}

.메뉴얼 a {
	height:100%;
	color:black;
	margin:20px;
	line-height: 53px;
    text-decoration: none; 
    padding: 10px; 
}

.join-groub ul{
	position:relative;
	margin:-50px;
    list-style-type: none; 
    padding: 0; 
    display: flex; 
    justify-content: center; 
}
.join-groub li{
	white-space:nowrap;
    margin: 15px 10px; 
}
.join-groub a{
	margin:20px;
	line-height: 53px;
    text-decoration: none; 
    padding: 10px; 
}
.join-groub li:hover{
	border-bottom:3px solid green;
	height: 94px;
}
.메뉴얼 li:hover{
	border-bottom:3px solid green;
	height: 65px;
}
.join-groub li:hover{
	border-bottom:3px solid green;
	height: 94px;
}
.메뉴얼 li:hover{
	border-bottom:3px solid green;
	height: 65px;
}
body {
	font-size: 14px;
	font-weight: 300;
	letter-spacing: -0.075em;
}
 .category-sub{
z-index:9;position:absolute;line-height:50px;
height:50px;width:100%;background-color: #fafafa;

}
.category-board{
z-index:9;position:absolute;line-height:50px;
height:50px;width:100%;background-color: #fafafa;

}
 

 
</style>
</head>
<body>
<div class="home-box">
	<div class="header-box">
		<div class="공백"></div>
		<div class="로고">
			<a class="nav-link home-log" href="<c:url value='/'/>">
				<img alt="로고이미지"  class="Logo-img"
				src="<c:url value='/resources/img/Hospital.png'/>">
			</a>
			<div class="메뉴얼">
				<ul>
					<li>
						<a href="<c:url value="/hospital/list?hs_num=0"/>" class="hos-btn">병원</a> 
					</li>
					<li>
						<a href="<c:url value="/board/all"/>" class="board_btn">커뮤니티</a> 
					</li>
					<li>
						<a href="#">게시판1</a> 
					</li>
					<li>
						<a href="#">공지사항</a>
					</li>
					<li>
						<a href="<c:url value="/member/bookmark"/>">북마크</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="긴공백"></div>
		<div class="로그인">
			<div class="join-groub">
				<ul>
					<c:if test="${user == null }">	
						<li>
							<a class="nav-link" href="<c:url value='/main/login'/>">
							<img alt="로고이미지" style="width: 30px;"
							src="<c:url value='/resources/img/user-white.svg'/>"> 로그인</a>
						</li>
						<li>	
							<a class="nav-link" href="<c:url value='/main/signup'/>">회원가입</a>
						</li>	
					</c:if>
					<c:if test="${user != null}">
						<li>
							<a class="nav-link" href='<c:url value="/logout"/>'>로그아웃</a>
						</li>	
					</c:if>
					<%--<c:if test='${user.getSite_authority().equals("admin") and user != null}'> --%>
						<li>
							<a class="nav-link" href='<c:url value="/admin/adminpage"/>'>관리자 페이지</a>
						</li>		
					<%-- </c:if> --%>
						<li>				
							<a class="nav-link" href='<c:url value="/member/mypage"/>'>마이페이지</a>
						</li>		
						<li>
							<a class="nav-link" href='<c:url value="/hospital/mypage"/>'>병원페이지</a>
						</li>		
				</ul>			
			</div>
		</div>
		<div class="공백"></div>
	</div>
</div>
	 
 <script>
     $('.hos-btn').hover(function() {
         $('.category-sub').show();
         $('.header-box').addClass('hovered');
         $('.category-board').hide();
     });
     $('.category-sub').mouseleave(function() {
    	 $('.category-sub').hide();
    	 $('.header-box').removeClass('hovered');
     });
     $('.board_btn').hover(function() {
    	 $('.category-sub').hide();
    	  $('.header-box').addClass('hovered');
         $('.category-board').show();
     });
     $('.category-board').mouseleave(function() {
    	 $('.category-board').hide();
     });
 
</script>
</body>
</html>