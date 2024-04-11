<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 대기 회원 조회</title>
<style type="text/css">
.wait-report-box{
	padding: 50px;
	text-align: center;
}
.waiting-box{
	width: 30%;
	height: 300px;
	border: 1px solid gray;
	border-radius: 20px;
	display: inline-block;
	margin-right: 50px;
	padding: 10px;
}
.report-box{
	width: 30%;
	height: 300px;
	border: 1px solid gray;
	border-radius: 20px;
	display: inline-block;
	padding: 10px;
}
.all-box{

}
</style>
</head>
<body>
<!-- 전체 병원 조회 박스 -->
<div class="all-box container mt-3">
	<h2>대기 병원 리스트</h2>
	<!-- 검색 -->
	<div>
		
	</div>
	<table class="table table-hover mt-3">
		<thead>
			<tr>
				<th>아이디</th>
				<th>상호명</th>
				<th>사업자 번호</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>소재지</th>
				<th>승인/거절</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>John</td>
				<td>Doe</td>
				<td>Doe</td>
				<td>john@example.com</td>
				<td>john@example.com</td>
				<td>john@example.com</td>
				<td><button>승인</button><button>거절</button></td>
			</tr>
		</tbody>
	</table>
</div>

<script type="text/javascript">

</script>
</body>
</html>