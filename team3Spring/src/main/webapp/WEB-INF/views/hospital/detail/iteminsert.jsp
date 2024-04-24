<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
<h3>리스트 생성 및 선택</h3>
	<div class="input-box-group">
		<label for="il_title">리스트 이름을 정해주세요</label>
	    <input  type="text" id="il_title" name="il_title" placeholder="리스트 이름을 입력하세요">
	</div>
	<br>
	
	<div class="check-box-group" id="check-box-group">
		<c:forEach items="${itemList}" var="item">
			<input type="checkbox" value="${item.it_num}" name="li_list">${item.it_name}
		</c:forEach>
	</div>
	<a class="btn list-inset-btn">리스트 생성</a>
	</div>

</div>
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
		let il_title = $("[name=il_title]").val();
		$.ajax({
			method : "post",
			url : '<c:url value="/program/insert"/>',
			data : {"hp_title" : hp_title,
					"hp_payment" : hp_payment,
					"il_title" : il_title},
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
		location.href = '<c:url value="/program/delete?hp_num="/>' + hp_num;
	})
</script>

<!-- 리스트 생성 -->
<script type="text/javascript">
	$(".list-inset-btn").click(function(){
		let list = getCheckedValues();
		let il_title  = $("[name=il_title]").val();
		let hp_num = $("[name=hp_num]").val();
		if(list.length == 0){
			alert("상세항목을 체크해주세요.");
			return;
		}
		if(il_title.length==0){
			alert("리스트 이름을 작성해주세요.");
			il_title  = $("[name=il_title]").val("");
		}
		if(hp_num =='none'){
			alert("")
		}
		$.ajax({
			method : "post",
			url : '<c:url value="/itemlist/insert"/>',
			data : {
				"list" : list,
				"il_title" : il_title,
				"hp_num" : hp_num
					},
			success : function (data) {
				alert(data.msg);
				il_title  = $("[name=il_title]").val("");
			}
		});
	});
</script>
</body>
</html>