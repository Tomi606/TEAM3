<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>
<c:forEach var="it" items="${itemListList }">
<tr>
    <td>${it.item.it_name}</td>
    <td>${it.item.it_explanation}</td>
    <td>${it.hospital_program.hp_payment}</td>
</tr>
</c:forEach>
</body>
</html>