<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 상세 페이지 조회</title>
<style type="text/css">
.toggle-btn{
display:flex;

}
.toggle-button {
	border:1px solid lightgray;
	outline-style:none;
	height:100px;
	width:33.33%;
    font-size: 30px;
}

.page {
    display: none;
    padding: 20px;
}

.page.active {
    display: block;
}
.detail-page{
 width: 100%;height: 100%;display: flex;
}
.detail-page-sub{
 width: 1500px;height: 100%;margin: 100px auto;text-align: center;
}
.ho_name{
margin-bottom: 40px;

}
.body-container{
	width: 100%;height: 100%; border: 1px solid black; 

}
.login-btn-click{
background-color: white;
border-bottom:2px solid white;
}
/* .bookmark-after {
	display: none;
} */
</style>
</head>
<body>
<div class="detail-page">
	<div class="bookmark-box">
		<img class="btn btn-lg bookmark-before" data-id="${user.site_id}" alt="북마크 전" src="<c:url value="/resources/img/bookmark-before.svg"/>">
		<img class="btn btn-lg bookmark-after" data-id="${user.site_id}" alt="북마크 후" src="<c:url value="/resources/img/bookmark-after.svg"/>">
	</div>
	<div class="detail-page-sub">
		<div class="ho_name">
			<h1 class="ho_name" id="ho_name">${detail.hospital.ho_name}</h1>
		</div>
		<div class="ho_address">
			<label for="ho_address">상세 주소 : </label>
			<span class="ho_address" id="ho_address">${detail.hospital.ho_address}</span>
		</div>
		<div class="ho_phone">
			<label for="ho_phone">연락처 : </label>
			<span class="ho_phone" id="ho_phone">${detail.hospital.ho_phone}</span>
		</div>
		<div>
			<a href='<c:url value="예약하기 버튼 url"/>' class="btn btn-outline-success">예약하기</a>
		</div>
		<hr style="border: 1px solid gray;margin: 200px auto;">
		<div class="body-container">
		<div class="toggle-page">
			<div class="toggle-btn">
				<button id="btn1" class="toggle-button login-btn-click">병원 소개</button>
				<button id="btn2" class="toggle-button">진료 과목</button>
				<button id="btn3" class="toggle-button">리뷰</button>
			</div>
			<div id="page1" class="page active">
				<div class="hd_info">
					<label for="hd_info" style="font-weight: bold;margin-top: 40px;">병원 소개</label>
				   	<textarea class="hd_info col-10" id="hd_info" 
				   	  oninput="autoTextarea(this)">${detail.hd_info}</textarea>
				</div>
				<hr style="border: 1px solid gray;margin: 50px auto;">
				<div class="hd_time" id="hd_time">
					<label for="hd_time" style="font-weight: bold">영업 시간</label>
					<textarea class="hd_time col-10" id="hd_time" name="hd_time" 
					placeholder="월~금 : 9:00~18:00 / 토,일 : 휴무" 
					oninput="autoTextarea(this)" readonly>${detail.hd_time}</textarea>
				</div>
				<hr style="border: 1px solid gray;margin: 50px auto;">
				<div class="hd_park" id="hd_park">
					<label for="hd_park" style="font-weight: bold">주차 정보</label>
					<textarea class="hd_park col-10" id="hd_park" name="hd_park" 
					oninput="autoTextarea(this)" readonly>${detail.hd_park}</textarea>
				</div>
				<hr style="border: 1px solid gray;margin: 50px auto;">
				<div class="hd_announce">
					<label for="hd_announce" style="font-weight: bold">공지 사항</label>
					<textarea class="hd_announce col-10" id="hd_announce" name="hd_announce" 
					oninput="autoTextarea(this)" readonly>${detail.hd_announce}</textarea>
				</div>
				<hr style="border: 1px solid gray;margin: 50px auto;">
				<div class="hd_etc">
					<label for="hd_etc" style="font-weight: bold">기타 사항</label>
					<textarea class="hd_etc col-10" id="hd_etc" name="hd_etc" 
					oninput="autoTextarea(this)" readonly>${detail.hd_etc}</textarea>
				</div>
			</div>
			
			<div id="page2" class="page">
				<div class="hsList">
					<label for="hsList">대표 진료 과목</label>
					<div class="subject-checkbox hsList">
					  	<c:forEach var="i" begin="0" end="${sub.size() - 1}">
							<button class="btn btn-info btn-lg" style="cursor: text;">
							<p><c:out value="${sub.get(i).hospital_subject.hs_title}"/></p>
							</button>
					  	</c:forEach>
					</div>
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
				        <button class="btn btn-outline-success review-insert-btn" name="review-btn" data-hd-num="${detail.hd_num}">리뷰 등록</button>		
					</div>
				</div>			
			</div>
			</div>
		</div>
	</div>
</div>

