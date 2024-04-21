<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 리스트</title>
<style type="text/css">
.aTag-btn1{
margin-right: auto;
} 
.aTag-btn2{
margin-left: auto;
} 
.aTag-btn1,
.aTag-btn2{
    display: inline-block;
    width: 300px;
    height: 200px;
    color: black;
    text-decoration:none;
    text-align: center;
    text-decoration: none;
    box-shadow: 1px 1px 2px 1px #C12DFF;
}
.aTag-btn1:hover,
.aTag-btn2:hover{
text-decoration:none;
  box-shadow: 2px 2px 4px 1px #C12DFF; /* 그림자 효과 추가 */

	
}
.hospital-like-list h1,.hospital-area-list h1{
margin: 30px auto 50px auto;
}



.hospital-list-home{width: 1903px;height: 1500px;}
.hospital-list-box{width: 1400px;height: 100%;margin: 0 auto;text-align: center;
.hospital-like-list{width: 100%;height: 450px;border: 1px solid green;margin-bottom: 50px;}
.hospital-area-list{
width: 100%;height: 850px;border: 1px solid pink;}
</style>
</head>
<body>
<div class="hospital-list-home">
	<div class="hospital-list-box">
		<div class="hospital-like-list">
			<h1>내 관심 병원</h1>
			<a class="aTag-btn1" href="<c:url value='/member/signup'/>">개인 회원가입</a>
				<a class="aTag-btn1" href="<c:url value='/member/signup'/>">개인 회원가입</a>
				<a class="aTag-btn1" href="<c:url value='/member/signup'/>">개인 회원가입</a>
				<a class="aTag-btn1" href="<c:url value='/member/signup'/>">개인 회원가입</a>
				<div class="pagination-box">
					<!-- 페이지네이션 시작 -->
					123
					<!-- 페이지네이션 끝 -->
				</div>
		</div>
		<div class="hospital-area-list">
		<!-- 포이치 쓰기 -->
			<h1>우리 동네 병원</h1>
			<c:forEach items="${sidoList}" var="sd">
				<a class="aTag-btn1" href="<c:url value='#'/>">개인 회원가입</a>
			</c:forEach>	
				<div class="pagination-box">
					<!-- 페이지네이션 시작 -->
					123
					<!-- 페이지네이션 끝 -->
				</div>
		</div>
		
	</div>
</div>



</body>
</html>