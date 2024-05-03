<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 등록</title>
<style type="text/css">
.container {
	
  margin: 100px auto;
  max-width: 1000px;
  padding: 50px;
  background-color: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.form-control{
    height: calc(1.5em + .75rem + 8px);
}
.input-box-group {
  margin-bottom: 20px;
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  animation: fadeIn 0.5s ease-in-out;
}

.program-box {
  margin-bottom: 20px;
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  animation: fadeIn 0.5s ease-in-out;
}

.list-box {
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  animation: fadeIn 0.5s ease-in-out;
}

.date-box {
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  animation: fadeIn 0.5s ease-in-out;
  margin-top: 20px;
}
.table {
  width: 100%;
  border-collapse: collapse;
}

.table th,
.table td {
  padding: 8px;
  border: 1px solid #dee2e6;
}

@keyframes fadeIn {
  0% {
    opacity: 0;
    transform: translateY(-10px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}
/* input 태그 스타일 */
.input-box-group input[type="text"],
.input-box-group input[type="number"],
.program-box input[type="text"],
.program-box input[type="number"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ced4da;
  border-radius: 5px;
  animation: fadeIn 0.5s ease-in-out;
}

/* button 태그 스타일 */
.input-box-group .btn,
.program-box .btn {
  display: inline-block;
  padding: 10px 20px;
  margin-right: 10px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  animation: fadeIn 0.5s ease-in-out;
}

.input-box-group .btn:hover,
.program-box .btn:hover {
  background-color: #0056b3;
  animation: scaleIn 0.3s ease-in-out;
}

/* select 태그 스타일 */
.input-box-group select {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ced4da;
  border-radius: 5px;
  background-color: #fff;
  appearance: none; /* 스타일을 위해 기본 스타일 숨김 */
  animation: fadeIn 0.5s ease-in-out;
}
.date-box {
  margin-top: 20px;
  display: flex;
  align-items: center;
}

.date-box input[type="date"],
.date-box input[type="time"],
.date-box input[type="number"] {
  flex: 1;
  padding: 12px;
  margin-right: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
  box-sizing: border-box;
}

.date-box .btn {
	margin:5px;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #007bff;
  color: #fff;
  font-size: 16px;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.date-box .btn:hover {
  background-color: #0056b3;
}

/* 애니메이션 효과 */
.date-box input,
.date-box .btn {
  animation: fadeInUp 0.5s ease-out;
}

@keyframes fadeInUp {
  0% {
    opacity: 0;
    transform: translateY(20px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
</head>
<body>
<div class="container">
<div class="program-box">
	<h3>프로그램 등록</h3>
	<div class="input-box-group">
		<select name="hs_num" class="form-control">
				<option value="none">진료과를 선택해주세요</option>
			<c:forEach items="${list}" var="list">
				<option value="${list.hs_num}">${list.hs_title}</option>
			</c:forEach>
		</select>
		<label for="hp_title">프로그램 이름</label>
	    <input  type="text" id="hp_title" name="hp_title" placeholder="프로그램 이름을 입력하세요">
		<label for="hp_payment">프로그램 가격</label>
	    <input  type="number" id="hp_payment" name="hp_payment" placeholder="프로그램 가격을 입력하세요">
	    <a class="btn program-inset-btn">등록</a>
	    <a class="btn program-update-btn" href='<c:url value="/program/update"/>'>수정</a>
	    <a class="btn program-delete-btn">삭제</a>
	</div>
	<div class="check-box-group" id="check-box-group">
		<c:forEach items="${itemList}" var="item">
			<input type="checkbox" value="${item.it_num}" name="li_list">${item.it_name}
		</c:forEach>
	</div>
	<div class="input-group mb-3" id="programBox">
		<select name="hp_num" class="form-control">
				<option value="none">프로그램을 선택해주세요</option>
		</select>
	</div>
</div>

<!-- 중복확인 버튼 때문에 불 필요한 여백 발생하는중 고쳐야 함 -->
<div class="input-box-group item-box">
	<h3>세부 항목 등록</h3>
	<label for="it_name">세부 항목</label>
    <input  type="text" id="it_name" name="it_name" placeholder="등록하고 싶은 항목을 입력하세요" autofocus="autofocus">
    <label for="it_explanation">세부 항목설명</label>
    <input type="text" name="it_explanation" placeholder="세부 항목의 설명">
    <div class="program-btn-box">
	    <a class="btn item-inset-btn">등록</a>
	    <a class="btn item-update-btn" href='<c:url value="/date/update"/>'>수정</a>
	    <a class="btn item-delete-btn">삭제</a>
    </div>
</div>
<br>




<div class="list-box">
	 <table class="table">
	    <thead>
	      <tr>
	        <th>항목명</th>
	        <th>항목설명</th>
	        <th>가격</th>
	      </tr>
	    </thead>
	    <tbody class="itemList">
		      
	    </tbody>
	  </table>
</div>
<div class="date-box">
	<input type="date" name="rs_date">
	<input type="time" id="timeInput" name="rs_time">
	<input type="number" name="rs_max_person">
	<a class="btn date-inset-btn">등록</a>
    <a class="btn date-update-btn" href='<c:url value="/date/update"/>'>수정</a>
    <a class="btn date-delete-btn" href='<c:url value="/date/delete"/>'>삭제</a>
</div>
	
</div>


<!-- 스케줄 등록 메서드 -->
<script type="text/javascript">
	$(".date-inset-btn").click(function(){
		let rs_hp_num = $("[name=hp_num]").val();
		let rs_date = $("[name=rs_date]").val();
		let rs_time = $("[name=rs_time]").val();
		let rs_max_person = $("[name=rs_max_person]").val();
		if(rs_date == "" || rs_time == "" || rs_max_person == "" || rs_hp_num == 'none'){
			alert("프로그램을 선택하시거나, 날짜, 시간, 최대인원을 모두 입력해주시기 바랍니다.");
			rs_date = $("[name=rs_date]").val("");
			rs_time = $("[name=rs_time]").val("");
			rs_max_person = $("[name=rs_max_person]").val("");
			return
		}

		$.ajax({
			method : 'post',
			url : '<c:url value="/date/insert"/>',
			data : {
			    "rs_hp_num": rs_hp_num,
			    "rs_date": rs_date,
			    "rs_time": rs_time,
			    "rs_max_person": rs_max_person
			}, 
			success : function(data){
				alert(data.msg);
			}
		})
	});
</script>

<!-- 프로그램을 선택하면 리스트 띄우기 -->
<script type="text/javascript">
	$("[name=hp_num]").click(function(){
		let hp_num = $("[name=hp_num]").val();
		let hs_num = $("[name=hs_num]").val();
		if(hp_num == 'none'){
			hp_num =1;
			return;
		}
		if(hs_num == 'none'){
			hs_num = 1;
			return;
		}
		$.ajax({
			method : "post",
			url : '<c:url value = "/itemlist/check"/>',
			data : {
				"hp_num" : hp_num,
				"hs_num" : hs_num
			},
			success : function (data) {
				let str = ``;
				 for(let i = 0; i < data.itemList.length; i++){
		                let tmp = data.itemList[i];
		                str +=
		                    `
			                    <tr>
			                	<th>\${tmp.item.it_name}</th>
			                     <th>\${tmp.item.it_explanation}</th>
		                     `;
		                // 첫 번째 반복 요소에만 rowspan 추가
		                if(i === 0) {
		                    str +=
		                        `<th rowspan="\${data.itemList.length}">\${data.hp.payMentMoney}</th>`;
		                }
		                str +=
		                    `
		                    </tr>
		                    `;
		            }
		            $(".itemList").html(str);
			}
		})
	})	
</script>

<!-- 진료과목을 선택하면 진료 과에해당하는 세부 항목 띄우기 -->
<script type="text/javascript">
	$("[name=hs_num]").change(function(){
		let hs_num = $("[name=hs_num]").val();
		
		$.ajax({
			method : 'post',
			url : '<c:url value="/subject/item"/>',
			data : {
				"hs_num" : hs_num,
			},
			success : function (data) {
				let str = ``;
				let str2 = ``;
				for(let tmp of data.itemList){
					str+=`<input type="checkbox" value="\${tmp.it_num}" name="li_list">\${tmp.it_name}`
				}
				
				for(let tmp of data.hpList){
					str2 += `<option value="\${tmp.hp_num}">\${tmp.hp_title}</option>`
				}
				$(".check-box-group").html(str);
				$("[name=hp_num]").html(str2);
				
			}
		})
	})
</script>


<!-- 검사 상세 항목 등록 및 띄우기 -->
<script type="text/javascript">
	/* 상세 항목 등록 */
	$(".item-inset-btn").click(function(){
		let it_name = $("[name=it_name]").val();
		let it_explanation = $("[name=it_explanation]").val();
		let hs_num = $("[name=hs_num]").val();
		if(hs_num == 'none'){
			alert("검사 항목을 선택해주세요")
			it_explanation = $("[name=it_explanation]").val("");
			it_name = $("[name=it_name]").val("");
			return;
		}
		$.ajax({
			method : "post",
			url : '<c:url value="/item/insert"/>',
			data : {"it_name" : it_name,
					"it_explanation" : it_explanation,
					"hs_num" : hs_num},
			success : function (data) {
				//showItem(data.itemList, data.msg);
				if(data.msg){
					alert(data.msg)
				}else{
					$("[name=it_name]").val("");
					$("[name=it_explanation]").val("");
					$(".check-box-group").load(window.location.href + " .check-box-group");
				}
			}
		});
	});
	

</script>

<!-- 항목 삭제 함수 -->
<script type="text/javascript">
$(".item-delete-btn").click(function(){
	 var checkedValues = getCheckedValues();
	 console.log(checkedValues);
     $.ajax({
     	url : '<c:url value="/item/delete"/>',
     	method : 'post',
        data: { "checkedValues": checkedValues},
     	success : function(data){
			alert(data.msg);
			$(".check-box-group").load(window.location.href + " .check-box-group");
		}
     })
})
</script>

<!-- 기타 함수 -->
<script type="text/javascript">
function isNumber(value) {
    return !isNaN(value) && !isNaN(parseFloat(value));
}

//체크된 리스트 가져오기
function getCheckedValues() {
    var checkedValues = new Array(); // 체크된 값들을 담을 배열
    $("input[name='li_list']:checked").each(function() {
        checkedValues.push($(this).val());
    });
    return checkedValues;
}
</script>

<!-- 프로그램 등록 -->
 <script type="text/javascript">
 
	$(".program-inset-btn").click(function(){
		let hp_title = $("[name=hp_title]").val();
		let hp_payment = $("[name=hp_payment]").val();
		let list = getCheckedValues();
		let hs_num = $("[name=hs_num]").val();
		if(list.length == 0){
			alert("상세항목을 체크해주세요.");
			$("[name=hp_title]").val("");
			$("[name=hp_payment]").val("");
			return;
		}
		if(hp_title.length == 0 || hp_payment.length == 0){
			alert("프로그램 명과 가격을 제대로 작성해주세요");
			return;
		}
		$.ajax({
			method : "post",
			url : '<c:url value="/program/insert"/>',
			data : {"hp_title" : hp_title,
					"hp_payment" : hp_payment,
					"list" : list,
					"hs_num" : hs_num},
			success : function (data) {
				$("#programBox").load(window.location.href + " #programBox");
				$("[name=hp_title]").val("");
				$("[name=hp_payment]").val("");
			}
		});
	});
</script>

<!-- 프로그램 삭제 -->
<script type="text/javascript">
$(".program-delete-btn").click(function(){
    let hp_num = $("[name=hp_num]").val();
    // hp_num과 list를 함께 보내는 URL 생성
    let url = '<c:url value="/program/delete?hp_num="/>' + hp_num;
    // 생성된 URL로 이동
    location.href = url;
})
</script>

</body>
</html>