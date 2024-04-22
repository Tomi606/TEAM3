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
	<form action='<c:url value="/program/update"/>' method="post">
		<div class="input-group mb-3">
			<select name="hp_num" class="form-control">
				<c:forEach items="${programList}" var="list">
					<option value="${list.hp_num}">${list.hp_title}</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<label for="hp_title"> 새로운 프로그램 이름을 정해주세요</label>
			<input class="form-control" placeholder="프로그램 입력해주세요" name="hp_title">
		</div>
		<div>
			<label for="hp_payment"> 프로그램 가격을 변경해주세요</label>
			<input type="number" class="form-control" placeholder="프로그램 가격 입력해주세요" name="hp_payment">
		</div>
		<button class="btn" type="submit">항목 수정</button>
	</form>

</div>

</body>
</html>