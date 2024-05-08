<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 대기 회원 조회</title>
<style type="text/css">
.btn {
  display: inline-block;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #007bff;
  color: #fff;
  font-size: 16px;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

/* 버튼 호버 효과 */
.btn:hover {
  background-color: #0056b3;
}

/* 버튼 클릭 효과 */
.btn:active {
  background-color: #004080;
}
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
	<table class="table table-hover mt-3" >
		<thead>
			<tr>
				<th>예약번호</th>
				<th>예약자 아이디</th>
				<th>예약 상태</th>
				<th>예약 프로그램</th>
				<th>날짜</th>
				<th>시간</th>
				<th>변경/취소</th>
			</tr>
		</thead>
		<tbody class="box-hospital-list" id="reservation_table">

		</tbody>
	</table>
	<div class="box-pagination">
		<ul class="pagination justify-content-center"></ul>
	</div>
</div>

<script>
    // th를 클릭하면 텍스트가 사라지고 input 태그로 변경
    $(document).on("click", '.change_btn', function() {
      // 클릭한 th 요소의 내용을 저장
      var currentText = $('#reservation_table th').text().trim();
      
      // 현재 요소를 input 요소로 변경
      //$(this).html('<input type="text" class="editable" value="' + currentText + '">');
      
      // input 요소에 포커스 주기
      $(this).find('.editable').focus();
    });
    
    // input 요소에서 포커스가 빠져나가면 값을 저장하고 텍스트로 변경
    $(document).on('blur', '.editable', function() {
      var newText = $(this).val().trim();
      $(this).parent().text(newText);
	 });
</script>

<script type="text/javascript">
	$(document).on("click", ".change_btn", function(){
		/* let list = selectProgram();
		let dis = displayHospitalUpdateProgram(list);
		let date = $(this).parents(".tr").find(".date").html('<input class="date-update" type="date">');
		let time = $(this).parents(".tr").find(".time").html('<input class="time-update"type="time">');
		let select = $(this).parents(".tr").find(".program").html('<select name=uhs_num>'+ dis +'</select>');
		let rv_num = $(this).parents(".tr").find(".rv_num").text();
		let btn =  */
		/* let date = $(this).parents(".tr").find(".date").hide();
		let time = $(this).parents(".tr").find(".time").hide();
		let rv_num = $(this).parents(".tr").find(".rv_num").text();
		let btn = $(this).parents(".tr").find(".change_btn").hide(); */
		
		$(this).parents(".tr").find(".change-box").css('display', 'none');
		
		
		let list = selectProgram();
		/* 옵션 str */
		let dis = displayHospitalUpdateProgram(list);
		
		$(this).parents(".tr").find(".date").html('<input class="date-update" type="date">');
		$(this).parents(".tr").find(".time").html('<input class="time-update"type="time">');
		$(this).parents(".tr").find(".program").html('<select name=uhs_num>'+ dis +'</select>');
		
		$(this).parents(".tr").find(".change_btn").html('<a class="btn success_btn">확인</a>')
	})
</script>


<script type="text/javascript">
	$(document).on("click", ".success_btn", function(){
		let rv_num = $(this).parents(".tr").find(".rv_num").text();
		let uhs_num = $("[name=uhs_num]").val();
		let date = $(".date-update").val();
		let time = $(".time-update").val();
		
	})
</script>

<!-- 병원 과목을 선택하면 프로그램을 가져옴 -->
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
				if(data.list != null){
					for(let tmp of data.list){
						if(tmp == null){
							continue;
						}else{
							str+=`<tr class="tr">	
										<td class="rv_num">\${tmp.rv_num}</td>
										<td>\${tmp.memberVO.me_id}</td>
										<td>\${tmp.rv_rvs_name}</td>
										<td class="program"><div class="change-box">\${data.HP.hp_title}</div></td>
										<td class="date"><div class="change-box">\${tmp.reservationScheduleVO.rsDate2}</div></td>
										<td class="time"><div class="change-box">\${tmp.reservationScheduleVO.rsTime}</div></td>
										<td>
											<a class="btn change_btn">변경</a>
											<a class="btn delete_btn" href='<c:url value="/delete/schedule?rv_num=\${tmp.rv_num}"/>'>취소</a>
										</td>
								  </tr>`;
						}
					}
				}
				$(".box-hospital-list").html(str);
			}
		});
	});
</script>

<!-- 병원 과목을 선택하면 프로그램을 가져오는 메서드  -->
<script type="text/javascript">
	$("[name=hs_num]").click(function(){
		let list = selectProgram();
		displayHospitalProgram(list);
	});
	
	function selectProgram(){
	    let hp_num = $("[name=hp_num]").val();
	    let hs_num = $("[name=hs_num]").val();
	    if(hs_num == 'none' || hp_num == 'none'){
	        hs_num = 1;
	        hp_num = 1;
	    }
	    let ho = '${ho.site_id}';
	 	let res = null;
	    $.ajax({
	    	async : false,
	        method : "post",
	        url : '<c:url value="/program/updatecheck2"/>',
	        data : {"hs_num" : hs_num,
	                "ho" : ho},
	        success : function (data) {
	            res=data.hpList;
	        }
	    });
	    return res;
	}
	function displayHospitalProgram(hpList){
		let str = ``;
		if(hpList == null){
			$("[name=hp_num]").html(str);
		}
        for(let tmp of hpList){
            str += `<option value="\${tmp.hp_num}">\${tmp.hp_title}</option>`;
        }
        //callback(str);
        $("[name=hp_num]").html(str);
	}
	
	function displayHospitalUpdateProgram(hpList){
		let str = ``;
		if(hpList == null){
			$("[name=hp_num]").html(str);
		}
        for(let tmp of hpList){
            str += `<option value="\${tmp.hp_num}">\${tmp.hp_title}</option>`;
        }
        return str;
	}
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


</body>
</html>