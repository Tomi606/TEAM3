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
			</div>
			<div class="box-pagination-post">
				<ul class="pagination justify-content-center">
					<!-- 페이지네이션 출력 -->
				</ul>
			</div>
		</div>
		
		<div id="page2" class="community-page2 page">
			<div class="comment-list">
				<!-- 내 댓글 출력 -->
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
//게시글 전역 변수 설정
let postPage = 1;
//댓글이면 이렇게 따로 전역변수를 설정 해야함. 아니면 같이 넘어감. let commentPage = 1;
getPostList();
function getPostList() {
	let site_id = "${user.site_id}"; //마이페이지의 /hospital/mypage의 user
	$.ajax({
	    async: true,
	    url: '<c:url value="/hospital/community/post"/>',
	    type: 'post',
	    data: {
	        "page": postPage, 
	        "site_id": site_id
	    },
	    success: function (data) {
	        displayPostList(data.pList);
	        displayPostPagination(data.pm);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        // 오류 처리 코드 추가
	    }
	});
};

	
function displayPostList(pList){
   let str = `
	   <table style="width: 100%;">
		<thead>
			<tr>
				<th style="width: 5%;">No</th>
				<th style="width: 40%;">제목</th>
				<th style="width: 30%;">작성일</th>
				<th style="width: 7.5%;">추천수</th>
				<th style="width: 7.5%;">조회수</th>
			</tr>
		</thead>
		<tr class="hr"></tr>
   `;
   if(pList == null || pList.length == 0){
      str += `
    	  <tbody>
	    	  <tr style="height: 400px;">
				<td colspan="6">
					<div>
						<h3 style="color: lightgray">게시글이 존재하지 않습니다.</h3>
					</div>
				</td>
			  </tr>
		  </tbody>
		</table>
      `;
      $('.post-list').html(str);
      return;
   }
   str += `
	   <tbody>
   `;
   for(item of pList){
	   console.log(item);
      str += 
      ` <tr style="height: 100px; border-bottom: 1px solid lightgray;">
			<td style="width: 5%;">\${item.po_num}</td>
			<td style="width: 40%;">
				<a href="<c:url value="/board/detail?po_num=\${item.po_num}"/>" class="title-link">\${item.po_title}</a>
				<a href="<c:url value="/board/detail?po_num=\${item.po_num}#comments-section"/>" class="comment-link" data-po-num="\${item.po_num}"> [\${item.po_co_count}]</a>
			</td>
			<td style="width: 30%;">\${item.changeDate1}</td>
			<td style="width: 7.5%;">\${item.po_up}</td>
			<td style="width: 7.5%;">\${item.po_view}</td>
		</tr>
      `;
	}
    str += `
			</tbody>
		</table>
    `;
	$('.post-list').html(str);
}
function displayPostPagination(pm){
   let str = '';
   if(pm.prev){
      str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage - 1}">이전</a>
		</li>`;
   }
   for(let i = pm.startPage; i<= pm.endPage; i++){
      let active = pm.cri.page == i ? 'active' : '';
      str += `
      <li class="page-item \${active}">
         <a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
      </li>`;
   }
   if(pm.next){
      str += `
      <li class="page-item">
         <a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage + 1}">다음</a>
      </li>`;
   }
   $('.box-pagination-post>ul').html(str);
}
$(document).on('click','.box-pagination-post .page-link',function(){
	postPage = $(this).data('page');
	getPostList();
});
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