<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 상세 페이지 조회</title>
<style type="text/css">
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
</style>
</head>
<body>
<div class="detail-page">
	<h2>병원 상세 페이지 조회</h2>
	<div class="ho_name">
		<label for="ho_name">상호명</label>
		<input class="ho_name" id="ho_name" name="ho_name" value="${detail.hospital.ho_name}" readonly>
	</div>
	<div class="ho_address">
		<label for="ho_address">주소</label>
		<input class="ho_address" id="ho_address" name="ho_address" value="${detail.hospital.ho_address}" readonly>
	</div>
	<div class="ho_phone">
		<label for="ho_phone">연락처</label>
		<input class="ho_phone" id="ho_phone" name="ho_phone" value="${detail.hospital.ho_phone}" readonly>
	</div>
	<div>
		<a href='<c:url value="예약하기 버튼 url"/>' class="btn btn-outline-success">예약하기</a>
	</div>
	<hr style="border: 3px solid gray;">
	<div class="toggle-page">
		<div class="toggle-btn">
			<button id="btn1" class="toggle-button">병원 소개</button>
			<button id="btn2" class="toggle-button">진료 과목</button>
			<button id="btn3" class="toggle-button">리뷰</button>
		</div>
		<div id="page1" class="page active">
			<div class="hd_info">
				<label for="hd_info" style="font-weight: bold">병원 소개</label>
			   	<textarea class="hd_info col-10" id="hd_info" name="hd_info" 
			   	 readonly oninput="autoTextarea(this)">${detail.hd_info}</textarea>
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
				        onkeyup="this.value=this.value.replace(/[^0-9~:]/g,'');" readonly></td>
			 		</tr>
				    <tr>
				        <td>월요일</td>
				        <td><input type="text" class="mon" name="hd_time" placeholder="9:00~18:00"
				        onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" readonly></td>
			 		</tr>
					<tr>
					    <td>화요일</td>
					    <td><input type="text" class="tue" name="hd_time" placeholder="9:00~18:00"
					    onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" readonly></td>
					</tr>
					<tr>
					    <td>수요일</td>
					    <td><input type="text" class="wed" name="hd_time" placeholder="9:00~18:00"
					    onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" readonly></td>
					</tr>
					<tr>
					    <td>목요일</td>
					    <td><input type="text" class="thu" name="hd_time" placeholder="9:00~18:00"
					    onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" readonly></td>
					</tr>
					<tr>
					    <td>금요일</td>
					    <td><input type="text" class="fri" name="hd_time" placeholder="9:00~18:00"
					    onkeyup="this.value=this.value.replace(/[^0-9~:ㅎㅁ휴무]/g,'');" readonly></td>
					</tr>
					<tr>
					    <td>토요일</td>
					    <td><input type="text" class="sat" name="hd_time" placeholder="9:00~18:00"
					    onkeyup="this.value=this.value.replace(/[^ㅎㅁ휴무0-9~:]/g,'');" readonly></td>
					</tr>
					<tr>
					    <td>일요일</td> 
					    <td><input type="text" class="sun" name="hd_time" placeholder="9:00~18:00"
					    onkeyup="this.value=this.value.replace(/[^ㅎㅁ휴무0-9~:]/g,'');" readonly></td>
					</tr>
					<tr>
					    <td>휴무일</td> 
					    <td><input type="text" class="holiday" name="hd_time" placeholder="휴무 또는 영업시간"
					    onkeyup="this.value=this.value.replace(/[^ㅎㅁ휴무0-9~:]/g,'');" readonly></td>
					  </tr>
				</tbody>
			</table>
			<div class="hd_park" id="hd_park">
				<label for="hd_park" style="font-weight: bold">주차 정보</label>
				<textarea class="hd_park col-10" id="hd_park" name="hd_park" 
				oninput="autoTextarea(this)" readonly>${detail.hd_park}</textarea>
			</div>
			<div class="hd_announce">
				<label for="hd_announce" style="font-weight: bold">공지 사항</label>
				<textarea class="hd_announce col-10" id="hd_announce" name="hd_announce" 
				oninput="autoTextarea(this)" readonly>${detail.hd_announce}</textarea>
			</div>
			<div class="hd_etc">
				<label for="hd_etc" style="font-weight: bold">기타 사항</label>
				<textarea class="hd_etc col-10" id="hd_etc" name="hd_etc" 
				oninput="autoTextarea(this)" readonly>${detail.hd_etc}</textarea>
			</div>
		</div>
		
		<div id="page2" class="page">
			<div class="hd_hs_num">
				<label for="hd_hs_num">대표 진료 과목</label>
				<div class="subject-checkbox hd_hs_num">
				  	<c:forEach items="${hsList}" var="hs">
				  		<c:set var="isChecked" value="false"/>
				  		<c:if test="${detail.hd_hs_num != null}">		  		
					  		<c:forEach items="${detail.hd_hs_num.split(',')}" var="selectedHsNum">
					  			<c:if test="${selectedHsNum == hs.hs_num}">
					  				<c:set var="isChecked" value="true"/>
					  			</c:if>
					  		</c:forEach>
				  		</c:if>
				   		<input type="checkbox" name="subject" value="${hs.hs_num}" onclick="updateHdHsNums()"
				   				<c:if test="${isChecked == 'true'}">checked</c:if> readonly>${hs.hs_title}
				  	</c:forEach>
				</div>
				<input type="hidden" id="hd_hs_num" name="hd_hs_num" value="${detail.hd_hs_num}">
			 </div>
			 <div>
			 	<label for="hd_subject_detail">상세 진료 항목</label>
			 	<textarea class="hd_subject_detail col-10" id="hd_subject_detail" name="hd_subject_detail" 
			 	oninput="autoTextarea(this)" readonly>${detail.hd_subject_detail}</textarea>
			</div>
		</div>
		
		<div id="page3" class="page">
			<h2>리뷰(<span class="review-total"></span>)</h2>
			<div class="box-review-list">
				<div class="box-review row">				
					<div class="col-3">아이디</div>
					<div class="col-9">내용</div>
				</div>
			</div>
			<div class="box-pagination">
				<ul class="pagination justify-content-center"></ul>
			</div>
			<div class="box-review-insert">
				<div class="input-group mb-3">				
			        <textarea id="review" class="vw_num textarea-review col-10" id="vw_num" name="vw_num" 
			        oninput="autoTextarea(this)"></textarea>
			        <button class="btn btn-outline-success review-insert-btn" name="review-btn" data-hd-num="${hospital_detail.hd_num}">리뷰 등록</button>			
				</div>
			</div>			
		</div>
	</div>
