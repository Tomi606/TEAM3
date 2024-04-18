<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 상세 페이지 - 하단</title>
<style type="text/css">
* {
    padding: 0;
    margin: 0;
    color: #666666;
}

li {
    list-style: none;
}

a {
    text-decoration: none;
}

table {
    border-spacing: 0;
    border-collapse: collapse;
}

.calendar {
    width: 580px;height:100%;
    padding: 10px;
    box-sizing: border-box;
    margin-bottom: 40px; /* 변경된 부분 */
}
.calendar-container{
	width: 580px;height: 100%;display:flex; 
	margin: auto;
}

.time-box{
	width: 500px;
	height: 500px;
	border: solid 1px red;
}

.topWrap {
    width: 100%;
    height: 70px;
    line-height: 69px;
    text-align: center;
    border: 1px solid #666666;
    border-bottom: none;
    box-sizing: border-box;
    font-weight: bold;
    font-size: 30px;
    position: relative;
}

.calbox{
	background-color: red;
}

.topWrap span {
    font-weight: bold;
    font-size: 30px;
}

.topWrap .prevBtn {
    position: absolute;
    top: 5px;
    left: 180px;
}

.topWrap .nextBtn {
    position: absolute;
    top: 5px;
    right: 180px;
}

.topWrap img {
    height: 30px;
}

.table {
    position: relative; /* 변경된 부분 */
}

.table > * {
    position: relative; /* 변경된 부분 */
}

.table div {
    float: left;
    width: 80px;
    height: 80px;
    box-sizing: border-box;
    border: 1px solid #666666;
    border-right: none;
    border-bottom: none;
    text-align: right;
    padding-right: 10px;
    line-height: 30px;
    cursor: pointer;
}

.table div.last {
    border-right: 1px solid #666666;
    color: blue;
}

.table div.first {
    color: red;
}

.table div.bottom {
    border-bottom: 1px solid #666666;
}

.table div.today {
    background-color: navy;
    color: #FFFFFF;
}

.table div.gray {
    color: #CCCCCC;
}

.table div.on {
    background-color: #666666;
    color: #FFFFFF;
}

.table .week {
    float: left;
    width: 80px;
    height: 40px;
    box-sizing: border-box;
    border: 1px solid #666666;
    padding-right: 0px;
    border-right: none;
    border-bottom: none;
    text-align: center;
    line-height: 39px;
    font-weight: bold;
    cursor: default;
}

.table .week.last {
    color: #666666;
}

.table .week.first {
    color: #666666;
}

.toggle-button {
    padding: 10px 20px;
    margin: 10px;
    font-size: 16px;
    cursor: pointer;
}

.page {
    display: none;
    padding: 20px;
    border: 1px solid #ccc;
}

.page.active {
    display: block;
}
.detail-home{
text-align: center;
}


</style>
</head>
<body>
 <div class="detail-home">
 <div class="calendar-container">
	<div class="calendar">
		<div class="topWrap">
			<div class="monthWrap">
				<span class="year"></span>. <span class="month"></span>
			</div>
		<a href="#prev" class="prevBtn">&lt;</a>
		<a href="#next" class="nextBtn">></a>
		</div>
		<div class="table"></div>
	</div>
	<div class = "time-box">
	</div>
</div>
	<div class="hr"
		style="margin-top: 30px; margin-bottom: 40px; border: 1px solid #d2d2d2; width: 1500px; margin: 0 auto"></div>
	<h1>병원 상세 페이지 - 하단</h1>
	<div class="toggle-btn">
		<button id="btn1" class="toggle-button">병원 소개</button>
		<button id="btn2" class="toggle-button">진료 과목</button>
		<button id="btn3" class="toggle-button">리뷰</button>
	</div>
	<div class="toggle-page">
		<form action='<c:url value="/hospital/info"/>' method="post"
			id="page1" class="page active">
			<h1>병원 소개 페이지</h1>
			<div class="hospital-info">
				<label for="hospital-info">병원 소개</label>
				<textarea id="hospital-info" rows="4" cols="50"></textarea>
			</div>
			<div class="hospital-map">
				<label for="hospital-map">지도</label>
			</div>
			<button type="submit">병원 소개 등록</button>
		</form>

		<form action='<c:url value="/hospital/subject"/>' method="post"
			id="page2" class="page">
			<h1>진료 과목 페이지</h1>
			<div class="subject-represent">
				<label for="subject-represent">대표 진료 과목</label>
				<div class="subject-checkbox">
					<c:forEach items="${hsList}" var="hs">
						<input type="checkbox" name="subject" value="${hs.hs_num}">${hs.hs_title}
	        	</c:forEach>
				</div>
			</div>
			<div>
				<label for="subject-detail">상세 진료 항목</label>
				<textarea id="subject-detail" rows="4" cols="50"
					placeholder="감염성 질환 / 알레르기 / 만성 질환 / 호흡기 질환 / 피부 질환..."></textarea>
			</div>
			<button class="subject-btn" type="submit">진료 과목 등록</button>
		</form>

		<form action='<c:url value="/hospital/review"/>' method="post"
			id="page3" class="page">
			<h1>리뷰 페이지</h1>
			<label for="review">리뷰 등록</label>
			<textarea id="review" rows="4" cols="50"></textarea>
			<button type="submit">리뷰 등록</button>
		</form>
	</div>
</div>
</body>


