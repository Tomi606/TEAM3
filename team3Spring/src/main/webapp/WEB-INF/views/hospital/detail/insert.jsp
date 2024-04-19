<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상세 페이지 등록</title>
<style type="text/css">

</style>
</head>
<body>
<form action='<c:url value="/hospital/detail/insert"/>' method="post">
	<h2 style="font-weight: bold;">병원 소개</h2>
	<div class="info">
		<label for="hd_info" style="font-weight: bold">병원 소개</label>
	   	<textarea class="hd_info col-10" id="hd_info" name="hd_info" 
	   	placeholder="병원 소개" oninput="autoTextarea(this)">${hoDetail.hd_info}</textarea>
	</div>
	<table class="hd_time" id="hd_time">
		<thead>
		    <tr>
		        <th>진료 시간</th>
		    </tr>
		</thead>
		<tbody>
			<tr>
		        <td>점심 시간</td>
		        <td><input type="text" class="lunch" name="hd_time" placeholder="12:00~13:00"
		        onkeyup="this.value=this.value.replace(/[^0-9~:]/g,'');" required></td>
	 		</tr>
		    <tr>
		        <td>월요일</td>
		        <td><input type="text" class="mon" name="hd_time" placeholder="9:00~18:00"
		        onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" required></td>
	 		</tr>
			<tr>
			    <td>화요일</td>
			    <td><input type="text" class="tue" name="hd_time" placeholder="9:00~18:00"
			    onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" required></td>
			</tr>
			<tr>
			    <td>수요일</td>
			    <td><input type="text" class="wed" name="hd_time" placeholder="9:00~18:00"
			    onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" required></td>
			</tr>
			<tr>
			    <td>목요일</td>
			    <td><input type="text" class="thu" name="hd_time" placeholder="9:00~18:00"
			    onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" required></td>
			</tr>
			<tr>
			    <td>금요일</td>
			    <td><input type="text" class="fri" name="hd_time" placeholder="9:00~18:00"
			    onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" required></td>
			</tr>
			<tr>
			    <td>토요일</td>
			    <td><input type="text" class="sat" name="hd_time" placeholder="9:00~18:00"
			    onkeyup="this.value=this.value.replace(/[^ㅎㅁ휴무0-9~:]/g,'');" required></td>
			</tr>
			<tr>ㄴ
			    <td>일요일</td> 
			    <td><input type="text" class="sun" name="hd_time" placeholder="9:00~18:00"
			    onkeyup="this.value=this.value.replace(/[^ㅎㅁ휴무0-9~:]/g,'');" required></td>
			</tr>
			<tr>
			    <td>휴무일</td> 
			    <td><input type="text" class="holiday" name="hd_time" placeholder="휴무 또는 영업시간"
			    onkeyup="this.value=this.value.replace(/[^ㅎㅁ휴무0-9~:]/g,'');" required></td>
			  </tr>
		</tbody>
	</table>
	<div class="hd_park" id="hd_park">
		<label for="hd_park" style="font-weight: bold">주차 정보</label>
		<textarea class="hd_park col-10" id="hd_park" name="hd_park" 
		placeholder="주차 정보" oninput="autoTextarea(this)">${hoDetail.hd_park}</textarea>
	</div>
	<div class="hd_announce">
		<label for="hd_announce" style="font-weight: bold">공지 사항</label>
		<textarea class="hd_announce col-10" id="hd_announce" name="hd_announce" 
		placeholder="공지 사항" oninput="autoTextarea(this)">${hoDetail.hd_announce}</textarea>
	</div>
	<div class="hd_etc">
		<label for="hd_etc" style="font-weight: bold">기타 사항</label>
		<textarea class="hd_etc col-10" id="hd_etc" name="hd_etc" 
		placeholder="기타 사항" oninput="autoTextarea(this)">${hoDetail.hd_etc}</textarea>
	</div>
	<h2 style="font-weight: bold;">진료 과목</h2>
	<div class="hd_hs_num">
		<label for="hd_hs_num">대표 진료 과목</label>
		<div class="subject-checkbox hd_hs_num">
		  	<c:forEach items="${hsList}" var="hs">
		  		<c:set var="isChecked" value="false"/>
		  		<c:if test="${hoDetail.hd_hs_num != null}">		  		
			  		<c:forEach items="${hoDetail.hd_hs_num.split(',')}" var="selectedHsNum">
			  			<c:if test="${selectedHsNum == hs.hs_num}">
			  				<c:set var="isChecked" value="true"/>
			  			</c:if>
			  		</c:forEach>
		  		</c:if>
		   		<input type="checkbox" name="subject" value="${hs.hs_num}" onclick="updateHdHsNums()"
		   				<c:if test="${isChecked == 'true'}">checked</c:if>>${hs.hs_title}
		  	</c:forEach>
		</div>
		<input type="hidden" id="hd_hs_num" name="hd_hs_num" value="${hoDetail.hd_hs_num}">
	 </div>
	<div>
	 	<label for="hd_subject_detail">상세 진료 항목</label>
	 	<textarea class="hd_subject_detail col-10" id="hd_subject_detail" name="hd_subject_detail" 
	 	oninput="autoTextarea(this)" placeholder="감염성 질환 / 알레르기 / 만성 질환 / 호흡기 질환 / 피부 질환...">${hoDetail.hd_subject_detail}</textarea>
	</div>
	<button type="submit" class="hospital-btn" name="hospital-btn">병원 소개 등록</button>
