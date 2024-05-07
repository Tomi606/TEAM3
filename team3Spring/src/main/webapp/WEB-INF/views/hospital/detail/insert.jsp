<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상세 페이지 등록</title>
<style type="text/css">
.info-container {
	box-shadow: 0px 2px 4px 6px rgba(0, 128, 0, 0.5);
    transition: box-shadow 0.3s ease;
    padding: 20px 30px 20px 30px;
    margin: 20px 30px 20px 30px;
    border-radius: 5px;
}

textarea {
	  resize: none;
}

.info1-label {
	display: flex;
	align-items: center;
}

.subject-checkbox {
	isplay: flex;
    flex-direction: row;
    flex-wrap: wrap;
    align-content: space-between;
    justify-content: flex-start;
    align-items: stretch;
}

.checkbox {
	margin: 2px 2px 2px 80px;
    width: 20px;
    height: 20px;
}

.subject-checkbox {
	display: grid;
    grid-template-columns: repeat(14, 2fr);
    align-items: stretch;
    align-content: stretch;
    justify-content: space-between;
    justify-items: start;
}

.hospital-btn {
	display: block;
    margin: 0 auto;
}
</style>
</head>
<body>
<div class="info-container">
	<div class="all-info-box">
		<form action='<c:url value="/hospital/detail/insert"/>' method="post">
			<div class="info1-box">	
				<h2 style="font-weight: bold; text-align: center;">병원 소개</h2>
				<div class="info">
					<label for="hd_info" style="font-weight: bold" class="info1-label">병원 소개</label>
				   	<textarea class="hd_info col-10" id="hd_info" name="hd_info" 
				   	placeholder="병원 소개말을 입력하세요." oninput="autoTextarea(this)">${hoDetail.hd_info}</textarea>
				</div>
				<div class="hd_time" id="hd_time">
					<label for="hd_time" style="font-weight: bold" class="info1-label">영업 시간</label>
					<textarea class="hd_time col-10" id="hd_time" name="hd_time" required
					placeholder="영업시간 및 점심시간을 입력하세요. 예시)월~금 : 9:00~18:00 / 토,일 : 휴무" oninput="autoTextarea(this)">${hoDetail.hd_time}</textarea>
				</div>
				<div class="hd_park" id="hd_park">
					<label for="hd_park" style="font-weight: bold" class="info1-label">주차 정보</label>
					<textarea class="hd_park col-10" id="hd_park" name="hd_park" 
					placeholder="주차 정보를 입력하세요." oninput="autoTextarea(this)">${hoDetail.hd_park}</textarea>
				</div>
				<div class="hd_announce">
					<label for="hd_announce" style="font-weight: bold" class="info1-label">공지 사항</label>
					<textarea class="hd_announce col-10" id="hd_announce" name="hd_announce" 
					placeholder="공지 사항을 입력하세요." oninput="autoTextarea(this)">${hoDetail.hd_announce}</textarea>
				</div>
				<div class="hd_etc">
					<label for="hd_etc" style="font-weight: bold" class="info1-label">기타 사항</label>
					<textarea class="hd_etc col-10" id="hd_etc" name="hd_etc" 
					placeholder="기타 사항을 입력하세요." oninput="autoTextarea(this)">${hoDetail.hd_etc}</textarea>
				</div>
			</div>
			
			<div class="info2-box">
				<h2 style="font-weight: bold; text-align: center;">진료 과목</h2>
				<div class="hd_hs_num">
					<label for="hd_hs_num" style="font-weight: bold">대표 진료 과목</label>
					<div class="subject-checkbox">
					    <c:choose>
					        <c:when test="${subjects != null}">
					            <c:forEach items="${hsList}" var="hs">
					                <c:set var="isChecked" value="false"/>
					                <c:forEach items="${subjects}" var="sub">
					                    <c:if test="${sub.hsl_hs_num == hs.hs_num}">
					                        <c:set var="isChecked" value="true"/>
					                        <input type="checkbox" class="checkbox" name="hsl_hs_num" value="${sub.hsl_hs_num}" checked>${hs.hs_title}
					                    </c:if>
					                </c:forEach>
					                <c:if test="${isChecked == 'false'}">
					                    <input type="checkbox" class="checkbox" name="hs_num" value="${hs.hs_num}">${hs.hs_title}
					                </c:if>
					            </c:forEach>
					        </c:when>
					        <c:otherwise>
					            <c:forEach items="${hsList}" var="hs">
					                <input type="checkbox" class="checkbox" name="hs_num" value="${hs.hs_num}">${hs.hs_title}
					            </c:forEach>
					        </c:otherwise>
					    </c:choose>
					</div>
				 </div>
				<div>
				 	<label for="hd_subject_detail" style="font-weight: bold">상세 진료 항목</label>
				 	<textarea class="hd_subject_detail col-10" id="hd_subject_detail" name="hd_subject_detail" 
				 	oninput="autoTextarea(this)" placeholder="감염성 질환 / 알레르기 / 만성 질환 / 호흡기 질환 / 피부 질환...">${hoDetail.hd_subject_detail}</textarea>
				</div>
				<button type="submit" class="hospital-btn btn btn-outline-success" name="hospital-btn">병원 소개 등록</button>
			</div>
		</form>
	</div>
</div>


<!-- 상세페이지 등록(insert) : 상세페이지와 선택한 과목 배열 서버로 전송 -->
<script type="text/javascript">
$("form").submit(function(e) {
	/* e.preventDefault(); */
	let hsList = getCheckedBox();
	let hd_info = $('[name=hd_info]').val();
	let hd_time = $('[name=hd_time]').val();
	let hd_park = $('[name=hd_park]').val();
	let hd_announce = $('[name=hd_announce]').val();
	let hd_etc = $('[name=hd_etc]').val();
	let hd_subject_detail = $('[name=hd_subject_detail]').val();
	let detail  = {
		      "hd_info" : hd_info, 
		      "hd_time" : hd_time, 
		      "hd_park" : hd_park,
		      "hd_announce" : hd_announce,
		      "hd_etc" : hd_etc,
		      "hd_subject_detail" : hd_subject_detail,
		      "hsList" : hsList
		    }
	
	if(hsList.length == 0) {
		alert("1개 이상 대표 과목을 선택하세요.");
		return false;
	}
	
		$.ajax({
			async : false, 
			method : "post",
			url : '<c:url value="/hospital/detail/insert"/>',
			data : JSON.stringify(detail), 
			dataType : "json", 
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				alert(data.msg);
				location.href = '<c:url value="/"/>' + data.url
			},
	        error: function(error) {
	            console.log("Error: " + JSON.stringify(error));
	        }
		});
		return false; //submit을 사용안해서 false
});
</script>

<!-- 상세 페이지 수정(update) -->
<script type="text/javascript">

</script>

<!-- 체크박스로 체크한 객체를 배열로 넣는 스크립트 -->
<script type="text/javascript">
//체크된 리스트 가져오기
function getCheckedBox() {
    var checkedValues = new Array(); // 체크된 값들을 담을 배열
    $("input[name='hs_num']:checked").each(function() {
        checkedValues.push($(this).val());
    });
    return checkedValues;
}

</script>

<!-- 체크한 체크박스들 숨기기 -->
<script type="text/javascript">
function hiddenBox() {
	let checkedBox = document.getElementById('hs_num');
	if(checkedBox.checked) {
		checkedBox.styl.display = 'none';
	}
}
</script>

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

<!-- 여러개의 진료과목 선택하는 스크립트(안씀) -->
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

<!-- 영업 시간 : 배열로 저장된 시간들 인덱스와 클래스 이름 매핑(안씀) -->
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
