<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 조회</title>
</head>
<body>
	<div class="input-group mb-3" id="programBox">
		<select name="hp_num" class="form-control">
				<option value="none">프로그램을 선택해주세요</option>
			<c:forEach items="${programList}" var="list">
				<option value="${list.hp_num}">${list.hp_title}</option>
			</c:forEach>
		</select>
		<a class="btn check-btn">조회</a>
	</div>
	
	<div class="input-group mb-3" id="itemListBox">
		<select name="il_num" class="form-control itemList">
				<option value="none">리스트 선택해주세요</option>
		</select>
	</div>
	
	<div class="check-box-group check-box" id="check-box-group">
			
	</div>
</body>

<!-- 아이템 리스트 출력 -->
<script type="text/javascript">
	$(".check-btn").click(function(){
		let hp_num = $("[name=hp_num]").val();
		$.ajax({
			url : '<c:url value="/itemlist/check"/>',
			method : "post",
			data : {
				"hp_num" : hp_num	
			},
			success : function (data) {
				str = ``;
				for(let tmp of data.itemListList){
					str+=
						`
							<option value="\${tmp.il_num}">\${tmp.il_title}</option>
						`
				}
				$(".itemList").html(str);
			}
		});		
	});
</script>

<script type="text/javascript">
$(".itemList").change(function(){
	let il_num = $("[name=il_num]").val();
	$.ajax({
		url : '<c:url value="/item/check"/>',
		method : "post",
		data : {
			"il_num" : il_num	
		},
		success : function (data) {
			console.log(data.itemList);
			$(".check-box").empty()
			str = ``;
			for(let tmp of data.itemList){
				str+=
					`
						<input type="checkbox" value="\${tmp.it_num}" name="li_list"> \${tmp.it_name}
					`
				$(".check-box").add(str);
			}
		}
	});		
});
</script>
</html>