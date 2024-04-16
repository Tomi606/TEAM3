<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
*{ padding: 0; margin: 0; color: #666666; }
li{ list-style: none; }
a{ text-decoration: none; }
table{ border-spacing: 0; border-collapse: collapse; }

.calendar{ width: 580px; padding: 10px; box-sizing: border-box; }
.topWrap{ width: 100%; height: 70px; line-height: 69px; text-align: center; border: 1px solid #666666; border-bottom: none;  box-sizing: border-box; font-weight: bold; font-size: 30px; position: relative;  }
.topWrap span{ font-weight: bold; font-size: 30px; }
.topWrap .prevBtn{ position: absolute; top: 5px; left: 180px; }
.topWrap .nextBtn{ position: absolute; top: 5px; right: 180px; }
.topWrap img { height: 30px; }
.table div{ float: left; width: 80px; height: 80px; box-sizing: border-box; border: 1px solid #666666; border-right: none; border-bottom: none; text-align: right; padding-right: 10px; line-height: 30px; cursor: pointer; }
.table div.last{ border-right: 1px solid #666666; color: blue; }
.table div.first{ color: red; }
.table div.bottom{ border-bottom: 1px solid #666666; }
.table div.today{ background-color: navy; color: #FFFFFF; }
.table div.gray{ color: #CCCCCC; }
.table div.on{ background-color: #666666; color: #FFFFFF; }/* 클릭활성화 */
.table .week{ float: left; width: 80px; height: 40px; box-sizing: border-box; border: 1px solid #666666;  padding-right: 0px; border-right: none; border-bottom: none; text-align: center; line-height: 39px; font-weight: bold; cursor: default; }
.table .week.last{ color: #666666; }
.table .week.first{ color: #666666; }
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
<script type="text/javascript">
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
		var output = '';
		
		for(var i=0;i<=6;i++){
			output += '<div class="week">'+ week[i] +'</div>';
		}

		for(var i=0;i<sDay;i++){
			output += '<div class="gray">'+ (last2-sDay+(i+1)) +'</div>';
		}

		for(var i=1;i<=42-sDay;i++){ 
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
		
		//클릭한 날의 날짜 경고창
		$('.table > div:not(.gray)').click(function(){
			var dateText = $(this).html();
			var monthText = numMonth;
			if(monthText<10){
				monthText = '0' + monthText;
			}
			if(dateText<10){
				dateText = '0' + dateText;
			}

				
			
			if(dateText>=tDate && ye==tYear && mon==tMonth){
				$('.table > div').removeClass('on');
				$(this).addClass('on');
				alert(numYear + '년 ' + monthText + '월 ' + dateText + '일');
			}else if(ye>tYear){
				$('.table > div').removeClass('on');
				$(this).addClass('on');
				alert(numYear + '년 ' + monthText + '월 ' + dateText + '일');
			}else if(mon>tMonth){
				$('.table > div').removeClass('on');
				$(this).addClass('on');
				alert(numYear + '년 ' + monthText + '월 ' + dateText + '일');
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
</script>
</html>