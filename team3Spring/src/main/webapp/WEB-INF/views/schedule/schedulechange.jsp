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
    $(document).on("click", '#reservation_table th', function() {
	      // 클릭한 th 요소의 내용을 저장
	      var currentText = $(this).text().trim();
	      
	      // 현재 요소를 input 요소로 변경
	      $(this).html('<input type="text" class="editable" value="' + currentText + '">');
	      
	      // input 요소에 포커스 주기
	      $(this).find('.editable').focus();
	    });
	    
	    // input 요소에서 포커스가 빠져나가면 값을 저장하고 텍스트로 변경
	    $(document).on('blur', '.editable', function() {
	      var newText = $(this).val().trim();
	      $(this).parent().text(newText);
    });
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
				console.log(data)
				if(data.list != null){
					for(let tmp of data.list){
						if(tmp == null){
							continue;
						}else{
							str+=`<tr>
									<th>\${tmp.rv_num}</th>
									<th>\${tmp.memberVO.me_id}</th>
									<th>\${tmp.rv_rvs_name}</th>
									<th>\${data.HP.hp_title}</th>
									<th>\${tmp.reservationScheduleVO.rsDate2}</th>
									<th>\${tmp.reservationScheduleVO.rsTime}</th>
									<th>
										<button class="change_btn">변경</button>
										<a class="btn delete_btn" href='<c:url value="/delete/schedule?rv_num=\${tmp.rv_num}"/>'>취소</a>
									</th>
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
		let hp_num = $("[name=hp_num]").val();
		let hs_num = $("[name=hs_num]").val();
		if(hs_num == 'none' || hp_num == 'none'){
			hs_num = 1;
			hp_num = 1;
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