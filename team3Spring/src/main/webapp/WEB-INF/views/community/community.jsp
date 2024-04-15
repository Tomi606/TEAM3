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
	height: 400px;
	border: 1px solid gray;
	border-radius: 20px;
	display: inline-block;
	margin-right: 50px;
	padding: 10px;
	text-align: center;
}
.post-box {
    width: 40%;
    height: 400px;
    border: 1px solid gray;
    border-radius: 20px;
    display: inline-block;
    padding: 30px;
    text-align: center;
    vertical-align: top; /* 상단 정렬을 유지합니다. */
    position: relative; /* 상대적 위치 설정 */
}

.box-comment-pagination {
    position: absolute; /* 절대적 위치 설정 */
    bottom: 10px; /* 하단 여백 조절 */
    left: 50%; /* 가운데 정렬을 위해 왼쪽 위치를 50%로 설정 */
    transform: translateX(-50%); /* 가운데 정렬을 위해 왼쪽 위치를 현재 요소의 가로 크기의 반만큼 왼쪽으로 이동 */
    margin-top: 20px;
}
.delete-box{
	margin-top: 20px;
}
.delete-box > a {
    padding-top: 20px;
}
tr th,
tr td{
text-align: center;
}


</style>
</head>
<body>

<div class="board-post-box">

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
		
	<div class="post-box">
		<div class="input-group mb-3">
			<table class="table table-striped">
				<thead class="postthead">
					
				</thead>
				<tbody class="posttbody">
					
				</tbody>
			</table>
			<div class="box-comment-pagination">
				<ul class="pagination justify-content-center">
					
				</ul>
			</div>
			<div class="delete-box">
			</div>
				
		</div>
	</div>
</div>
<div class="hr" style="margin-top:30px;margin-bottom:40px;border: 1px solid #d2d2d2;width: 1500px; margin: 0 auto"></div>


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



//지우지마시오!!!
let page = 1;//지우지 마시오!!!
//지우지마시오!!!

//게시글을 불러와서 페이지에 출력하는 함수
function displayPostAndPagination(){
	let bo_num = $("[name=type]").val();
	//ajax를 이용해서 서버에 현재 댓글 페이지 정보를 보내고, 
	//서버에서 보낸 댓글 리스트와 페이지네이션 정보를 받아와서 화면에 출력
	$.ajax({
		url : '<c:url value="/post"/>',
		method : 'get',
		data : {"bo_num" : bo_num,
			"page" : page},
		success : function(data){
			displayPost(data.list);
			displayCommentPagination(data.pm);
		}
	});
}

//댓글을 불러와서 페이지에 출력하는 함수
function displayCommentAndPagination(po_num){
	//ajax를 이용해서 서버에 현재 댓글 페이지 정보를 보내고, 
	//서버에서 보낸 댓글 리스트와 페이지네이션 정보를 받아와서 화면에 출력
	page = 1;
	$.ajax({
		url : '<c:url value="/comment"/>',
		method : 'post',
		data : {"po_num" : po_num,
			"page" : page},
		success : function(data){
			console.log(data)
			//displayPost(data.list);
			//displayCommentPagination(data.pm);aker pm = new PageMaker(3, cri, totalCount);
		}
	});
}

/* 게시글 삭제 메서드 */
$(document).on('click', '.post-delete-btn', function(){
    let po_num = prompt("삭제하고 싶은 게시글 번호를 입력하세요:");
    let bo_num = $("[name=type]").val();
    let queryParams = "po_num=" + po_num + "&po_bo_num=" + bo_num;
    if(po_num == null){
        return;
    } else {
        let url = '<c:url value="/post/delete"/>' + '?' + queryParams;    
        location.href = url;
    } 
});

/* 댓글 조회 메서드 */
$(document).on('click', '.post-select-btn', function(){
    let po_num = prompt("댓글을 조회화고 싶은 게시글 번호를 입력하세요:");
    if(po_num == null){
        return;
    } else {
    	displayCommentAndPagination(po_num);
    } 
});


function displayPost(postList){
	/* 게시판이 바뀔떄마다 그 게시판에 맞는 게시글을 가지고 옴 */
		let str = ``;
		let str2 = 
			`
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>신고 횟수</th>
				</tr>
			`;
		$('.postthead').html(str2);
		for(let tmp of postList){
			str+=
				`
				<tr>
					<td>\${tmp.po_num}</td>
					<td>\${tmp.po_title}</td>
					<td>\${tmp.sitemanagement.site_id}</td>
					<td>\${tmp.po_report_count}</td>
				</tr>
				`
		}
		$('.posttbody').html(str);	
		$('.delete-box').empty(); // 기존 내용을 지우고 새로운 내용을 추가합니다.
		$('.delete-box').append('<a class="btn post-delete-btn">게시글 삭제</a>');
		$('.delete-box').append('<a class="btn post-select-btn">댓글 조회</a>');
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
	displayPostAndPagination();
})

//페이지 클릭 이벤트
$(document).on("click",".box-comment-pagination .page-link", function(){
	page = $(this).data("page");
	displayPostAndPagination(page);
});


</script>
</body>
</html>