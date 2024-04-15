<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 회원 관리</title>
<style type="text/css">
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
<!-- 신고 회원 조회 : 아이디/이름/유형/사유/정지기간/누적신고횟수/누적정지횟수    정지(정지해제)버튼/탈퇴버튼 -->
<div class="mt-3">
	<h1 style="text-align: center;">신고 회원 관리</h1>
	<table class="table table-hover">
		<thead style="text-align: center;">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>정지 일수</th>
				<th>신고 사유</th>
				<th>누적신고횟수</th>
				<th>누적정지횟수</th>
				<th>정지기간</th>
				<th>정지</th>
				<th>탈퇴</th>
			</tr>
		</thead>
		<tbody class="report-list">
			<tr>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div class="box-pagination">
		<ul class="pagination justify-content-center"></ul>
	</div>
</div>

<!-- 신고된 회원 리스트 조회 -->
<script type="text/javascript">
let cri = {
	page : 1
}
getReportList(cri);

function getReportList(cri){
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
			displayReportList(data.list);
			displayReportPagination(data.pm);
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
}

function displayReportList(list){
	let str = '';
	if(list == null || list.length == 0){
		str = '<h3>신고된 회원이 없습니다.</h3>';
		$('.report-list').html(str);
		return;
	}
	for(item of list){
		str += 
			` 
			<tr class="box-report" style="text-align: center;">
				<td>\${item.rp_target}</td>
				<td>\${item.member.me_name}</td>
				<td>\${item.rp_rs_name}</td>
				<td>\${item.rp_name}</td>
				<td>\${item.member.me_report_count}</td>
				<td>\${item.member.me_stop_count}</td>
				<td>
					<select>
						<option value="0">선택</option>
						<option value="1">1일</option>
						<option value="3">3일</option>
						<option value="7">7일</option>
						<option value="15">15일</option>
						<option value="30">30일</option>
						<option value="60">60일</option>
						<option value="365">365일</option>
					</select>
				</td>
				<td><button type="button" class="btn-member-stop" data-stop="\${item.rp_target}">정지</button></td>
				<td><button type="button" class="btn-member-del" data-del="\${item.member.me_id}">탈퇴</button></td>
			</tr>
			`
	}
	$('.report-list').html(str);
}

function displayReportPagination(pm) {
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

<!-- 정지 버튼 : 정지하고 자동으로 정지풀리게 -->
<script type="text/javascript">
$(document).on('click', '.btn-member-stop', function() {
	if(!confirm("정지 하겠습니까?")) {
		return;
	}
	
	let id = {
		rp_target : $(this).data('stop')
	}
	
	//서버에 데이터를 전송
	$.ajax({
		async : true, 
		url : '<c:url value="/admin/member/stop"/>', 
		type : 'post', 
		data : JSON.stringify(id), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result) {
				alert('정지되었습니다.');
				getReportList(cri);
			}
			else {
				alert('회원 정지 실패');
			}
		}, 
		error : function(xhr, textStatus, errorThrown){
			console.error(xhr);
			console.error(textStatus);
		}
	}); //ajax end
});
</script>

<!-- 탈퇴 버튼 -->
<script type="text/javascript">
$(document).on('click', '.btn-member-del', function() {
	if(!confirm("탈퇴 시키시겠습니까?")) {
		return;
	}
	
	let id = {
		me_id : $(this).data('del')
	}
	
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
				alert('탈퇴되었습니다.');
				getReportList(cri);
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