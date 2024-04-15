<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 회원 조회</title>
<style type="text/css">
.wait-report-box{
	padding: 50px;
	text-align: center;
}
.waiting-box{
	width: 30%;
	height: 300px;
	border: 1px solid gray;
	border-radius: 20px;
	display: inline-block;
	margin-right: 50px;
	padding: 10px;
}
.report-box{
	width: 30%;
	height: 300px;
	border: 1px solid gray;
	border-radius: 20px;
	display: inline-block;
	padding: 10px;
}
.all-box{

}
tr th,
tr td{
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

<!-- 가입대기 + 신고 박스 -->
<div class="wait-report-box">
	<!-- 가입 대기 병원 조회 박스 -->
	<div class="waiting-box">
		<a href="<c:url value="/admin/waitlist"/>">대기 병원 조회</a>
		
	</div>
	
	<!-- 신고받은 병원 조회 박스 -->
	<div class="report-box">
		<a href="<c:url value="/admin/reportlist"/>">신고 병원 조회</a>
	</div>
</div>
<!-- 전체 병원 조회 박스 -->
<div class="all-box container mt-3">
	<div style="display: flex; align-items: center;">
	    <h2 style="margin-right: auto;">병원 회원 조회</h2>
	    <span><a style="margin-right: 100px;"
	    href="<c:url value='/admin/adminpage'/>">목록으로</a></span>
	</div>    
	<table class="table table-hover mt-3">
		<thead>
			<tr>
				<th>아이디</th>
				<th>상호명</th>
				<th>대표자명</th>
				<th>사업자 번호</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>소재지</th>
				<th>신고 받은 횟수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<c:choose>
			   <c:when test="${empty hoList}">
			       <tr>
			           <td colspan="7"><h2>등록된 병원이 없습니다.</h2></td>
			       </tr>
			   </c:when>
			   <c:otherwise>
			       <c:forEach items="${hoList}" var="ho">
			           <tr>
			               <td>${ho.ho_id}</td>
			               <td>${ho.ho_name}</td>
			               <td>${ho.ho_ceo}</td>
			               <td>${ho.ho_num}</td>
			               <td>${ho.ho_phone}</td>
			               <td>${ho.ho_email}</td>
			               <td>${ho.ho_address}</td>
			               <td>${ho.ho_report_count}</td>
			           </tr>
			       </c:forEach>
			   </c:otherwise>
		</c:choose>
			</tr>
		</tbody>
	</table>
	<ul class="page-group">
	    <c:if test="${pm.prev}">
	        <li class="page-prev page-design">
	            <c:url var="url" value="/admin/hospital">
	                <c:param name="page" value="${pm.startPage - 1 }"/>
	            </c:url>
	            <a class="page-link" href="${url}">이전</a>
	        </li>
	    </c:if>
	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
	        <c:set var="active" value="${pm.cri.page == i ? 'active' : ''}" />
	        <li class="page-now page-design ${active}">
	            <c:url var="url" value="/admin/hospital">
	                <c:param name="page" value="${i }"/>
	            </c:url>
	            <a class="page-link" href="${url }">${i}</a>
	        </li>
	    </c:forEach>
	    <c:if test="${pm.next}">
	        <li class="page-next page-design">
	            <c:url var="url" value="/admin/hospital">
	                <c:param name="page" value="${pm.endPage + 1}"/>
	            </c:url>
	            <a class="page-link" href="${url}">다음</a>
	        </li>
	    </c:if>
	</ul>

</div>
	
</body>
</html>