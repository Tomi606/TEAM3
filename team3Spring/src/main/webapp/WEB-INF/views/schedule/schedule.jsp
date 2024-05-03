<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery validation -->
<script src="http://fastly.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="http://fastly.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<script src="http://fastly.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<title>세부 항목  수정</title>
<style type="text/css">
.day-btn:hover{
cursor: pointer;
}
.container {
  margin: 20px auto;
  max-width: 800px;
  padding: 20px;
  background-color: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  align-items: center;
}

h3 {
  margin-bottom: 20px;
}

.calendar {
  width: 100%;
  margin-top: 20px;
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

.month,
.year {
  color: #007bff;
}

.prevBtn,
.nextBtn {
  color: #007bff;
  font-size: 24px;
  text-decoration: none;
  margin: 0 10px;
  transition: color 0.3s ease;
}

.prevBtn:hover,
.nextBtn:hover {
  color: #0056b3;
}

.table {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  text-align: center;
}

.week,
.gray,
.today {
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

.gray.first,
.gray.last {
  background-color: #f8f9fa;
}

.gray.bottom {
  border-bottom: none;
}

.gray.last.bottom {
  border-bottom: 1px solid #ced4da;
}

.gray.first,
.gray.last {
  border-radius: 5px;
}

.week {
  font-weight: bold;
  background-color: #f8f9fa;
}

.time-list-box {
  width: 100%;
  margin-top: 20px;
}

.time-box {
  margin-bottom: 10px;
  padding: 10px;
  background-color: #f8f9fa;
  border: 1px solid #ced4da;
  border-radius: 5px;
}
.time-box a {
  text-decoration: none;
  color: inherit;
}

.time-box:hover {
  background-color: #e9ecef;
  cursor: pointer;
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
		<div class="date-box">
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
			<div class="time-list-box">
			   
			</div>
		</div>
</div>

<!--병원 과목을 선택하면 프로그램을 가져오는 메서드  -->
<script type="text/javascript">
	$("[name=hs_num]").click(function(){
		let hp_num = $("[name=hp_num]").val();
		let hs_num = $("[name=hs_num]").val();
		if(hs_num == 'none'){
			hs_num = 1;
		}
		let ho = '${ho.site_id}';
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
	$("[name=hp_num]").click(function(){
		let hp_num = $("[name=hp_num]").val();
		let hs_num = $("[name=hs_num]").val();
		if(hp_num == 'none'){
			hp_num = 1;
		}
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

<!-- 날짜를 클릭하면 이벤트 발생 -->
<script type="text/javascript">
$(document).on("click", ".day-btn", function(){
	let rs_num = $(this).data("target");
	console.log(rs_num)
	$.ajax({
		method : "post",
		url : '<c:url value="/gettime"/>',
		data : {
			"rs_num" : rs_num
		},
		success : function(data){
			console.log(data)
			let str = ``;
			for(let tmp of data.timeList){
				str+= 
					`
						<div class="time-box">
							<a class="">\${tmp.rsTime}</a>
						</div>
					`
			}
			$(".time-list-box").html(str);
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
					output += '<div>' + `<a class="day-btn" data-target="\${tmp.rs_num}">` + i + '</a>' + '</div>';
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
	let hp_num = $("[name=hp_num]").val();
	let hs_num = $("[name=hs_num]").val();
	if(hp_num == 'none' || hs_num == 'none'){
		alert("예약된 스케줄이 없습니다.");
		return;
	}
	$('.table').empty();
	if(numMonth==1){
		numMonth = 12;
		numYear--;
	}else{
		numMonth--;
	}
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
	let hp_num = $("[name=hp_num]").val();
	let hs_num = $("[name=hs_num]").val();
	if(hp_num == 'none' || hs_num == 'none'){
		alert("예약된 스케줄이 없습니다.");
		return;
	}
	$('.table').empty();
	if(numMonth==12){
		numMonth = 1;
		numYear++;
	}else{
		numMonth++;
	}
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