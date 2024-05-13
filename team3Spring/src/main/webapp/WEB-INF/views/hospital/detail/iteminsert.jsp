<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 등록</title>
<style type="text/css">
.home-box1 {
	width: 100%;
	height: 500px;
	background: url('<c:url value="/resources/img/white_pattern.jpg"/>');
	background-repeat: no-repeat;
	background-size: cover;
    background-origin: content-box;
}

.page-title {
	color:rgba(0, 100, 60, 0.8);
	text-align: left;
	font-size: 50px;
	font-weight: bold;
	margin: 0 0 80px 0;
}

.container {
    box-shadow: 0 1px 5px 2px rgba(0, 0, 0, 0.2);
    border-radius: 15px;
    margin: -250px auto 70px auto;
    background-color: white;
    width: 80%;
    height: 100%;
    border: 1px solid #ced4da;
    padding: 60px 80px;
    display: block;
}
.form-control {
    height: calc(1.5em + .75rem + 8px);
}

.program-box {
	box-shadow:inset 0 1px 5px 2px rgba(0, 0, 0, 0.2);
	background-color: #fff;
	border: 1px solid #ced4da;
	border-radius: 10px;
	margin-bottom: 20px;
	padding: 50px;
}

.list-box {
	box-shadow:inset 0 1px 5px 2px rgba(0, 0, 0, 0.2);
	background-color: #fff;
	border: 1px solid #ced4da;
	border-radius: 10px;
	width: 100%;height: 100%;
	padding: 70px 0;
}

.schedule-box {
	display: flex;width: 100%;margin-bottom: 30px;
}

.date-box {
	height:100px;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ced4da;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin: 40px auto -20px;
	display : flex;
	align-items: center;
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
}
.date-box{width: 100%;}
.date-box input{
	width: 30%;
	 padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ced4da;
  border-radius: 5px;
}
.program-btn-box {
	 float: right;
}

.box2-group {
	padding-bottom: 20px;
}

.box3-group {
	padding-bottom: 20px;
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
}

.hr_line {
	margin: 30px auto;
	padding: 50px auto;
}

.label {
	color: rgb(12, 12, 12);
    text-align: center;
    font-size: 30px;
    margin-right: 10px;
    font-weight: bold;
}

.sub_label {
	color: #555;
    text-align: center;
    font-size: 20px;
    margin-right: 10px;
    font-weight: bold;
}

.date-update-btn {
	margin-left: auto;
}
.list-boxBox {
	width: 90%;
	margin:0 auto;
}
.btn_boxBox {
	display: flex;
	justify-content: space-between;
}

.check-box-group {
	display: grid;
    grid-template-columns: repeat(14, 2fr);
    align-items: center;
    margin-bottom: 30px;
    font-size: 16px;
}

input[type="checkbox"] {
    width: 20px;
    height: 20px;
    border-radius: 50%;
    appearance: none;
    cursor: pointer;
    background-color: #c8c8c8;
    border: 0px solid white;
    margin: 4px 0px 4px 30px;
}

input[type="checkbox"]:checked::before {
    content: '\2713';
    display: flex;
    width: 20px;
    height: 20px;
    text-align: center;
    background-color: green;
    color: white;
    border-radius: 20px;
    flex-direction: row;
    align-content: stretch;
    justify-content: space-evenly;
    margin: 0px;
    flex-wrap: nowrap;
    align-items: center;
}

.date-box a {
	color: green;
    border: 1px solid green;
    text-decoration: none;
    font-size: 17px;
    margin: 5px 0px 15px 5px;
    width: 100px;
    
}

.date-box a:hover {
	color: white;
	background: green;
	border: 0px solid white;
	border-radius: 5px;
    
}


.program-btn-box a {
    color: green;
    border: 1px solid green;
    text-decoration: none;
    font-size: 17px;
    margin: 5px;
}

.program-btn-box a:hover {
	color: white;
	background: green;
	border: 0px solid white;
	border-radius: 5px;
}

.program-update-del-box {
	display: flex;
	align-items: flex-start;
}

.program-update-del-box a {
    color: green;
    border: 1px solid green;
    text-decoration: none;
    font-size: 17px;
    margin: 5px;
}

