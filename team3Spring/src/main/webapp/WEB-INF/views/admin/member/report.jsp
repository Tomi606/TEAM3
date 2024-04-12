<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 회원 관리</title>
<style type="text/css">
/* .report-box{
	width: 30%;
	height: 300px;
	border: 1px solid gray;
	border-radius: 20px;
	padding: 10px;
	margin: auto;
	text-align: center;
} */
</style>
</head>
<body>
<!-- 신고 회원 조회 : 아이디/이름/유형/사유/정지기간/누적정지횟수    정지(정지해제)버튼/탈퇴버튼 -->
<div class="report-box all-box container mt-3">
	<h1 style="text-align: center;">신고 회원 관리</h1>
	<table class="table table-hover">
		<thead style="text-align: center;">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>주소</th>
				<th>정지기간</th>
				<th>정지누적횟수</th>
				<th>정지</th>
				<th>탈퇴</th>
			</tr>
		</thead>
		<tbody class="box-hospital-list">
			<tr>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div class="box-pagination">
		<ul class="pagination justify-content-center"></ul>
	</div>
</div>

<!-- 회원 리스트 조회 -->
<script type="text/javascript">
let cri = {
	page : 1
}
getWaitList(cri);

function getWaitList(cri){
	$.ajax({
		async : true,
		url : '<c:url value="/admin/member/report"/>', 
		type : 'post', 
		data : JSON.stringify(cri),
		//서버로 보낼 데이터 타입
		contentType : "application/json; charset=utf-8",
		//서버에서 보낸 데이터의 타입
		dataType : "json", 
		success : function (data){
			displayWaitList(data.list);
			displayWaitPagination(data.pm);
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
}

function displayWaitList(list){
	let str = '';
	if(list == null || list.length == 0){
		str = '<h3>가입한 회원이 없습니다.</h3>';
		$('.box-hospital-list').html(str);
		return;
	}
	for(item of list){
		str += 
		`
			<tr class="box-hospital" style="text-align: center;">
				<td>\${item.me_id}</td>
				<td>\${item.me_name}</td>
				<td>\${item.me_phone}</td>
				<td>\${item.me_email}</td>
				<td>\${item.me_address}</td>
				<td>\${item.me_stop}</td>
				<th>\${item.me_report_count}</th>
				<td><button>정지</button></td>
				<td><button type="button" class="btn-member-del" data-id="\${item.me_id}">탈퇴</button></td>
			</tr>
		`
	}
	$('.box-hospital-list').html(str);
}

function displayWaitPagination(pm) {
    let str = '';
    if (pm.prev) {
        str += `
        <li class="page-item">
            <a class="page-link" href='<c:url value="/admin/member/report"/>' data-page="${pm.startPage - 1}">이전</a>
        </li>`;
    }
    for (let i = pm.startPage; i <= pm.endPage; i++) {
        let active = pm.cri.page == i ? 'active' : '';
        str += `
        <li class="page-item ${active}">
            <a class="page-link" href='<c:url value="/admin/member/report?page=${i}"/>' data-page="${i}">\${i}</a>
        </li>`;
    }

    if (pm.next) {
        str += `
        <li class="page-item">
            <a class="page-link" href='<c:url value="/admin/member/report"/>' data-page="${pm.endPage + 1}">다음</a>
        </li>`;
    }
    // 여기서 클래스를 잘못 선택했을 수 있습니다. 올바른 클래스를 선택해야 합니다.
    $('.box-pagination ul').html(str);
}
</script>

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
$(document).on('click', '.btn-member-del', function() {
	let id = {
		me_id : $(this).data('id')
	}
	
/* 
 * confirm 처리
	function call_confirm(id) {
		if(confirm(${id}+"회원을 정말 탈퇴시키겠습니까?")){
			alert("탈퇴시켰습니다.");
		}
		else {
			alert("탈퇴실패");
		}
		
	} */
	//서버에 데이터를 전송
	$.ajax({
		async : true, 
		url : '<c:url value="/admin/member/delete"/>', 
		type : 'post', 
		data : JSON.stringify(id), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result) {
				alert('회원 삭제 성공!!!');
				/* confirm(${id}+"회원을 정말 탈퇴시키겠습니까?"); */
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
</script>
</body>
</html>