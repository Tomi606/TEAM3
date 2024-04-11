<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery validation -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<title>커뮤니티 메인</title>

</head>
<body>
<div class="container">
	<h1>커뮤니티 메인</h1>
	<div class="input-group mb-3">
		<select name="type" class="form-control">
			<c:forEach items="${list}" var="list">
				<option value="${list.bo_num}">${list.bo_title }</option>
			</c:forEach>
		</select>
	</div>
	<a class="btn add-btn" href="<c:url value="/community/insert"/>">게시판 등록</a>
	<a class="btn update-btn">게시판 수정</a>
	<a class="btn delete-btn">게시판 삭제</a>
	<div class="input-group mb-3">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody class="posttbody">
				
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">

/* 컨트롤러에게 현재 선택한 보드 번화가 뭔지 알려주기 위한 메서드 */
$('.update-btn').click(function(){
    let bo_num = $("[name=type]").val();
    let url = '<c:url value="/community/update"/>' + '?bo_num=' + bo_num;
    location.href = url;
});

/* 컨트롤러에게 현재 선택한 보드 번화가 뭔지 알려주기 위한 메서드 게시판 삭제*/
$('.delete-btn').click(function(){
    let bo_num = $("[name=type]").val();
    let url = '<c:url value="/community/delete"/>' + '?bo_num=' + bo_num;
    location.href = url;
});

/* 게시판이 바뀔떄마다 그 게시판에 맞는 게시글을 가지고 옴 */
$('[name=type]').click(function(){
	let bo_num = $("[name=type]").val();
	$.ajax({
		url : '<c:url value="/post" />',
		type : 'get',
		data : {"bo_num" : bo_num},
		success: function(data) {
			let str = ``;
			for(let tmp of data){
				console.log(tmp)
				str+=
					`
					<tr>
						<th>\${tmp.po_num}</th>
						<th>\${tmp.po_title}</th>
						<th>\${tmp.sitemanagement.site_id}</th>
					</tr>
					`
			}
			$('.posttbody').html(str);
		}
	})
})
</script>
</body>
</html>