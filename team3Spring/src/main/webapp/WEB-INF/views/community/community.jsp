<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery validation -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<title>커뮤니티 메인</title>
<style type="text/css">
.board-post-box{
	padding: 50px;
	text-align: center;
}
.board-box{
	width: 40%;
	height: 300px;
	border: 1px solid gray;
	border-radius: 20px;
	display: inline-block;
	margin-right: 50px;
	padding: 10px;
	text-align: center;
}
.post-box{
	width: 40%;
	height: 300px;
	border: 1px solid gray;
	border-radius: 20px;
	display: inline-block;
	padding: 50px;
	text-align: center;
}
tr th,
tr td{
text-align: center;
}


</style>
</head>
<body>

<div class="board-post-box">
	<!-- 가입 대기 병원 조회 박스 -->
	<div class="board-box">
		<div class="input-group mb-3">
			<select name="type" class="form-control">
				<c:forEach items="${list}" var="list">
					<option value="${list.bo_num}">${list.bo_title }</option>
				</c:forEach>
			</select>
		</div>
		<a class="btn add-btn" href="<c:url value="/community/insert"/>">게시판 등록</a>
		<a class="btn update-btn">게시판 수정</a>
		<a class="btn delete-btn">게시판 삭제</a>
	</div>
		
	<!-- 신고받은 병원 조회 박스 -->
	<div class="post-box">
		<div class="input-group mb-3">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody class="posttbody">
					
				</tbody>
			</table>
			<div class="box-comment-pagination">
				<ul class="pagination justify-content-center">
					
				</ul>
			</div>
		<a class="btn post-delete-btn">게시글 삭제</a>
		</div>
	</div>
</div>

<script type="text/javascript">

/* 컨트롤러에게 현재 선택한 보드 번화가 뭔지 알려주기 위한 메서드 */
$('.update-btn').click(function(){
    let bo_num = $("[name=type]").val();
    let url = '<c:url value="/community/update"/>' + '?bo_num=' + bo_num;
    location.href = url;
});

/* 컨트롤러에게 현재 선택한 보드 번화가 뭔지 알려주기 위한 메서드 게시판 삭제*/
$('.delete-btn').click(function(){
    let bo_num = $("[name=type]").val();
    if(bo_num == null){
    	alert("게시판을 선택해주세요");
    }
    let url = '<c:url value="/community/delete"/>' + '?bo_num=' + bo_num;
    location.href = url;
});

/* 게시글 삭제 메서드 */
$('.post-delete-btn').click(function(){
    let po_num = prompt("삭제하고 싶은 게시글 번호를 입력하세요:");
    let bo_num = $("[name=type]").val();
    
    let queryParams = "po_num=" + po_num + "&po_bo_num=" + bo_num;
    
    let url = '<c:url value="/post/delete"/>' + '?' + queryParams;
    
    location.href = url;
});


//지우지마시오!!!
let page = 1;//지우지 마시오!!!
//지우지마시오!!!

//댓글을 불러와서 화면에 출력하는 함수 : 현재 댓글 페이지 정보
function displayCommentAndPagination(){
	let bo_num = $("[name=type]").val();
	//ajax를 이용해서 서버에 현재 댓글 페이지 정보를 보내고, 
	//서버에서 보낸 댓글 리스트와 페이지네이션 정보를 받아와서 화면에 출력
	$.ajax({
		url : '<c:url value="/post"/>',
		method : 'get',
		data : {"bo_num" : bo_num,
			"page" : page},
		success : function(data){
			displayComment(data.list);
			displayCommentPagination(data.pm);
		}
	});
}

function displayComment(postList){
	/* 게시판이 바뀔떄마다 그 게시판에 맞는 게시글을 가지고 옴 */
		let str = ``;
		if(postList.length == 0){
			$('.posttbody').html('<h3>등록된 게시글이 없습니다.</h3>');
		}
		for(let tmp of postList){
			str+=
				`
				<tr>
					<td>\${tmp.po_num}</td>
					<td>\${tmp.po_title}</td>
					<td>\${tmp.sitemanagement.site_id}</td>
				</tr>
				`
		}
		$('.posttbody').html(str);	
}

//페이지네이션이 주어지면 댓글 페이지네이션을 화면에 출력하는 함수
function displayCommentPagination(pm){
	let str = '';
	//이전 버튼 활성화
	if(pm.prev){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage-1}">이전</a>
		</li>`;
	}
	
	for(i = pm.startPage; i<= pm.endPage; i++){
		let active = pm.cri.page == i ? "active" : "";
		str += 
		`<li class="page-item \${active}">
			<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
		</li>`
	}
	
	if(pm.next){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage+1}">다음</a>
		</li>`;
	}
	$(".box-comment-pagination>ul").html(str);
}

$('[name=type]').click(function(){
	displayCommentAndPagination();
})

//페이지 클릭 이벤트
$(document).on("click",".box-comment-pagination .page-link", function(){
	page = $(this).data("page");
	displayCommentAndPagination(page);
});


</script>
</body>
</html>