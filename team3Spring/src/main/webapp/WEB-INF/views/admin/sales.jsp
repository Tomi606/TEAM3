<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 금액 확인</title>
<style type="text/css">
.btn {
  display: inline-block;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #007bff;
  color: #fff;
  font-size: 16px;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

/* 버튼 호버 효과 */
.btn:hover {
  background-color: #0056b3;
}

/* 버튼 클릭 효과 */
.btn:active {
  background-color: #004080;
}
.all-box{
	width: 100%;
	margin-top: 100px;
	/* border: 1px solid black; */
	height: 800px;
    margin-bottom: 50px;
	padding: 20px 20px;
	box-shadow: 0 1px 5px 2px rgba(0, 0, 0, 0.2);
	border-radius: 15px;

}

.table thead th {
	text-align: center;
    border-bottom: 2px solid #dee2e6;
}

.table td {
	text-align: center;
}
</style>
</head>
<body>
<!-- 전체 병원 조회 박스 -->
<div class="all-box container">

	
	<table class="table table-hover" >
		<thead>
			<tr>
				<th>번호</th>
				<th>병원 아이디</th>
				<th>예약자 아이디</th>
				<th>프로그램 명</th>
				<th>가격</th>				
				<th>예약 날짜</th>
				<th>결재 날짜</th>
			</tr>
		</thead>
		<tbody class="box-hospital-list" id="reservation_table">
			<c:forEach items="${list}" var="list">
				<tr>
					<th>${list.rv_num}</th>
					<th>${list.reservationScheduleVO.program.hp_ho_id}</th>
					<th>${list.reservationScheduleVO.program.hp_title}</th>
					<th>${list.reservationScheduleVO.program.payMentMoney}</th>
					<th>${list.reservationScheduleVO.program.payMentMoney}</th>
					<th>${list.changeDate}</th>
					<th>${list.reservationScheduleVO.rsDate}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="box-pagination">
		<ul class="pagination justify-content-center"></ul>
	</div>
</div>
</body>

</html>