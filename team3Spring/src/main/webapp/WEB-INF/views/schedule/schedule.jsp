<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery validation -->
<script src="http://fastly.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>세부 항목  수정</title>
<style type="text/css">
.container {
  margin: 20px auto;
  max-width: 800px;
  padding: 20px;
  background-color: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.list-box {
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  animation: fadeIn 0.5s ease-in-out;
}

.date-box {
  margin-top: 20px;
}

.date-box input[type="date"],
.date-box input[type="time"],
.date-box input[type="number"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-sizing: border-box;
}

.date-box input[type="date"]::-webkit-inner-spin-button,
.date-box input[type="date"]::-webkit-calendar-picker-indicator,
.date-box input[type="time"]::-webkit-inner-spin-button,
.date-box input[type="time"]::-webkit-calendar-picker-indicator {
  display: none;
}

.date-box input[type="date"]:focus,
.date-box input[type="time"]:focus,
.date-box input[type="number"]:focus {
  outline: none;
  border-color: #007bff;
}

.date-box input[type="date"]::placeholder,
.date-box input[type="time"]::placeholder,
.date-box input[type="number"]::placeholder {
  color: #6c757d;
}

.date-box input[type="date"]:hover,
.date-box input[type="time"]:hover,
.date-box input[type="number"]:hover {
  border-color: #6c757d;
}

.calendar {
  width: 300px;
  margin: 20px auto;
}

.topWrap {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 10px;
}

.monthWrap {
  font-size: 24px;
  font-weight: bold;
  margin-right: 10px;
}

.month, .year {
  color: #007bff;
}

.prevBtn, .nextBtn {
  color: #007bff;
  font-size: 24px;
  text-decoration: none;
  margin: 0 10px;
  transition: color 0.3s ease;
}

.prevBtn:hover, .nextBtn:hover {
  color: #0056b3;
}

.table {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  text-align: center;
}

.week, .gray, .today {
  padding: 10px;
  border: 1px solid #ced4da;
  background-color: #fff;
}

.today {
  background-color: #007bff;
  color: #fff;
  border-color: #007bff;
  border-radius: 50%;
  font-weight: bold;
}

.gray {
  color: #6c757d;
}

.gray.first, .gray.last {
  background-color: #f8f9fa;
}

.gray.bottom {
  border-bottom: none;
}

.gray.last.bottom {
  border-bottom: 1px solid #ced4da;
}

.gray.first, .gray.last {
  border-radius: 5px;
}

.week {
  font-weight: bold;
  background-color: #f8f9fa;
}

.prevBtn, .nextBtn {
  cursor: pointer;
}

.date-box input[type="date"],
.date-box input[type="time"],
.date-box input[type="number"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-sizing: border-box;
}

.date-box input[type="date"]::-webkit-inner-spin-button,
.date-box input[type="date"]::-webkit-calendar-picker-indicator,
.date-box input[type="time"]::-webkit-inner-spin-button,
.date-box input[type="time"]::-webkit-calendar-picker-indicator {
  display: none;
}

.date-box input[type="date"]:focus,
.date-box input[type="time"]:focus,
.date-box input[type="number"]:focus {
  outline: none;
  border-color: #007bff;
}

.date-box input[type="date"]::placeholder,
.date-box input[type="time"]::placeholder,
.date-box input[type="number"]::placeholder {
  color: #6c757d;
}

.date-box input[type="date"]:hover,
.date-box input[type="time"]:hover,
.date-box input[type="number"]:hover {
  border-color: #6c757d;
}
</style>
</head>
<body>
<div class="container">
		<h3>진료과와 프로그램을 선택후 수정 사항을 모두 기입후 번호를 눌러주세요</h3>
		<select name="hs_num" class="form-control">
				<option value="none">진료과를 선택해주세요</option>
			<c:forEach items="${list}" var="list">
				<option value="${list.hs_num}">${list.hs_title}</option>
			</c:forEach>
		</select>
		<div class="input-group mb-3">
			<select name="hp_num" class="form-control">
				<option value="none">수정할 프로그램을 선택해주세요</option>
					
			</select>
		</div>
		<div class="calendar">
			<div class="topWrap">
				<div class="monthWrap">
					<span class="year"></span>.
					<span class="month"></span>
				</div>
				<a href="#prev" class="prevBtn">&lt;</a>
				<a href="#next" class="nextBtn">&gt;</a>
			</div>
			<div class="table">
				
			</div>
		</div>
		<div class="time-box">
		   
		</div>
</div>

<!-- 프로그램 날짜를 선택하면 시간을 가져오는 메서드 -->
<script type="text/javascript">
	$("[name=hp_num]").click(function(){
		let hp_num = $("[name=hp_num]").val();
		$.ajax({
			method : "post",
			url : '<c:url value="/date/update"/>',
			data : {
				"hp_num" : hp_num
			},
			success : function(data){
				
			}
		})
	})
</script>

<!--병원 과목을 선택하면 프로그램을 가져오는 메서드  -->
<script type="text/javascript">
	
	$("[name=hs_num]").change(function(){
		let hs_num = $("[name=hs_num]").val();
		let ho = '${ho.site_id}';

		if(hs_num == 'none'){
			hs_num = 1;
			return;
		}		
		$.ajax({
			method : "post",
			url : '<c:url value="/program/updatecheck2"/>',
			data : {"hs_num" : hs_num,
					"ho" : ho},
			success : function (data) {
				let str = ``
				for(let tmp of data.hpList){
					str+=`<option value="\${tmp.hp_num}">\${tmp.hp_title}</option>`
				}	
				$("[name=hp_num]").html(str);
			}
		});
	});
</script>

<!-- 프로그램을 선택하면 날짜를 가져오는 메서드 -->
<script type="text/javascript">
	$("[name=hp_num]").change(function(){
		let hp_num = $("[name=hp_num]").val();
		$.ajax({
			method : "post",
			url : '<c:url value="/getdate"/>',
			data : {
				"hp_num" : hp_num
			},
			success : function(data){
				$(".table").empty();
				console.log(data.RSlist)
				cal(numMonth, numYear, data.RSlist)
			}
		})
	})
</script>

<!-- 달력 스크립트 -->
<script type="text/javascript">
//monthWrap
var today = new Date();
var tYear = today.getFullYear();
var tMonth = today.getMonth()+1;
var tDate = today.getDate();
var endDay= [31,28,31,30,31,30,31,31,30,31,30,31]; //각달의 마지막 날짜
var week = ['일','월','화','수','목','금','토'];
var numMonth = tMonth;
var numYear = tYear;

function cal(mon,ye, list){
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
	var output = '';
	
	for(var i=0;i<=6;i++){
		output += '<div class="week">'+ week[i] +'</div>';
	}

	for(var i=0;i<sDay;i++){
		output += '<div class="gray">'+ (last2-sDay+(i+1)) +'</div>';
	}

	for(var i=1;i<=42-sDay;i++){ 
		let da = ye +"/"+ mon+"/" + i;
		
		if(list != null){
			for(let tmp of list){
				if(tmp.rsDate == da){
					output += '<div>' + '<a class="day-btn">' + i + '</a>' + '</div>';
					i+=1;
					break;
				}
			}
		}
		output += '<div>' + i + '</div>';
		if(i==last){
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
	let hp_num = $("[name=hp_num]").val();
	$.ajax({
		method : "post",
		url : '<c:url value="/getdate"/>',
		data : {
			"hp_num" : hp_num
		},
		success : function(data){
			$(".table").empty();
			console.log(data.RSlist)
			cal(numMonth, numYear, data.RSlist)
		}
	})
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
	let hp_num = $("[name=hp_num]").val();
	$.ajax({
		method : "post",
		url : '<c:url value="/getdate"/>',
		data : {
			"hp_num" : hp_num
		},
		success : function(data){
			$(".table").empty();
			console.log(data.RSlist)
			cal(numMonth, numYear, data.RSlist)
		}
	})
});

</script>
</body>
</html>