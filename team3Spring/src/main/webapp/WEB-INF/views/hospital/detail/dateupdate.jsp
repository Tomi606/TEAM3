<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery validation -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<title>세부 항목  수정</title>
<style type="text/css">
.container {
  margin: 20px auto;
  max-width: 800px;
  padding: 20px;
  background-color: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.list-box {
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  animation: fadeIn 0.5s ease-in-out;
}
</style>
</head>
<body>
<div class="container">
		<h3>진료고와 프로그램을 선택후 수정 사항을 모두 기입후 번호를 눌러주세요</h3>
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
		<div class="date-box">
			<input type="date" name="rs_date">
			<input type="time" id="timeInput" name="rs_time">
			<input type="number" name="rs_max_person">
			
		</div>
		<div class="list-box">
			 <table class="table">
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>날짜</th>
			        <th>시간</th>
			        <th>최대인원</th>
			      </tr>
			    </thead>
			    <tbody class="itemList">
				      
			    </tbody>
			  </table>
		</div>
		<button class="btn update-btn">항목 수정</button>

</div>

<script type="text/javascript">
	$("[name=hp_num]").click(function(){
		let hp_num = $("[name=hp_num]").val();
		$.ajax({
			method : "post",
			url : '<c:url value="/date/update"/>',
			data : {
				"hp_num" : hp_num
			},
			success : function(data){
				let str = ``;
				for(let tmp of data.RSlist){
					str+=
						`
							   <tr>
						        <th><a class="rs-btn">\${tmp.rs_num}</a></th>
						        <th>\${tmp.rsDate}</th>
						        <th>\${tmp.rsTime}</th>
						        <th>\${tmp.rs_max_person}</th>
						      </tr>
						`
				}
				$(".itemList").html(str);
			}
		})
	})
</script>

<script type="text/javascript">
	$(document).on('click', '.rs-btn', function(){
		let rs_date = $("[name=rs_date]").val();
		let rs_time = $("[name=rs_time]").val();
		let rs_max_person = $("[name=rs_max_person]").val();
		if(rs_date == "" || rs_time == "" || rs_max_person == ""){
			alert("날짜, 시간, 최대인원을 모두 입력해주시기 바랍니다.");
			rs_date = $("[name=rs_date]").val("");
			rs_time = $("[name=rs_time]").val("");
			rs_max_person = $("[name=rs_max_person]").val("");
			return
		}
		$.ajax({
			method : 'post',
			url : '<c:url value="/date/realupdate"/>',
			data : {
				"rs_date": rs_date,
			    "rs_time": rs_time,
			    "rs_max_person": rs_max_person
			},
			success : function (data) {
				if(data){
					location.href = '<c:url value="/hospital/item/insert"/>';
				}else{
					location.href = '<c:url value="/date/update"/>';
				}
			}
		})
	})	
</script>

<script type="text/javascript">
	
	$("[name=hs_num]").change(function(){
		let hs_num = $("[name=hs_num]").val();
		if(hs_num == 'none'){
			hs_num = 1;
			return;
		}		
		$.ajax({
			method : "post",
			url : '<c:url value="/program/updatecheck"/>',
			data : {"hs_num" : hs_num},
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