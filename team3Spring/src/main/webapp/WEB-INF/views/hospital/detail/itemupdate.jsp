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
	color: rgb(12, 12, 12);
    text-align: center;
    font-size: 30px;
    margin-right: 10px;
    font-weight: bold;
}


</style>
</head>
<body>
<div class="home-box1">
	<div style="width: 80%; margin: 0 auto; padding-top: 80px;">
		<div class="page-title">
			세부항목 수정
		</div>
	</div>
</div>
<form action='<c:url value="/item/update"/>' method="post">
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
			
			<div class="select_detail_box">			
				<select name="type" class="form-control">
					<option value="none">세부항목을 선택해주세요</option>
				</select>
			</div>
			<div class="input-group mb-3">
			</div>
			<div>
				<label for="it_name">세부 항목을 수정해주세요</label>
				<input class="form-control" placeholder="항목이름을 입력해주세요" name="it_name">
			</div>
			<div>
				<label for="it_explanation">세부 항목 설명을 수정해주세요</label>
				<input class="form-control" placeholder="항목 설명을 입력해주세요" name="it_explanation">
			</div>
			<button class="btn" type="submit">항목 수정</button>
	</div>
</form>
<script type="text/javascript">
	$("[name=hs_num]").change(function(){
		let hs_num = $("[name=hs_num]").val();
		if(hs_num == 'none'){
			hs_num = 1;
		}
		$.ajax({
			method : "post",
			url : '<c:url value="/subject/item"/>',
			data: {
				"hs_num": hs_num
			},
			success : function (data) {
				let str = ``;
				for(let tmp of data.itemList){
					str += 
						`
							<option value="\${tmp.it_num}">\${tmp.it_name}</option>
						`
				}
				$("[name=type]").html(str);
			}
		})		
	})
	
</script>
</body>
</html>