<script type="text/javascript">

$.ajax({
    url: '<c:url value="/detail2"/>',
    type: 'post',
    success: function(data) {
    	displaycal(data); // 받은 데이터를 표시하는 함수 호출
    },
    error: function(xhr, status, error) {
        console.error('요청에 실패했습니다.');
    }
});

function displaycal(data){
	
	$(document).ready(function(){
		//monthWrap
		var today = new Date();
		var tYear = today.getFullYear();
		var tMonth = today.getMonth()+1;
		var tDate = today.getDate();
		var endDay= [31,28,31,30,31,30,31,31,30,31,30,31]; //각달의 마지막 날짜
		var week = ['일','월','화','수','목','금','토'];
		var numMonth = tMonth;
		var numYear = tYear;
		function cal(mon,ye){
			var sDate = new Date(ye,mon-1,1); //이번달의 1일
			var sDay = sDate.getDay(); //이번달 1일의 요일
			var last = endDay[mon-1]; //이번달 마지막 날짜
			
			//윤달일 경우의 마지막 날짜
			//윤달 계산 4년마다 29일, 100년는 28일, 400년 째는 29일
			if(mon==2 && (ye%400==0 || (ye%4==00 && ye%100!=0) )){
				last = 29;
			}
			var last2 = endDay[mon-2]; //전달 마지막 날짜
			if(mon==1){ //1월이라면 전월이 12월의 마지막 날짜인 31일로 처리
				last2 = 31;
			}

			var etc = 42 - sDay - last;
			
			$('.calendar .year').html(ye);
			if(mon<10){
				mon = '0' + mon;
			}
			$('.calendar .month').html(mon);
			
			//요일을 담는 배열변수
			var week = ['일','월','화','수','목','금','토'];

			//div태그를 담는 변수
			var output = ``;
			
			for(var i=0;i<=6;i++){
				output += '<div class="week">'+ week[i] +'</div>';
			}
			
			for(var i=0;i<sDay;i++){
				output += '<div class="gray">'+ (last2-sDay+(i+1)) +'</div>';
			}
			
			 for (var i = 1; i <= 42 - sDay; i++) {
			    var str = ye + "/" + mon + "/" + i;
			    var bool = false;
			    for(let tmp of data.dateList){
			        if (tmp.rsDate === str) {
			            output += `<div class="calbox">` + `<a href="#" name="rsDate" class="rsDate" data-str="\${str}">` + i + `</a>` + `</div>`;
			            bool = true;
			            break; // 내부 반복문 종료
			        }
			    }
				if(!bool){
			    	output += '<div>' + i + '</div>';					
				}
			    if (i == last) {
			        break;
			    }
			} 
			
			for(var i=1;i<=etc;i++){
				output += '<div class="gray">' + i +'</div>';
			}

			$('.table').append(output);
			$('.table > div').each(function(index){
				if(index%7==0){
					$(this).addClass('first');
				}
				if( index==6 || index==13 || index==20 || index==27 || index==34 || index==41 || index==48){
					$(this).addClass('last');
				}
				if(index>=42){
					$(this).addClass('bottom');
				}
				var num = $(this).html();
				var c = $(this).attr('class');
				if(num==tDate && c!='gray' && c!='gray first' && c!='gray last' && c!='gray last bottom' && mon==tMonth && ye==tYear){
					$(this).addClass('today');
				}
			});
			
		}
		
		$(document).on('click', '.rsDate',function(event) {
		    event.preventDefault(); // 기본 동작(링크 이동) 막기
		    // 클릭된 a 태그의 data-str 속성에서 str 값을 가져와서 href에 설정
		    var strValue = $(this).data('str');
		    $.ajax({
		        url: '<c:url value="/detail/date"/>',
		        type: 'get',
		        data : {"str" : strValue},
		        success: function(data) {
		        	for(let tmp of data.timeList){
		        		console.log(tmp.rsTime);
		        	}
		        	//displaycal(data); // 받은 데이터를 표시하는 함수 호출
		        },
		        error: function(xhr, status, error) {
		            console.error('요청에 실패했습니다.');
		        }
		    });

		});
		
		cal(numMonth,numYear);
		
		
		//이전버튼 클릭
		$('.prevBtn').click(function(){
			$('.table').empty();
			if(numMonth==1){
				numMonth = 12;
				numYear--;
			}else{
				numMonth--;
			}
			cal(numMonth,numYear);
		});
		
		//다음버튼 클릭
		$('.nextBtn').click(function(){
			$('.table').empty();
			if(numMonth==12){
				numMonth = 1;
				numYear++;
			}else{
				numMonth++;
			}
			cal(numMonth,numYear);
		});
		
	});
}

</script>



<!-- 토글 버튼 -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	let btn1 = document.getElementById('btn1');
	let btn2 = document.getElementById('btn2');
	let btn3 = document.getElementById('btn3');
	
	btn1.addEventListener('click', function() {
		activatePage(page1);
	});
	
	btn2.addEventListener('click', function() {
		activatePage(page2);
	});
	
	btn3.addEventListener('click', function() {
		activatePage(page3);
	});
	
	function activatePage(page) {
		//모든 화면의 active 클래스 제거
		document.querySelectorAll('.page').forEach(p => {
			p.classList.remove('active');
		});
		
		//선택한 화면에 active 클래스 추가
		page.classList.add('active');
	}
});
</script>

</html>