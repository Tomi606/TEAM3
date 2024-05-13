<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery validation -->
<script src="http://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="http://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<title>세부 항목  수정</title>
<style type="text/css">
/* 헤더 */
.home-box1 {
	width: 100%;
	height: 500px;
	background: url('<c:url value="/resources/img/white_pattern.jpg"/>');
	background-repeat: no-repeat;
	background-size: cover;
    background-origin: content-box;
}

.page-title{
	color:rgba(0, 100, 60, 0.8);
	text-align: left;
	font-size: 50px;
	font-weight: bold;
	margin: 0 0 80px 0;
}

/* 전체 툴 */
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

.label {
	color: #555;
    text-align: center;
    font-size: 23px;
    font-weight: bold;
}

.hr_line {
	margin: 30px auto;
	padding: 50px auto;
}

.update-btn {
    border-radius: 5px;
    line-height: 45px;
    margin: 0 auto;
    border: 1px solid green;
    width: 20%;
    height: 50px;
    color: green;
    text-decoration: none;
    font-size: 20px;
    display: flex;
    align-items: center;
    justify-content: space-around;
    margin-top: 20px;
}

.update-btn:hover {
	color: white;
	background: green;
	border: 0px solid white;
	border-radius: 5px;
}
</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px;">
		<div class="page-title">
			프로그램 수정
		</div>
	</div>
</div>
<div class="container">
	<div class="select_subject_box">
		<label class="label">수정할 진료과를 선택하세요</label>
		<select name="hs_num" class="form-control">
				<option value="none">진료과를 선택해주세요</option>
			<c:forEach items="${list}" var="list">
				<option value="${list.hs_num}">${list.hs_title}</option>
			</c:forEach>
		</select>
	</div>
	
	<hr class="hr_line">
	
	<div class="select_program_box">
		<label class="label">수정할 진료과를 선택하세요</label>
		<select name="hp_num" class="form-control">
			<option value="none">수정할 프로그램을 선택해주세요</option>
		</select>
	</div>
	
	<hr class="hr_line">
	
	<div>
		<label class="label" for="hp_title">새로운 프로그램 이름을 정해주세요</label>
		<input class="form-control" placeholder="프로그램 입력해주세요" name="hp_title">
	</div>
	
	<hr class="hr_line">
	
	<div>
		<label class="label" for="hp_payment">프로그램 가격을 변경해주세요</label>
		<input type="number" class="form-control" placeholder="프로그램 가격 입력해주세요" name="hp_payment">
	</div>
	<div class="check-box-group" id="check-box-group">	
	</div>
	<button class="btn update-btn">프로그램 수정</button>

</div>

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
				let str2 = ``
				for(let tmp of data.hpList){
					str+=`<option value="\${tmp.hp_num}">\${tmp.hp_title}</option>`
				}	
				for(let tmp of data.itemList){
					str2+=`<input type="checkbox" value="\${tmp.it_num}" name="li_list">\${tmp.it_name}`
				}
				$("[name=hp_num]").html(str);
				$(".check-box-group").html(str2);
			}
		});
	});
</script>

 <script type="text/javascript">
	$(".update-btn").click(function(){
		let hp_num = $("[name=hp_num]").val();
		let hp_title = $("[name=hp_title]").val();
		let hp_payment = $("[name=hp_payment]").val();
		let list = getCheckedValues();
		let hs_num = $("[name=hs_num]").val();
		if(hs_num == 'none'){
			alert("과를 선택해주세요");
			return;
		}
		if(hp_num == 'none'){
			alert("수정할 프로그램을 선택해주세요");
			return;
		}
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
			url : '<c:url value="/program/update"/>',
			data : {
						"hp_num" : hp_num,
						"hp_title" : hp_title,
						"hp_payment" : hp_payment,
						"list" : list,
						"hs_num" : hs_num
					},
			success : function (data) {
									
			}
		});
	});
	
	//체크된 리스트 가져오기
	function getCheckedValues() {
	    var checkedValues = new Array(); // 체크된 값들을 담을 배열
	    $("input[name='li_list']:checked").each(function() {
	        checkedValues.push($(this).val());
	    });
	    return checkedValues;
	}
</script>
</body>
</html>