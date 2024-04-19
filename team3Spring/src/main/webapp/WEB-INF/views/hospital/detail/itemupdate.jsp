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
<div class="container">
	<form action='<c:url value="/item/update"/>' method="post">
		<div class="input-group mb-3">
			<select name="type" class="form-control">
				<c:forEach items="${itemList}" var="list">
					<option value="${list.it_num}">${list.it_name}</option>
				</c:forEach>
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
	</form>

</div>
</body>
</html>