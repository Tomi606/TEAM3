<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 회원 관리 - 메인</title>
<style type="text/css">
.report-box{
	width: 30%;
	height: 300px;
	border: 1px solid gray;
	border-radius: 20px;
	padding: 10px;
	margin: auto;
	text-align: center;
}

.page-group {
	text-align:center;
    list-style: none;
    padding: 0;
    margin: 0 auto;
}

.page-design {
    display: inline-block;
    margin-right: 5px; 
    border-radius: 3px; 
}

.page-design a {
    color: black;
    text-decoration: none; 
}
</style>
</head>
<body>
<h1 style="text-align: center;">관리자 페이지 - 회원 관리(선진)</h1>
<div class="report-box">	
	<a href="report">신고 회원 조회</a>
</div>
<hr style="border: 3px solid black;">
<div class="all-box container mt-3">
	<h2 style="text-align: center;">전체 회원 조회</h2>
	<table class="table table-hover mt-3" style="text-align: center;">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>직업</th>
				<th>휴대폰</th>
				<th>이메일</th>
				<th>주소</th>
				<th>관심 건강분야</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="me">			
				<tr>
					<td>${me.me_id}</td>
					<td>${me.me_name}</td>
					<td>${me.me_gender}</td>
					<td>${me.me_job}</td>
					<td>${me.me_phone}</td>
					<td>${me.me_email}</td>
					<td>${me.me_address}</td>
					<td>${me.hospitalSubject.hs_title}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="page-group">
	    <c:if test="${pm.prev}">
	        <li class="page-prev page-design">
	            <c:url var="url" value="/admin/member/main">
	                <c:param name="page" value="${pm.startPage - 1}"/>
	            </c:url>
	            <a class="page-link" href="${url}">이전</a>
	        </li>
	    </c:if>
	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
	        <c:set var="active" value="${pm.cri.page == i ? 'active' : ''}" />
	        <li class="page-now page-design ${active}">
	            <c:url var="url" value="/admin/member/main">
	                <c:param name="page" value="${i}"/>
	            </c:url>
	            <a class="page-link" href="${url }">${i}</a>
	        </li>
	    </c:forEach>
	    <c:if test="${pm.next}">
	        <li class="page-next page-design">
	            <c:url var="url" value="/admin/member/main">
	                <c:param name="page" value="${pm.endPage + 1}"/>
	            </c:url>
	            <a class="page-link" href="${url}">다음</a>
	        </li>
	    </c:if>
	</ul>
</div>
</body>
</html>