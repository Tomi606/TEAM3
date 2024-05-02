<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 관리</title>
<style type="text/css">
.community-toggle-group {
	display:flex;
	
}

.community-toggle-btn {
    border:1px solid lightgray;
	outline-style:none;
	height:100px;
	width:33.33%;
    font-size: 30px;
    
}

.click-btn {
	background-color: white;
	border-bottom:0px solid white;
}

.page {
    display: none;
    padding: 20px;
    border: 0px solid #ccc;
}

.page.active {
    display: block;
}
</style>
</head>
<body>
<div class="community-container">
	<div class="community-toggle-group">
		<button id="btn1" class="community-toggle-btn click-btn">작성 게시글</button>
		<button id="btn2" class="community-toggle-btn">작성 댓글</button>
		<button id="btn3" class="community-toggle-btn">좋아요</button>
	</div>
	<div class="community-page">
		<div id="page1" class="community-page1 page active">작성 게시글</div>
		<div id="page2" class="community-page2 page">작성 댓글</div>
		<div id="page3" class="community-page3 page">좋아요</div>
	</div>
</div>





<!-- 토글 버튼 -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	let btn1 = document.getElementById('btn1');
	let btn2 = document.getElementById('btn2');
	let btn3 = document.getElementById('btn3');
    
	btn1.addEventListener('click', function() {
		//activatePage 함수는 페이지의 id값을 인자로 받는다.
		activatePage('page1');
		$("#btn1").addClass("click-btn");
		$("#btn2").removeClass("click-btn");
		$("#btn3").removeClass("click-btn");
	});
	
	btn2.addEventListener('click', function() {
		activatePage('page2');
		$("#btn1").removeClass("click-btn");
		$("#btn3").removeClass("click-btn");
		$("#btn2").addClass("click-btn");
	});
	
	btn3.addEventListener('click', function() {
		activatePage('page3');
		$("#btn3").addClass("click-btn");
		$("#btn1").removeClass("click-btn");
		$("#btn2").removeClass("click-btn");
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