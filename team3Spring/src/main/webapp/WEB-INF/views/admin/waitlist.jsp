<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 대기 회원 조회</title>
<style type="text/css">

.all-box{

}
</style>
</head>
<body>
<!-- 전체 병원 조회 박스 -->
<div class="all-box container mt-3">
	<h2>대기 병원 리스트</h2>
	<table class="table table-hover mt-3">
		<thead>
			<tr>
				<th>아이디</th>
				<th>상호명</th>
				<th>사업자 번호</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>소재지</th>
				<th>승인/거절</th>
			</tr>
		</thead>
		<tbody class="box-hospital-list">

		</tbody>
	</table>
	<div class="box-pagination">
		<ul class="pagination justify-content-center"></ul>
	</div>
</div>

<script type="text/javascript">
let cri = {
	page : 1
}
getWaitList(cri);

function getWaitList(cri){
	$.ajax({
		async : true,
		url : '<c:url value="/admin/waitlist"/>', 
		type : 'post', 
		data : JSON.stringify(cri),
		//서버로 보낼 데이터 타입
		contentType : "application/json; charset=utf-8",
		//서버에서 보낸 데이터의 타입
		dataType : "json", 
		success : function (data){
			displayWaitList(data.list);
			displayWaitPagination(data.pm);
			/* $('.wait-total').text(data.pm.totalCount); */
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
}

function displayWaitList(list){
	let str = '';
	if(list == null || list.length == 0){
		str = '<h3>대기중인 병원이 없습니다.</h3>';
		$('.box-hospital-list').html(str);
		return;
	}
	for(item of list){
		str += 
		`
			<tr class="box-hospital">
				<td>\${item.ho_id}</td>
				<td>\${item.ho_name}</td>
				<td>\${item.ho_num}</td>
				<td>\${item.ho_phone}</td>
				<td>\${item.ho_email}</td>
				<td>\${item.ho_address}</td>
				<td><button class="btn-wait-ok" data-id="\${item.ho_id}">승인</button><button class="btn-wait-no" data-id="\${item.ho_id}">거절</button></td>
			</tr>
		`
	}
	$('.box-hospital-list').html(str);
}

function displayWaitPagination(pm){
    
	let str = '';
	if(pm.prev){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage - 1}">이전</a>
		</li>`;		
	}
	for(let i = pm.startPage; i<= pm.endPage; i++){
		let active = pm.cri.page == i ? 'active' : '';
		str += `
		<li class="page-item \${active}">
			<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
		</li>`;	
	}
	
	if(pm.next){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage + 1}">다음</a>
		</li>`;	
	}
	$('.box-pagination>ul').html(str);
}
$(document).on('click','.box-pagination .page-link',function(){
	cri.page = $(this).data('page');
	getWaitList(cri);
})
</script>
<!-- 승인 버튼 클릭 -->
<script type="text/javascript">
$(document).on('click','.btn-wait-ok',function(){
	if(!confirm("승인하시겠습니까?")){
		return;
	}
	//서버로 보낼 데이터
	let wait = {
		ho_id : $(this).data('id')
	}
	//서버로 데이터 전송
	$.ajax({
		async : true,
		url : '<c:url value="/admin/waitok"/>', 
		type : 'post',
		data : JSON.stringify(wait),
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.res){
				alert("회원 승인이 완료되었습니다.");
				getWaitList(cri);
			}else{
				alert("회원 승인에 실패하였습니다.");
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})
</script>
<!-- 거절 버튼 클릭 -->
<script type="text/javascript">
$(document).on('click','.btn-wait-no',function(){
	if(!confirm("거절하시겠습니까?")){
		return;
	}
	//서버로 보낼 데이터
	let wait = {
		ho_id : $(this).data('id')
	}
	//서버로 데이터 전송
	$.ajax({
		async : true,
		url : '<c:url value="/admin/waitno"/>', 
		type : 'post',
		data : JSON.stringify(wait),
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.res){
				alert("회원 거절이 완료되었습니다.");
				getWaitList(cri);
			}else{
				alert("회원 거절에 실패하였습니다.");
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})
</script>
</body>
</html>