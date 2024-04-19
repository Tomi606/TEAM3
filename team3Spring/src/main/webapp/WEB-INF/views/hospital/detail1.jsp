<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
    /* 스타일링 */
    .calendar {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .calendar li {
        display: inline-block;
        width: calc(100% / 7);
        text-align: center;
        padding: 10px;
        border: 1px solid #ccc;
    }

    .calendar .header {
        background-color: #f0f0f0;
        font-weight: bold;
    }

    .calendar .weekend {
        color: red;
    }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
	<body>
		<div class="calendar">
			<div class="topWrap">
				<div class="monthWrap">
					<span class="year"></span>.
					<span class="month"></span>
				</div>
			<!-- 	<a href="#prev" class="prevBtn"><img src="images/prev_btn.png" alt="이전버튼" /></a>
				<a href="#next" class="nextBtn"><img src="images/next_btn.png" alt="다음버튼" /></a> -->
			</div>
			<div class="table">
				
			</div>
		</div>
	</body>
	<ul class="calendar">
    <li class="header">일</li>
    <li class="header">월</li>
    <li class="header">화</li>
    <li class="header">수</li>
    <li class="header">목</li>
    <li class="header">금</li>
    <li class="header weekend">토</li>
</ul>
<script>
    // 달력을 생성하는 함수
    function createCalendar(year, month) {
        const daysInMonth = new Date(year, month + 1, 0).getDate();
        const firstDayOfMonth = new Date(year, month, 1).getDay();
        const calendar = document.querySelector('.calendar');

        // 기존 달력 요소 제거
        calendar.innerHTML = '';

        // 요일 헤더 추가
        for (let i = 0; i < 7; i++) {
            const dayHeader = document.createElement('li');
            dayHeader.textContent = ['일', '월', '화', '수', '목', '금', '토'][i];
            calendar.appendChild(dayHeader);
        }

        // 빈 요일 채우기
        for (let i = 0; i < firstDayOfMonth; i++) {
            const emptyDay = document.createElement('li');
            calendar.appendChild(emptyDay);
        }

        // 날짜 추가
        for (let i = 1; i <= daysInMonth; i++) {
            const day = document.createElement('li');
            day.textContent = i;
            calendar.appendChild(day);
        }
    }

    // 현재 날짜를 기준으로 달력 생성
    const currentDate = new Date();
    const currentYear = currentDate.getFullYear();
    const currentMonth = currentDate.getMonth();
    createCalendar(currentYear, currentMonth);
</script>
</html>