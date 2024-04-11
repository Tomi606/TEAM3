<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
 

</style>
</head>
<body>
	<h1>회원가입</h1>
	<a href="<c:url value='/member/signup'/>">개인 회원가입</a>
	<a href="<c:url value='/main/certification'/>">사업자 회원가입</a>
</body>
</html>