</div>

<!-- 리뷰 리스트 조회 -->
<script type="text/javascript">
//댓글 페이지 정보를 가지고 있는 객체 선언
let cri = {
	page : 1, 
	search : "${review.vw_num}"
}

getReviewList(cri);

function getReviewList(cri) {
	$.ajax({
		async : true, 
		url : '<c:url value="/hospital/review/list"/>', 
		type : 'post', 
		data : JSON.stringify(cri),
		//서버로 보낼 데이터 타입
		contentType : "application/json; charset=utf-8",
		//서버에서 보낸 데이터의 타입
		dataType : "json", 
		success : function (data){
			displayReviewList(data.reviewList);
			displayReviewPagination(data.pm);
			$('.review-total').text(data.pm.totalCount); //totalCount or reviewTotalCount
		},
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
}

//등록된 리뷰 조회
function displayReviewList(reviewList) {
	let str = '';
	if(reviewList == null || reviewList.length == 0) {
		str = '<h3>등록된 리뷰가 없습니다.</h3>';
		$(".box-review-list").html(str);
		return;
	}
	
	//회원 아이디가 있으면 등록된 리뷰에 수정/삭제 버튼(\${btns}) 달기
	for(item of reviewList) {
		//버튼
		let boxBtns = 
		`
		<span class="box-btn float-right">
			<button class="btn btn-outline-warning btn-review-update" data-num="\${item.vw_num}">수정</button>
			<button class="btn btn-outline-dander btn-review-del" data-num="\${item.vw_num}">삭제</button>
		</span>
		`;
		
		//유저 아이디가 있으면 달고 : 아니면 빈문자열
		let btns = '${user.site_id}' == item.vw_me_id ? boxBtns : '';
		
		//리뷰에 작성자 | 작성 내용 | 버튼
		str +=
		`
		<div class="box-review row">
			<div class="col-3">\${item.vw_me_id}</div>
			<div class="col-9 clearfix input-group">
				<span class="text-review">\${item.vw_content}</span>
				\${btns}
			</div>
		</div>
		`;
	}
	$(".box-review-list").html(str);
}

//리뷰 페이지네이션
function displayReviewPagination(pm) {
	let str = '';
	if(pm.prev) {
		str += 
		`
	    <li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage - 1}">이전</a>
		</li>
		`;
	}
	for(let i = pm.startPage; i<= pm.endPage; i++) {
		let active = pm.cri.page == i ? 'active' : '';
		str += 
		`
	    <li class="page-item \${active}">
			<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
		</li>
		`;
	}
	
	if(pm.next) {
		str += 
		`
	    <li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage + 1}">다음</a>
		</li>
		`;
	}
	$('.box-pagination>ul').html(str);
}
$(document).on('click', '.box-pagination .page-link', function() {
	cri.page = $(this).data('page');
	getReviewList(cri);
})
</script>

<!-- 리뷰 등록 -->
<script type="text/javascript">
//리뷰 등록 버튼의 클릭 이벤트를 등록
$('.review-insert-btn').click(function() {
	//로그인 안되있으면 return
	if(!checkLogin()) {
		return;
	}
	
	let review = {
	        vw_hd_num : $(this).data('hd-num'), 
	        vw_content : $('.textarea-review').val()
	    }
	
	//내용이 비어있으면 return
	if(review.vw_content.length == 0) {
		alert('댓글 내용을 작성하세요.');
		return;
	}
	
	//서버에 데이터를 전송
	$.ajax({
		async : true, 
		url : '<c:url value="/hospital/review/insert"/>', 
		type : 'post', 
		data : JSON.stringify(review), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result) {
				alert('댓글을 등록했습니다.');
				$('.textarea-review').val('');
				cri.page = 1;
				getReviewList(cri);
			}
			else {
				alert('댓글 등록 실패');
			}
		}, 
		error : function(xhr, textStatus, errorThrown){
			console.error(xhr);
			console.error(textStatus);
		}
	});
});

