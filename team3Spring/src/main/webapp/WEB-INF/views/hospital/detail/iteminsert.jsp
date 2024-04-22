<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
.check-box-group{
	border: 1px red solid;
	width: 1000px; height: 100px;
}

.input-box-group{
	flex-direction: row;
}
</style>
</head>
<body>
<!-- 중복확인 버튼 때문에 불 필요한 여백 발생하는중 고쳐야 함 -->
<h3>세부 항목 등록</h3>
<div class="input-box-group">
	<label for="it_name">세부 항목</label>
    <input  type="text" id="it_name" name="it_name" placeholder="등록하고 싶은 항목을 입력하세요" autofocus="autofocus">
    <label for="it_explanation">세부 항목설명</label>
    <input type="text" name="it_explanation" placeholder="세부 항목의 설명">
    <a class="btn item-inset-btn">등록</a>
    <a class="btn item-update-btn" href='<c:url value="/item/update"/>'>수정</a>
    <a class="btn item-delete-btn">삭제</a>
</div>
<br>

<div class="hr" style="margin-top:30px;margin-bottom:40px;border: 1px solid #d2d2d2;width: 1500px; margin: 0 auto"></div>

<h3>프로그램 등록</h3>
<div class="input-box-group">
	<label for="hp_title">프로그램 이름</label>
    <input  type="text" id="hp_title" name="hp_title" placeholder="프로그램 이름을 입력하세요">
	<label for="hp_payment">프로그램 가격</label>
    <input  type="text" id="hp_payment" name="hp_payment" placeholder="프로그램 가격을 입력하세요">
    <a class="btn program-inset-btn">등록</a>
    <a class="btn program-update-btn" href='<c:url value="/program/update"/>'>수정</a>
    <a class="btn item-delete-btn">삭제</a>
</div>
<br>

<div class="hr" style="margin-top:30px;margin-bottom:40px;border: 1px solid #d2d2d2;width: 1500px; margin: 0 auto"></div>

<h3>프로그램 등록</h3>
<br>
<div class="hr" style="margin-top:30px;margin-bottom:40px;border: 1px solid #d2d2d2;width: 1500px; margin: 0 auto"></div>

<label for="item">세부 항목</label>
<input  type="text" id="item" name="hp_title" placeholder="프로그램명을 입력하세요" autofocus="autofocus" class="input-tag">

<div class="check-box-group" id="check-box-group">
	<c:forEach items="${itemList}" var="item">
		<input type="checkbox" value="${item.it_num}" name="li_list">${item.it_name}
	</c:forEach>
</div>
<button class="btn list-btn">리스트 만들기</button>



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

function getCheckedValues() {
       var checkedValues = new Array(); // 체크된 값들을 담을 배열
       $("input[name='li_list']:checked").each(function() {
           checkedValues.push($(this).val());
       });
       return checkedValues;
   }

</script>
<!-- 기타 함수 -->
<script type="text/javascript">
function isNumber(value) {
    return !isNaN(value) && !isNaN(parseFloat(value));
}
</script>

<!-- 프로그램 등록 -->
 <script type="text/javascript">
	$(".program-inset-btn").click(function(){
		let hp_title = $("[name=hp_title]").val();
		let hp_payment = $("[name=hp_payment]").val();
		if(!isNumber(hp_payment)){
			alert("가격을 제대로 입력해주세요.");
			return;
		}
		$.ajax({
			method : "post",
			url : '<c:url value="/program/insert"/>',
			data : {"hp_title" : hp_title,
					"hp_payment" : hp_payment},
			success : function (data) {
				console.log(data);
			}
		});
	});
	
	
</script>

>

</body>
</html>