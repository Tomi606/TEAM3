<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div id="page1" class="community-page1 page active">
			<div class="post-list">
				<!-- 내 게시글 출력 -->
				<c:choose>
					 <c:when test="${pList == null }">
					 	<p>등록된 게시글이 없습니다.</p>
					 </c:when>
					 <c:otherwise>					 	
						<c:forEach items="${pList}" var="pList" begin="0" end="${pList.size() -1}">				
							<p>제목 : ${pList.po_title}</p>
							<p>날짜 : ${pList.po_date}</p>
							<p>내용 : ${pList.po_content}</p>
							<br>
						</c:forEach>
					 </c:otherwise>
				</c:choose>
			</div>
			<div class="box-pagination">
				<ul class="pagination justify-content-center">
					<!-- 페이지네이션 출력 -->
				</ul>
			</div>
		</div>
		
		<div id="page2" class="community-page2 page">
			<div class="comment-list">
				<!-- 내 댓글 출력 -->
				<c:choose>
					 <c:when test="${cList == null }">
					 	<p>등록된 댓글이 없습니다.</p>
					 </c:when>
					 <c:otherwise>					 	
						<c:forEach items="${cList}" var="cList" begin="0" end="${cList.size() -1}">				
							<p>날짜 : ${cList.co_date}</p>
							<p>내용 : ${cList.co_content}</p>
							<p>신고횟수 : ${cList.co_report_count}</p>
							<br>
						</c:forEach>
					 </c:otherwise>
				</c:choose>
			</div>
			<div class="box-pagination">
				<ul class="pagination justify-content-center">
					<!-- 페이지네이션 출력 -->
				</ul>
			</div>
		</div>
		
		<div id="page3" class="community-page3 page">
			<div class="box-post-list">
				<!-- 좋아요 출력 -->
				${rList }
			</div>
			<div class="box-pagination">
				<ul class="pagination justify-content-center">
					<!-- 페이지네이션 출력 -->
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- 내 게시글 -->
<script type="text/javascript">

</script>

<!-- 내 댓글 -->
<script type="text/javascript">

</script>

<!-- 좋아요 -->
<script type="text/javascript">

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