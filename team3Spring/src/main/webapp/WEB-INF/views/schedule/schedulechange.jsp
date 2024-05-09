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


<!-- 변경 버튼을 눌렀을때 인풋태그가 바뀌는 코드 -->
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
		
		$(this).parents(".tr").find(".date").html('<select name="date" class="date">' + '</select>');
		$(this).parents(".tr").find(".time").html('<select name="time" class="time">'+ '</select>');
		$(this).parents(".tr").find(".program").html('<select name=uhp_num>'+ dis +'</select>');
		
		$(this).parents(".tr").find(".change_btn").html('<a class="btn success_btn">확인</a>')
	})
</script>


<!-- 프로그램을 선택하면 날짜를 가져오는 메서드 -->
<script type="text/javascript">
	$(document).on("click", "[name=hp_num]", function(){
		let list = selectDate();
		console.log(list)
		let option = optionStr(list);
		$(this).parents(".tr").find(".date").html('<select name="date" class="date">'+ option +'</select>');
	})
	
	function selectDate(){
		let uhp_num = $("[name=uhp_num]").val();
		if(uhp_num == 'none'){
			uhp_num = 1;
			return;
		}
		let res = null;
		$.ajax({
			async : false,
			method : "post",
			url : '<c:url value="/getdate"/>',
			data : {
				"hp_num" : uhp_num
			},
			success : function(data){
				res = data.RSlist
			}
		});
		return res;
	}
	
	function optionStr(list){
		let str = ``;
		if(list == null){
			$("[name=date]").html(str);
		}
        for(let tmp of list){
            str += `<option value="\${tmp.rs_num}">\${tmp.rsDate}</option>`;
        }
		return str;
	}
	
	
</script>


<script type="text/javascript">
	$(document).on("click", ".success_btn", function(){
		let rv_num = $(this).parents(".tr").find(".rv_num").text();
		let uhs_num = $("[name=hs_num]").val();
		let date = $(".date-update").val();
		let time = $(".time-update").val();
		location.href='<c:url value="/update/userschedule?rv_num="/>' + rv_num + "&uhs_num=" + uhs_num + "&date=" + date + "&time" + time
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

</body>
</html>