function checkLogin() {
	//로그인 했을 때
	if('${user.site_id}' != '') {
		return true;
	}
	//안했을 때
	if(confirm("로그인이 필요한 기능입니다. \n로그인 하시겠습니까?")) {
		location.href = '<c:url value="/main/login"/>';
	}
	return false;
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

<!-- 여러개 선택한 진료과목을 체크박스에 띄우는 스크립트 -->
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
let hd_time = "${detail.hd_time}";
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

<!-- 토글 버튼 -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	let btn1 = document.getElementById('btn1');
	let btn2 = document.getElementById('btn2');
	let btn3 = document.getElementById('btn3');
    
	btn1.addEventListener('click', function() {
		//activatePage 함수는 페이지의 id값을 인자로 받는다.
		activatePage('page1');
	});
	
	btn2.addEventListener('click', function() {
		activatePage('page2');
	});
	
	btn3.addEventListener('click', function() {
		activatePage('page3');
	});
	
	function activatePage(pageId) {
		//모든 화면의 active 클래스 제거
		document.querySelectorAll('.page').forEach(p => {
			p.classList.remove('active');
		});
		
		//선택한 화면에 active 클래스 추가
		let page = document.getElementById(pageId);
        if (page) {
            page.classList.add('active');
        } else {
            console.error("Page not found:", pageId);
        }
	}
});
</script>

</body>
</html>