.program-update-del-box a:hover {
	color: white;
	background: green;
	border: 0px solid white;
	border-radius: 5px;
}
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%;margin: 0 auto;padding-top: 80px">
		<div class="page-title">
			프로그램 등록
		</div>
	</div>
</div>
<div class="container">
<div class="program-box">
	<div class="input-box-group">
		<div class="box1-group">
			<label class="label">세부항목을 등록할 과를 고르세요</label>
			<select name="hs_num" class="form-control">
					<option value="none">진료과를 선택해주세요</option>
				<c:forEach items="${list}" var="list">
					<option value="${list.hs_num}">${list.hs_title}</option>
				</c:forEach>
			</select>
		</div>
		
		<hr class="hr_line">
				
		<div class="box2-group" style="margin-bottom: 50px;">		
		<div class="program-update-del-box">
			<label class="label">등록할 세부 항목을 입력하세요</label>
		    <a class="btn item-update-btn" href='<c:url value="/item/update"/>'>수정</a>
		    <a class="btn item-delete-btn">삭제</a>
	    </div> 
			<label for="it_name" class="sub_label">항목명</label>
		    <input  type="text" id="it_name" name="it_name" placeholder="등록하고 싶은 항목을 입력하세요" autofocus="autofocus">
		    <label for="it_explanation" class="sub_label">항목 설명</label>
		    <input type="text" name="it_explanation" placeholder="세부 항목의 설명">
		    <div class="program-btn-box">
			    <a class="btn item-inset-btn">등록</a>
		    </div>  
		</div>

		    <hr class="hr_line">

	   	<div class="box3-group">	
	   	 	<label class="label">등록할 세부항목들을 선택하세요</label><br>
		   	<label for="it_name" class="it_name sub_label"></label>
		   	<div class="check-box-group" id="check-box-group"></div>
		   	
		   	<div class="program-update-del-box">
				<label class="label">등록할 프로그램명, 가격을 입력하세요</label>
			    <a class="btn program-update-btn" href='<c:url value="/program/update"/>'>수정</a>
			    <a class="btn program-delete-btn">삭제</a>
		    </div>
			<label for="hp_title" class="sub_label"	>프로그램명</label>
		    <input  type="text" id="hp_title" name="hp_title" placeholder="프로그램 이름을 입력하세요">
			<label for="hp_payment" class="sub_label">프로그램 가격</label>
		    <input  type="number" id="hp_payment" name="hp_payment" placeholder="프로그램 가격을 입력하세요">
	    	<div class="program-btn-box">
		    	<a class="btn program-inset-btn">등록</a>
		    </div>
	   	</div>
	</div>
</div>

<div class="list-box">
	<div class="list-boxBox">
		<div class="schedule-box">
			<label class="label">시간, 날짜, 최대인원을 등록할 프로그램을 고르세요</label>
			<div class="btn_boxBox program-btn-box">
				<a class="btn date-update-btn" href='<c:url value="/date/update"/>'>예약수정</a>
				<a class="btn date-delete-btn" href='<c:url value="/date/delete"/>'>예약삭제</a>
			</div>
		</div>
		<div class="input-group mb-3" id="programBox">
			<div>
				<label class="sub_label">프로그램명</label>
			</div>
			<select name="hp_num" class="form-control">
					<option value="none">프로그램을 선택해주세요</option>
			</select>
		</div>
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
		<div class="date-box">
			<input type="date" name="rs_date">
			<input type="time" id="timeInput" name="rs_time">
			<input type="number" name="rs_max_person" placeholder="최대인원을 입력하세요.">
			<div class="btn_boxBoxbox">
				<a class="date-inset-btn btn">등록</a>
			</div>
		</div>
	</div>	
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
	$("[name=hs_num]").click(function(){
		let hs_num = $("[name=hs_num]").val();
		let hs_num2 = $(this).find("option:selected").text();
		
		$.ajax({
			method : 'post',
			url : '<c:url value="/subject/item"/>',
			data : {
				"hs_num" : hs_num,
			},
			success : function (data) {
				if(hs_num == 'none'){
					let str3 = `<option value="none">프로그램을 선택해주세요</option>`;
					$("[name=hp_num]").html(str3);
				}
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
				$(".it_name").html(`\${hs_num2}` + "의 세부항목");
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