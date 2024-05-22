<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 error</title>
<style type="text/css">
.error-img {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
<div style='width: 1950px;'>
	<div style="display: flex;width: 100%;">
			<img alt="로고이미지" class="error-img" src="<c:url value='/resources/img/500errorImg.png'/>">
			<div style="width: 200px;margin: 0 auto;position: absolute;">
				<a href="<c:url value='/'/>" style='text-decoration: none;' 
				>홈으로</a>
			</div>
	</div>
</div>
</body>
</html>