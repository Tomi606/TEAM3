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
	<div style="display: flex; align-items: center;">
	    <select name="hs_num" class="form-control">
				<option value="none">진료과를 선택해주세요</option>
			<c:forEach items="${list}" var="list">
				<option value="${list.hs_num}">${list.hs_title}</option>
			</c:forEach>
		</select>
		<div class="input-group mb-3">
			<select name="hp_num" class="form-control">
				<option value="none">수정할 프로그램을 선택해주세요</option>
					
			</select>
		</div>
	</div>
	<table class="table table-hover mt-3">
		<thead>
			<tr>
				<th>예약번호</th>
				<th>예약자 아이디</th>
				<th>예약 상태</th>
				<th>예약 프로그램</th>
				<th>날짜</th>
				<th>시간</th>
				<th>변경/삭제</th>
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
	$("[name=hp_num]").click(function(){
		let hp_num = $("[name=hp_num]").val();
		if(hp_num == 'none'){
			hp_num = 1;
		}
		$.ajax({
			method : "post",
			url : '<c:url value="/schedule/check"/>',
			data:{
				"hp_num" : hp_num
			},
			success : function(data){
				let str = ``;
				console.log(data.list)
				if(data.list != null){
					for(let tmp of data.list){
						if(tmp == null){
							continue;
						}else{
							str+=`<tr>
								<th>\${tmp.rv_num}</th>
								<th>\${tmp.memberVO.me_id}</th>
								<th>\${tmp.rv_rvs_name}</th>
								<th>프로그램명 띄우기 고민해보기</th>
								<th>\${tmp.reservationScheduleVO.rsDate2}</th>
								<th>\${tmp.reservationScheduleVO.rsTime}</th>
								<th>승인/거절</th>
							  </tr>`;
						}
					}
				}
				$(".box-hospital-list").html(str);
			}
		});
	});
</script>

<!-- <script type="text/javascript">
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
</script>-->

<!-- 병원 과목을 선택하면 프로그램을 가져오는 메서드  -->
<script type="text/javascript">
	$("[name=hs_num]").change(function(){
		let hp_num = $("[name=hp_num]").val();
		let hs_num = $("[name=hs_num]").val();
		if(hs_num == 'none'){
			hs_num = 1;
		}
		let ho = '${ho.site_id}';
		$.ajax({
			method : "post",
			url : '<c:url value="/program/updatecheck2"/>',
			data : {"hs_num" : hs_num,
					"ho" : ho},
			success : function (data) {
				let str = ``
				for(let tmp of data.hpList){
					str+=`<option value="\${tmp.hp_num}">\${tmp.hp_title}</option>`
				}	
				$("[name=hp_num]").html(str);
			}
		});
	});
</script> 
</body>
</html>