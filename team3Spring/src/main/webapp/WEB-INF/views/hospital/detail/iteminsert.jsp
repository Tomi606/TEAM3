<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 등록</title>
<style type="text/css">
/* Resetting default margin and padding */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Container styles */
.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

/* Input box group styles */
.item-box {
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 20px;
}

.input-box-group {
    margin-bottom: 20px;
}

.input-box-group label {
    display: block;
    margin-bottom: 5px;
}

.input-box-group input[type="text"],
.input-box-group input[type="number"],
.input-box-group select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 10px;
    font-size: 16px;
}

/* Program box styles */
.program-box {
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 20px;
}

.program-box h3 {
    margin-bottom: 10px;
}

/* List box styles */
.list-box {
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 10px;
}

.list-box h3 {
    margin-bottom: 10px;
}

/* Button styles */
.btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn:hover {
    background-color: #0056b3;
}

/* Check box group styles */
.check-box-group input[type="checkbox"] {
    margin-right: 10px;
}
</style>
</head>
<body>
<div class="container">
<!-- 중복확인 버튼 때문에 불 필요한 여백 발생하는중 고쳐야 함 -->
<div class="input-box-group item-box">
	<h3>세부 항목 등록</h3>
	<label for="it_name">세부 항목</label>
    <input  type="text" id="it_name" name="it_name" placeholder="등록하고 싶은 항목을 입력하세요" autofocus="autofocus">
    <label for="it_explanation">세부 항목설명</label>
    <input type="text" name="it_explanation" placeholder="세부 항목의 설명">
    <div class="program-btn-box">
	    <a class="btn item-inset-btn">등록</a>
	    <a class="btn item-update-btn" href='<c:url value="/item/update"/>'>수정</a>
	    <a class="btn item-delete-btn">삭제</a>
    </div>
</div>
<br>


<div class="program-box">
	<h3>프로그램 등록</h3>
	<div class="input-box-group">
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
			<c:forEach items="${programList}" var="list">
				<option value="${list.hp_num}">${list.hp_title}</option>
			</c:forEach>
		</select>
	</div>
</div>

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

</div>

<!-- 프로그램을 선택하면 리스트 띄우기 -->
<script type="text/javascript">
	$("[name=hp_num]").change(function(){
		let hp_num = $("[name=hp_num]").val();
		if(hp_num == 'none'){
			hp_num =1;
			return;
		}
		$.ajax({
			method : "post",
			url : '<c:url value = "/itemlist/check"/>',
			data : {
				"hp_num" : hp_num
			},
			success : function (data) {
				/*let str = ``;
				for(let it of data.itemListList){
					str+=
						`
							<tr>
						        <td>\${it.item.it_name}</td>
						        <td>\${it.item.it_explanation}</td>
						        <td>\${it.hospital_program.hp_payment}</td>
						    </tr>
						`
				}
				*/
				$(".itemList").html(data);
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
		$.ajax({
			method : "post",
			url : '<c:url value="/item/insert"/>',
			data : {"it_name" : it_name,
					"it_explanation" : it_explanation},
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
					"list" : list},
			success : function (data) {
				$("#programBox").load(window.location.href + " #programBox");
				$("[name=hp_title]").val("");
				$("[name=hp_payment]").val("");
				alert(data.msg);						
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