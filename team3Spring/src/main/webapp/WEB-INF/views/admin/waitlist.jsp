<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 대기 회원 조회</title>
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
</style>
</head>
<body>
<!-- 전체 병원 조회 박스 -->
<div class="all-box container mt-3">
	<h2>대기 병원 리스트</h2>
	<!-- 검색 -->
	<div>
		
	</div>
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
			<tr>
				<td>John</td>
				<td>Doe</td>
				<td>Doe</td>
				<td>john@example.com</td>
				<td>john@example.com</td>
				<td>john@example.com</td>
				<td><button>승인</button><button>거절</button></td>
			</tr>
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
			/* $('.comment-total').text(data.pm.totalCount); */
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
				<td><button data-num="\${item.cm_num}">승인</button><button data-num="\${item.cm_num}">거절</button></td>
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
</script>
</body>
</html>