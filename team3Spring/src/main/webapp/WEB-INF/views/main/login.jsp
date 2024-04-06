<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
 

</style>
</head>
<body>
	<h1>로그인</h1>
	<a href="<c:url value='/member/login'/>">개인 로그인</a>
	<a href="<c:url value='/hospital/login'/>">사업자 로그인</a>
</body>
</html>