</form>
<!-- textarea 자동 스크롤 -->
<script type="text/javascript">
function autoTextarea(element) {
	//초기 높이 설정
	element.style.height = 'auto';
	//스크롤 높이에 따라 텍스트 영역 높이 조절
	element.style.height = (element.scrollHeight) + 'px';
}
//textarea에 이벤트 핸들러 추가
document.addEventListener('DOMContentLoaded', function() {
	let textarea = document.querySelector('textarea');
	//페이지 로드 시 높이 조절
	autoTextarea(textarea);
	//키 입력 시 높이 주절
	textarea.addEventListener('input', function() {
		autoTextarea(this);
	});
});
</script>

<!-- 로그인한 병원이 선택했던 병원과목만 체크(안됨!!! 다시보기) -->
<!-- <script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    var selectedSubjects = <c:out value="${selectedSubject.hs_num}" default="''"/>;
    
    if(selectedSubjects) {
        console.log("Selected Subjects:", selectedSubjects); // 확인용 로그 출력
        
        var checkboxes = document.getElementsByName("subject");
        
        for(var i = 0; i < checkboxes.length; i++) {
            if(selectedSubjects.includes(checkboxes[i].value)) {
                checkboxes[i].checked = true;
                console.log("Checkbox checked:", checkboxes[i].value); // 확인용 로그 출력
            }
        }
    }
});
</script> -->

<!-- 여러개의 진료과목 선택하는 스크립트 -->
<script type="text/javascript">
// 체크박스 클릭 시 hd_hs_num 업데이트
function updateHdHsNums() {
    var checkedBoxes = document.querySelectorAll('.subject-checkbox.hd_hs_num input[type="checkbox"]:checked');
    var selectedHsNums = [];
    checkedBoxes.forEach(function(checkbox) {
        selectedHsNums.push(checkbox.value);
    });
    document.getElementById('hd_hs_num').value = selectedHsNums.join(',');
}

// 페이지 로딩 시 선택된 체크박스 업데이트
window.onload = function() {
    var hd_hs_num = "${hd_hs_num}";
    var selectedHsNums = hd_hs_num.split(',');
    selectedHsNums.forEach(function(hsNum) {
        var checkbox = document.querySelector('.subject-checkbox.hd_hs_num input[value="' + hsNum + '"]');
        if (checkbox) {
            checkbox.checked = true;
        }
    });
};
</script>

<!-- 영업 시간 : 배열로 저장된 시간들 인덱스와 클래스 이름 매핑 -->
<script type="text/javascript">
//서버에서 받은 hd_time 문자열
let hd_time = "${hoDetail.hd_time}";
//쉼표로 문자열 분할
let timeArray = hd_time.split(',');
//각 요일에 대한 인덱스와 클래스 이름 매핑
let days = {
	'lunch' : 0,
	'mon' : 1,
	'tue' : 2,
	'wed' : 3,
	'thu' : 4,
	'fri' : 5,
	'sat' : 6,
	'sun' : 7,
	'holiday' : 8
};

//각 요일의 input 필드에 시간 설정
for(let day in days) {
	let index = days[day];
	let inputField = document.querySelector('.' + day);
	
	//시간이 존재하면 input 필드에 설정
	if(timeArray[index]) {
		inputField.value = timeArray[index];
	}
}
</script>
</body>
</html>
