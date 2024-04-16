<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 신고 회원 조회</title>
<style type="text/css">

.all-box{

}
</style>
</head>
<body>
<!-- 전체 병원 조회 박스 -->
<div class="all-box container mt-3">
	<h2>신고 병원 리스트(개발중)</h2>
	<table class="table table-hover mt-3">
		<thead>
			<tr>
				<th>아이디</th>
				<th>상호명</th>
				<th>사업자 번호</th>
				<th>신고 유형</th>
				<th>신고 사유</th>
				<th>신고 누적 횟수</th>
				<th>정지 기간</th>
				<th>정지</th>
				<th>탈퇴</th>
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
getReportList(cri);

function getReportList(cri){
	$.ajax({
		async : true,
		url : '<c:url value="/admin/reportlist"/>', 
		type : 'post', 
		data : JSON.stringify(cri),
		//서버로 보낼 데이터 타입
		contentType : "application/json; charset=utf-8",
		//서버에서 보낸 데이터의 타입
		dataType : "json", 
		success : function (data){
			console.log(data.list);
			displayReportList(data.list);
			displayReportPagination(data.pm);
			/* $('.report-total').text(data.pm.totalCount); */
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
}

function displayReportList(list){
	let str = '';
	if(list == null || list.length == 0){
		str = '<h3>신고된 병원이 없습니다.</h3>';
		$('.box-hospital-list').html(str);
		return;
	}
	for(item of list){
		if(item.hospital != null){
			str += 
			`
				<tr class="box-hospital">
					<td>\${item.rp_target}</td>
					<td>\${item.hospital.ho_name}</td>
					<td>\${item.hospital.ho_num}</td>
					<td>\${item.rp_name}</td>
					<td>\${item.rp_name}</td>
					<td>\${item.hospital.ho_report_count}</td>
					<td>\${item.hospital.changeDate}</td>
					<td>
						<select id="selectbox" data-gg="gg">
							<option value="0">선택</option>
							<option value="1">1일</option>
							<option value="3">3일</option>
							<option value="7">7일</option>
							<option value="15">15일</option>
							<option value="30">30일</option>
							<option value="60">60일</option>
							<option value="365">365일</option>
						</select>
						<button class="btn-ho-stop" data-id="\${item.hospital.ho_id}">정지</button>
					</td>
					<td><button class="btn-ho-out" data-id="\${item.hospital.ho_id}">탈퇴</button></td>
				</tr>
			`;
		}
	}
	$('.box-hospital-list').html(str);
}

function displayReportPagination(pm){
    
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
	getReportList(cri);
})
</script>
<!-- 정지 버튼 클릭 -->
<script type="text/javascript">
$(document).on('click','.btn-ho-stop',function(){
	//정지 버튼의 바로 이전에 있는 형제 요소인 select태그 값 가져옴
	var rp_rs_name = $(this).prev().val();
	if(rp_rs_name == "0"){
		alert("정지일을 선택해주세요.");
		return;
	}
	if(!confirm("정지 처리 하시겠습니까?")){
		return;
	}
	//서버로 보낼 데이터
	let stop = {
		rp_target : $(this).data('id'),
		rp_rs_name : rp_rs_name
	}
	//서버로 데이터 전송
	$.ajax({
		async : true,
		url : '<c:url value="/admin/hospitalstop"/>', 
		type : 'post',
		data : JSON.stringify(stop),
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.res){
				alert("회원 정지가 완료되었습니다.");
				getReportList(cri);
			}else{
				alert("회원 정지에 실패하였습니다.");
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})
</script>
<!-- 탈퇴 버튼 클릭 -->
<script type="text/javascript">
$(document).on('click','.btn-ho-out',function(){
	if(!confirm("탈퇴 시키시겠습니까?")){
		return;
	}
	//서버로 보낼 데이터
	let ho = {
		ho_id : $(this).data('id')
	}
	//서버로 데이터 전송
	$.ajax({
		async : true,
		url : '<c:url value="/admin/hospitalout"/>', 
		type : 'post',
		data : JSON.stringify(ho),
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.res){
				alert("회원 탈퇴가 완료되었습니다.");
				getReportList(cri);
			}else{
				alert("회원 탈퇴에 실패하였습니다.");
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})
</script>
</body>
</html>