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

</head>
<body>
<form action='<c:url value="/item/update"/>' method="post">
	<div class="container">
			<select name="hs_num" class="form-control">
					<option value="none">진료과를 선택해주세요</option>
				<c:forEach items="${list}" var="list">
					<option value="${list.hs_num}">${list.hs_title}</option>
				</c:forEach>
			</select>
			<div class="input-group mb-3">
				<select name="type" class="form-control">
					<option value="none">세부항목을 선택해주세요</option>
				</select>
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