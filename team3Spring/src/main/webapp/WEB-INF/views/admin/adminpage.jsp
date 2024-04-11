<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>병원 중개 사이트</title>
<style type="text/css">
.btn-box{
	margin: 0 auto;
}
</style>
</head>
<body>
	<h1>관리자페이지입니다</h1>
	<br><br><br><br>
	
	<a href='<c:url value="/admin/hospital"/>'>병원 관리</a>
	<h2>기은, 경호</h2>
	<h2>병원 관리</h2>
	<p>사업자 회원조회</p>
	<p>사업자 회원 승인 관리</p>
	<p>사업자 회원 정지 관리</p>
	<p>사업자 회원 탈퇴 관리</p>
	<br><br><br><br>
	
	<a href='<c:url value="/admin/member"/>'>회원 관리</a>
	<br><br><br><br>
	
	<a href='<c:url value="/community"/>'>커뮤니티 관리</a>
	<h2>민석</h2>
	<h2>커뮤니티 관리</h2>
	<p>게시판/등록/수정/삭제</p> 
	<p>게시글 조회/삭제</p>
	<p>댓글 조회/삭제</p>
	<p>신고(조회?)</p>
</body>
</html>