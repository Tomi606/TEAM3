<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<div class="post_list_container">
	<!-- 병원이면 누르면 병원 상세 뜨는 버튼 만들어도 좋을 것 같다. -->
		<div class="post_list_box">
			<h1>${po_id}</h1>
			<c:if test="${site_authority eq 'MANAGER'}">
				<span>병원 회원</span>
				<span>
					<a href="<c:url value='/hospital/detail/detail?ho_id=${po_id}'/>">병원 상세 바로가기</a>
				</span>
			</c:if>
			<c:if test="${site_authority eq 'USER'}">
				<span>일반 회원</span>
			</c:if>
			<c:if test="${site_authority eq 'ADMIN'}">
				<span>관리자</span>
			</c:if>
			
			<div class="hr"></div>
			<div>
				<table style="width: 100%;">
					<thead>
						<tr>
							<th style="width: 5%;">No</th>
							<th style="width: 40%;">제목</th>
							<th style="width: 30%;">작성일</th>
							<th style="width: 7.5%;">추천수</th>
							<th style="width: 7.5%;">조회수</th>
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
										<td style="width: 5%;">${boPostCount}</td>
										<td style="width: 40%;">
											<a href="<c:url value="/board/detail?po_num=${po.po_num}"/>" class="title-link">${po.po_title}</a>
											<a href="<c:url value="/board/detail?po_num=${po.po_num}#comments-section"/>" class="comment-link" data-po-num="${po.po_num}"> [${po.po_co_count}]</a>
										</td>
										<td style="width: 30%;">${po.changeDate1}</td>
										<td style="width: 7.5%;">${po.po_up}</td>
										<td style="width: 7.5%;">${po.po_view}</td>
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
					<c:url value="/board/userpost?po_id=${po_id}" var="url">
						<c:param name="page" value="${pm.startPage - 1}" />
						<c:param name="type" value="${pm.cri.type}" />
						<c:param name="search" value="${pm.cri.search}" />
					</c:url>
					<li class="page-item"><a class="page-link" href="${url}">이전</a>
					</li>
				</c:if>
				<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
					<c:url value="/board/userpost?po_id=${po_id}" var="url">
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
					<c:url value="/board/userpost?po_id=${po_id}" var="url">
						<c:param name="page" value="${pm.endPage + 1}" />
						<c:param name="type" value="${pm.cri.type}" />
						<c:param name="search" value="${pm.cri.search}" />
					</c:url>
					<li class="page-item"><a class="page-link" href="${url}">다음</a>
					</li>
				</c:if>
			</ul>
			<form action="<c:url value='/board/userpost'/>" method="get">
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
		</div>
	</div>
</body>
</html>