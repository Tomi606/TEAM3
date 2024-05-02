<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="http://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script src="http://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.post_list_container {
	width: 100%;
	height: 1500px;
}

.post_list_box {
	border: 1px solid black;
	width: 1400px;
	height: 93.4%;
	margin: 100px auto;
	padding: 100px;
	text-align: center;
}

.hr {
	width: 100%;
	height: 0;
	border: 1px solid lightgray;
	margin: 50px 0 50px 0;
}

.검색 {
	outline-style: none;
	width: 400px;
	padding: 10px 50px 10px 10px;
	height: 100%;
}

.post_insert_btn {
	line-height: 50px;
	color: green;
	height: 100%;
	width: 100%;;
	border: 1px solid green;
	padding: 13px;
}

.post_insert_btn:hover {
	color: white;
	background-color: green;
	text-decoration: none;
}

.post_insert_btn_box {
	height: 50px;
	width: 100px;
	margin: 0 20px 40px auto;
}

.search-box {
	height: 50px;
	margin: 80px 0 100px 0;
}

.search-btn {
	height: 100%;
	position: relative;
	right: 52px;
	bottom: 1px;
}
.title-link{
	color: black;
}
.comment-link{
	color: red;
	font-weight: 600;
}
.comment-link:hover{
	color: black;
}
 .page-link{
color: green;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: green;
    border-color: green;
	position: relative;
    display: block;
    padding: .5rem .75rem;
    margin-left: -1px;
    line-height: 1.25;
    border: 1px solid #dee2e6;
 }
.pagination {
    display: -ms-flexbox;
    display: flex;
    padding-left: 0;
    list-style: none;
    border-radius: .25rem;
} 
</style>

</head>
<body>
	<div>
		<table style="width: 100%;margin:100px auto;">
			<thead>
				<tr>
					<th style="width: 10%;">No</th>
					<th style="width: 40%;">제목</th>
					<th style="width: 20%;">작성일</th>
					<th style="width: 7.5%;text-align: center;">추천수</th>
					<th style="width: 7.5%;text-align: center;">조회수</th>
				</tr>
			</thead>
			<tr class="hr"></tr>
			<tbody>
				<c:choose>
					<c:when test="${not empty poList}">
						<c:set var="postFound" value="false" />
						<c:set var="boPostCount" value="0" />
						<!-- 각 bo_num별 게시글 수 초기화 -->
						<c:forEach items="${poList}" var="po" varStatus="poIndex">
							<c:set var="boPostCount" value="${boPostCount + 1}" />
							<tr style="height: 100px; border-bottom: 1px solid lightgray;">
								<td >${boPostCount}</td>
								<td >
									<a href="<c:url value="/board/detail?po_num=${po.po_num}"/>" class="title-link">${po.po_title}</a>
									<a href="<c:url value="/board/detail?po_num=${po.po_num}#comments-section"/>" class="comment-link" data-po-num="${po.po_num}"> [${po.po_co_count}]</a>
								</td>
								<td >${po.changeDate1}</td>
								<td style="text-align: center;">${po.po_up}</td>
								<td style="text-align: center;">${po.po_view}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr style="height: 400px;">
							<td colspan="6">
								<div>
									<h3 style="color: lightgray">게시글이 존재하지 않습니다.</h3>
								</div>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<c:url value="/userpo?po_id=${po_id}" var="url">
				<c:param name="page" value="${pm.startPage - 1}" />
				<c:param name="type" value="${pm.cri.type}" />
				<c:param name="search" value="${pm.cri.search}" />
			</c:url>
			<li class="page-item"><a class="page-link" href="${url}">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:url value="/userpo?po_id=${po_id}" var="url">
				<c:param name="page" value="${i}" />
				<c:param name="type" value="${pm.cri.type}" />
				<c:param name="search" value="${pm.cri.search}" />
			</c:url>
			<li
				class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
				<a class="page-link" href="${url}">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${pm.next}">
			<c:url value="/userpo?po_id=${po_id}" var="url">
				<c:param name="page" value="${pm.endPage + 1}" />
				<c:param name="type" value="${pm.cri.type}" />
				<c:param name="search" value="${pm.cri.search}" />
			</c:url>
			<li class="page-item"><a class="page-link" href="${url}">다음</a>
			</li>
		</c:if>
	</ul>
	<form action="<c:url value='/userpo'/>" method="get">
		<div class="search-box">
			<input type="hidden" name="po_id" value="${po_id}">
			<select name="type">
				<option value="title"
					<c:if test="${pm.cri.type == 'title'}">selected</c:if>>제목만</option>
				<option value="titleContent"
					<c:if test="${pm.cri.type == 'titleContent'}">selected</c:if>>제목 + 내용</option>
			</select>
			<input type="search" class="검색" name="search" placeholder="검색어를 입력하세요">
			<button class="search-btn" type="submit">검색</button>
		</div>
	</form>
</body>
</html>