<!-- 북마크 추가 버튼 -->
<script type="text/javascript">
$('.bookmark-before').click(function() {
	//로그인 체크 여부
	/* if(!checkLogin()) {
		return false;
	} */
	
	//서버에 보낼 데이터 생성
	let me_id = $(this).data('id');
	let ho_id = '${detail.hd_ho_id}';
	console.log(me_id);
	console.log(ho_id);
	let bookmark = {
			bmk_me_id : me_id, 
			bmk_ho_id : ho_id	
	}
	
	$.ajax({
		async : true,
		url : '<c:url value="/bookmark/insert"/>', 
		type : 'post', 
		data : JSON.stringify(bookmark), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function(data) {
			if(data.result) {
				alert('북마크 추가되었습니다.');
				/* getBookmarkAfter(); */
			}
			else {
				alert('사업자 회원은 북마크하실 수 없습니다.');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){
			alert('북마크 에러');
		}
	});
	
});

//손보기!!!
function getBookmarkAfter() {
	bookmarkAfter.style.display = 'none';
	let bookmarkAfter = document.querySelector('.bookmark-after');
	if(bookmarkAfter) {				
		bookmarkAfter.style.display = 'inline';
	}
	else {
		console.log('display 실패');
	}
}
</script>

<!-- 북마크 해제 버튼 -->
<script type="text/javascript">
$('.bookmark-after').click(function() {
	//로그인 체크 여부
	/* if(!checkLogin()) {
		return false;
	} */
	
	//서버에 보낼 데이터 생성
	let me_id = $(this).data('id');
	let ho_id = '${detail.hd_ho_id}';
	console.log(me_id);
	console.log(ho_id);
	let bookmark = {
			bmk_me_id : me_id,
			bmk_ho_id : ho_id
	}
	
	$.ajax({
		async : true,
		url : '<c:url value="/bookmark/delete"/>', 
		type : 'post', 
		data : JSON.stringify(bookmark), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function(data) {
			if(data.result) {
				alert('북마크 삭제되었습니다.');
				/* getBookmarkAfter(); */
			}
			else {
				alert('사업자 회원은 북마크하실 수 없습니다.');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){
			alert('북마크 에러');
		}
	});
	
	
	this.style.display = 'none';
	let bookmarkBefore = document.querySelector('.bookmark-before');
	bookmark.style.display = 'inline';
	alert('북마크 해제되었습니다.')
	return;
});

</script>

<script type="text/javascript">
$("#btn1").click(function() {
	$("#btn1").addClass("login-btn-click");
	$("#btn2").removeClass("login-btn-click");
	$("#btn3").removeClass("login-btn-click");
});
$("#btn2").click(function() {
	$("#btn1").removeClass("login-btn-click");
	$("#btn3").removeClass("login-btn-click");
	$("#btn2").addClass("login-btn-click");
});
$("#btn3").click(function() {
	$("#btn3").addClass("login-btn-click");
	$("#btn1").removeClass("login-btn-click");
	$("#btn2").removeClass("login-btn-click");
});
</script>

<!-- 리뷰 리스트 조회 -->
<script type="text/javascript">
//댓글 페이지 정보를 가지고 있는 객체 선언
let cri = {
	page : 1, 
	search : "${detail.hd_num}"
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
			console.log(data.reviewList);//확인용
			displayReviewList(data.reviewList);
			displayReviewPagination(data.pm);
			$('.review-total').text(data.pm.totalCount);
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.error("Error occurred:", errorThrown);
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
			<button class="btn btn-outline-warning review-update-btn" data-num="\${item.vw_num}">수정</button>
			<button class="btn btn-outline-danger review-del-btn" data-num="\${item.vw_num}">삭제</button>
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
$('.review-insert-btn').click(function() {!!
	//로그인 안되있으면 return
	if(!checkLogin()) {
		return;
	}
	
	let review = {
	        vw_hd_num : $(this).data('hd-num'), 
	        vw_content : $('.textarea-review').val()
	    }
	console.log(review);
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
				alert('사업자 회원은 댓글을 달 수 없습니다.');
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

<!-- 리뷰 삭제 -->
<script type="text/javascript">
$(document).on('click', '.review-del-btn', function() {
	//서버로 보낼 데이터 생성
	let review = {
		vw_num : $(this).data('num')
	}
	console.log(review);
	//서버로 데이터를 전송
	$.ajax({
		async : true, 
		url : '<c:url value="/hospital/review/delete"/>', 
		type : 'post', 
		data : JSON.stringify(review), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result) {
				alert('리뷰를 삭제했습니다.');
				getReviewList(cri);
			}
			else {
				alert('리뷰 삭제 실패');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
});
</script>

<!-- 리뷰 수정 -->
<script type="text/javascript">
//수정 버튼을 눌렀을 때
$(document).on('click', '.review-update-btn', function() {
	initReview();
	let reviewBox = $(this).parents(".box-review").find(".text-review");
	//리뷰를 수정할 수 있는 textarea로 변경
	let content = reviewBox.text();
	let str = `<textarea class="form-control">\${content}</textarea>`;
	reviewBox.after(str);
	reviewBox.hide();
	
	//수정, 삭제 버튼을 감추고
	$(this).parents(".box-review").find(".box-btn").hide();
	//수정 완료 버튼을 추가
	let vw_num = $(this).data("num");
	str = `<button class="btn btn-outline-success complete-btn" data-num="\${vw_num}">수정완료</button>`;
	$(this).parents(".box-review").find(".box-btn").after(str);
});

//수정완료 버튼을 눌렀을 때
$(document).on('click', '.complete-btn', function() {
	//전송할 데이터를 생성(리뷰 번호, 리뷰 내용)/페이지 번호는 컨트롤러에서 받아옴
	let review = {
		vw_content : $(".box-review").find("textarea").val(),
		vw_num : $(this).data("num")
	}
	//서버에서 ajax로 데이터를 전송 후 처리
	$.ajax({
		async : true,
		url : '<c:url value="/hospital/review/update"/>', 
		type : 'post', 
		data : JSON.stringify(review), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result) {
				alert('리뷰를 수정했습니다.');
				getReviewList(cri);
			}
			else {
				alert('리뷰 수정 실패');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
});

//수정 버튼을 누른 상태에서 다른 수정 버튼을 누르면 기존에 누른 댓글은 원상태로 돌려주는 함수
function initReview() {
	$('.complete-btn').remove();
	$('.box-review').find('textarea').remove();
	$('.box-btn').show();
	$('text-review').show();
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
<!-- <script type="text/javascript">
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
</script> -->

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