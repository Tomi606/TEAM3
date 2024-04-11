<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
<h1>관리자 페이지 - 회원 관리(선진)</h1>
<table class="table table-hover">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>연락처</th>
			<th>이메일</th>
			<th>주소</th>
			<th>직업</th>
			<th>정지기간</th>
			<th>정지누적횟수</th>
			<th>정지</th>
			<th>탈퇴</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${me.me_id == admin123}">	
		<c:forEach items="${list}" var="me">			
			<tr>
			
				<td>${me.me_id}</td>
				<td>${me.me_name}</td>
				<td>${me.me_gender}</td>
				<td>${me.me_phone}</td>
				<td>${me.me_email}</td>
				<td>${me.me_address}</td>
				<td>${me.me_job}</td>
				<td>${me.me_stop}</td>
				<td>정지누적횟수</td>
				<td>
					<c:choose>
						<c:when test="${me.me_stop == null}">						
							<button class="meStop" name="meStop">정지</button>
						</c:when>
						<c:otherwise>
							<button class="meStopClear" name="meStopClear">정지 해제</button>
						</c:otherwise>
					</c:choose>
				</td>
				<td><button class="btn-outline-success btn-member-del" data-id="${me.me_id}" name="meDelete">탈퇴</button></td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
</table>

<ul class="pagination justify-content-center">
	<c:if test="${pm.prev}">
		<c:url value="/admin/member" var="url">
			<c:param name="page" value="${pm.startPage - 1}"/>
			<c:param name="type" value="${pm.cri.type}"/>
			<c:param name="search" value="${pm.cri.search}"/>
		</c:url>
		<li class="page-item">
			<a class="page-link" href="${url}">이전</a>
		</li>
	</c:if>
	<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
		<c:url value="/admin/member" var="url">
			<c:param name="page" value="${i}"/>
		</c:url>
		<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
			<a class="page-link" href="${url}">${i}</a>
		</li>
	</c:forEach>
	<c:if test="${pm.next}">
		<c:url value="/admin/member" var="url">
			<c:param name="page" value="${pm.endPage + 1}"/>
			<c:param name="type" value="${pm.cri.type}"/>
			<c:param name="search" value="${pm.cri.search}"/>
		</c:url>
		<li class="page-item">
			<a class="page-link" href="${url}">다음</a>
		</li>
	</c:if>
</ul>


<!-- 정지 -->
<script type="text/javascript">
let meStop = $('[name=meStop]').val();
</script>

<!-- 정지 해제 -->
<script type="text/javascript">
let meStopClear = $('[name=meStopClear]').val();
</script>

<!-- 탈퇴 -->
<script type="text/javascript">
$('.btn-member-del').click(function() {
	let meId = {
			me_id : $(this).data('id');
	}

	//서버에 데이터를 전송
	$.ajax({
		async : false, 
		url : '<c:url value="/member/delete"/>', 
		type : 'get', 
		data : JSON.stringify(meId), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result) {
				alert('회원 삭제 성공!!!');
			}
			else {
				alert('회원 삭제 실패');
			}
		}, 
		error : function(xhr, textStatus, errorThrown){
			console.error(xhr);
			console.error(textStatus);
		}
	}); //ajax end
});

/* $(document).on('click', '.btn-member-del', function() {
	//서버로 보낼 데이터 생성
	let me_id = {
		me_id : $(this).data('meid')
	}
	//서버로 데이터를 전송
	$.ajax({
		async : true, 
		url : '<c:url value="/comment/delete"/>', 
		type : 'get', 
		data : JSON.stringify(comment), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result) {
				alert('회원 삭제 성공!!!');
			}
			else {
				alert('회원 삭제 실패');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
}); */

/* function memberDelete() {
	let meDelete = $('[name=meDelete]').val();
	let obj = {
		id : meDelete
	}
	let result = false;
	$.ajax({
		async : false,
		url : '<c:url value="/member/delete"/>', 
		type : 'get', 
		data : obj, 
		dataType : "json", 
		success : function (data){
			meDelete = data.meDelete;
			if(meDelete) {
				alert("삭제");
			}
			else {
				alert("삭제 실패");
			}
			
		}, 
		error : function(jqXHR, textStatus, errorThrown){
	
		}
	});
	return result;
}
$('[name=meDelete]').on('onclick', function() {
	memberDelete();
}); */
</script>
</body>
</html>