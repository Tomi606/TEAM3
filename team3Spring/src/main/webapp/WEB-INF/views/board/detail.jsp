<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
<style type="text/css">
.post_list_container{width: 100%;height: 100%;}
.post_list_box{
	border: 1px solid lightgray;width: 1400px;height: 100%;margin:100px auto;
	padding:100px;
}
.hr{width: 100%;height: 0;border: 1px solid lightgray;margin: 50px 0 50px 0;}
.post_insert_btn{
	line-height: 50px;color: green;height: 100%;width: 100%;
	border: 1px solid green; padding: 13px;
}
.post_insert_btn:hover{color: white;background-color: green;text-decoration: none;}
.post_insert_btn_box{height: 50px;width: 100px;margin: 0 20px 40px auto;}
.content_container{
width: 100%;height: 100%;padding: 20px;}
.content-input{width: 100%;display: flex;}
.content-title{width: 95%;padding: 3px;outline-style: none;border: 1px solid lightgray;}
.content-text{width: 100%;display: flex;}
.content-content{width: 95%;padding: 3px;outline-style: none; resize: none;border:1px solid lightgray;
min-height: 600px;max-height: 600px;}
.content-file{display:flex;
width: 80%;margin: 0 auto 80px auto;

}
.insert-btn{
    border: 1px solid green;
    background: white;
    width: 300px;
    padding: 8px;
}
.insert-btn:hover{
	 background: green;color: white;
}
.p_tag{margin-top: 60px ;margin-left:auto;display: flex;flex-direction: row-reverse;}
</style>
</head>
<body>
	<div class="post_list_container">
		<div class="post_list_box">
			<div style="text-align: center;">
				<h1>${post.po_bo_title}</h1>
			</div>
			<div class="post_insert_btn_box">
		    	<a href="<c:url value="/board/list?bo_num=${post.po_bo_num}"/>" class="post_insert_btn">목록으로</a>
			</div>
			<div class="hr"></div>
			<div class="content_container">
				<input type="hidden" name="po_bo_num" value="${bo_num}" readonly>
				<div class="content-input">
					<label style="width: 5%;">제목</label>
					<input type="text" class="content-title" name="po_title" value="${post.po_title}" readonly> 
				</div>   	
				<div class="content-input" style="margin-top: 40px">
					<label style="width: 5%;">작성자</label>
					<input type="text" class="content-title" name="po_id" value="${post.po_id}" readonly>
				</div>   
				<div class="p_tag">	
					<p style="color: gray">조회수:${post.po_view}</p>
				</div>	
				<div class="content-text">
					<label style="width: 5%;">내용</label>
					<textarea class="content-content" name="po_content" readonly 
					style="max-height: 400px;">${post.po_content}</textarea>
				</div>
				<div class="input-group mb-3 mt-3">
				    <button class="btn btn-outline-success btn-up col-6" data-state="1">추천(<span class="text-up">${post.po_up}</span>)</button>
				    <button class="btn btn-outline-success btn-down col-6" data-state="-1">비추천(<span class="text-down">${post.po_down}</span>)</button>
			   </div>
				<div class="content-file">
					<label style="margin: 0 20px 0 58px;">첨부파일</label>
					<input type="file" name="files" >
				</div> 
				<!-- 댓글 -->  
				<div class="container-comment mt-3 mb-3">
					<h2>
						댓글(<span class="comment-total">2</span>)
					</h2>
					<div class="box-comment-list">
						<div class="box-comment row">
							<div class="col-3">아이디</div>
							<div class="col-9">내용</div>
						</div>
					</div>
					<div class="box-pagination">
						<ul class="pagination justify-content-center"></ul>
					</div>
					<div class="box-commnt-insert">
						<div class="input-group mb-3">
							<textarea class="form-control textarea-comment"></textarea>
							<button class="btn btn-outline-success btn-comment-insert">댓글등록</button>
						</div>
					</div>
				</div>
				<!-- 댓글 끝-->
				<c:url value="/board/list" var="url">
					<c:param name="page" value="${cri.page}" />
					<c:param name="type" value="${cri.type}" />
					<c:param name="search" value="${cri.search}" />
				</c:url>
				<a href="${url}" class="btn btn-outline-dark">목록으로</a>
				<c:if test="${user.site_num == post.po_mg_num}">
					<a href="<c:url value="/board/delete?boNum=${post.po_num}"/>"
						class="btn btn-outline-success">삭제</a>
					<a href="<c:url value="/board/update?boNum=${post.po_num}"/>"
						class="btn btn-outline-warning">수정</a>
				</c:if>
			</div>	
		</div>
	</div>
	
<!-- 썸머노트 -->
<script type="text/javascript">
   $('[name=content]').summernote({
      placeholder: '내용',
      tabsize: 2,
      maxHeight: 400,
      minHeight: 400,
      width:1200
   });
</script>
<!-- 추천 / 비추천 -->
<script type="text/javascript">
function checkLogin() {
	  //로그인 했을 때
	  if ('${user.site_id}' != '') {
	    return true;
	  }
	  //안 했을 때
	  if (confirm("로그인이 필요한 기능입니다. \n로그인 페이지로 이동하겠습니까?")) {
	    location.href = '<c:url value="/login"/>';
	  }
	  return false;
	}

	$(".btn-up, .btn-down").click(function() {
	  //로그인 여부를 체크
	  if (!checkLogin()) {
	    return;
	  }
	  //서버에 보낼 데이터 생성
	  let state = $(this).data('state');
	  let po_num = '${post.po_num}';
	  let recommend = {
	    re_state: state,
	    re_po_num: po_num
	  }
	  //서버에 전송 json=>json
	  $.ajax({
	    async: true, //비동기 : true(비동기), false(동기)
	    url: '<c:url value="/recommend/check"/>',
	    type: 'post',
	    data: JSON.stringify(recommend),
	    contentType: "application/json; charset=utf-8",
	    dataType: "json",
	    success: function(data) {
	      switch (data.result) {
	        case 1:
	          alert("추천했습니다.");
	          break;
	        case 0:
	          let str = recommend.re_state == 1 ? '추천' : '비추천';
	          alert(`\${str} + 을 취소했습니다.`);
	          break;
	        case -1:
	          alert("비추천했습니다.");
	          break;
	        default:
	          alert("추천/비추천을 하지 못했습니다.");
	      }
	      getRecommend();
	    },
	    error: function(jqXHR, textStatus, errorThrown) {

	    }
	  });
	});

	//로그인한 회원의 추천/비추천 여부와 게시글의 추천/비추천 수를 가져오는 함수
	function getRecommend() {
	  //서버로 보낼 데이터를 생성
	  let num = '${post.po_num}';
	  let obj = {
	    num: num
	  };

	  //서버로 데이터를 전송. object => json
	  $.ajax({
	    async: true,
	    url: '<c:url value="/recommend"/>',
	    type: 'post',
	    data: obj,
	    dataType: "json",
	    success: function(data) {
	    	console.log(data.post);
	      displayUpdateRecommend(data.post);
	      displayRecommend(data.state);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {

	    }
	  });
	}

	function displayUpdateRecommend(post) {
	  $(".text-up").text(post.po_up);
	  $(".text-down").text(post.po_down);
	}

	function displayRecommend(state) {
	  $('.btn-up, .btn-down').addClass("btn-outline-success");
	  $('.btn-up, .btn-down').removeClass("btn-success");
	  if (state == 1) {
	    $('.btn-up').removeClass("btn-outline-success");
	    $('.btn-up').addClass("btn-success");
	  } else if (state == -1) {
	    $('.btn-down').removeClass("btn-outline-success");
	    $('.btn-down').addClass("btn-success");
	  }
	}

	getRecommend();
</script>
<!-- 댓글리스트 -->
<script type="text/javascript">
let cri = {
	   page : 1,
	   search : "${post.po_num}"
	}

	getCommentList(cri);

	function getCommentList(cri){
	   $.ajax({
	      async : true,
	      url : '<c:url value="/comment/list"/>', 
	      type : 'post', 
	      data : JSON.stringify(cri),
	      contentType : "application/json; charset=utf-8",
	      dataType : "json", 
	      success : function (data){
	         displayCommentList(data.list);
	         displayCommentPagination(data.pm);
	         $('.comment-total').text(data.pm.totalCount);
	      }, 
	      error : function(jqXHR, textStatus, errorThrown){

	      }
	   });
	}
function displayCommentList(list){
   let str = '';
   if(list == null || list.length == 0){
      str = '<h3>등록된 댓글이 없습니다.</h3>';
      $('.box-comment-list').html(str);
      return;
   }		
   for(item of list){
	   let boxBtns = 
		   ` <span class="box-btn float-right">
				<button class="btn btn-outline-danger btn-comment-del" data-num="\${item.co_num}">삭제</button>
				<button class="btn btn-outline-danger btn-comment-update" data-num="\${item.co_num}">수정</button>
		   </span>`;
		let btns= '${user.site_num}' == item.co_mg_num ? boxBtns : '';
	      str += 
	      `
	         <div class="box-comment row">
	            <div class="col-3">\${item.co_mg_num}</div>
	            <div class="col-9 clearfix input-group">
	            	<span class="text-comment">\${item.co_content}</span>
	            	\${btns}
	            </div>
	         </div>
	      `
	   }
	   $('.box-comment-list').html(str);
	}
function displayCommentPagination(pm){
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
	   $('.box-pagination>ul').html(str);
	}
	$(document).on('click','.box-pagination .page-link',function(){
	   cri.page = $(this).data('page');
	   getCommentList(cri);
	})	
</script>

<!-- 댓글 등록 -->
<script type="text/javascript">
//댓글 등록 버튼의 클릭 이벤트를 등록
$(".btn-comment-insert").click(function(){
	if(!checkLogin()){
		return;
	}

	let co_content = $('.textarea-comment').val(); // 댓글 내용 가져오기

	let comment = {
		co_content: co_content,
		co_po_num: '${post.po_num}'
	}

	if(comment.co_content.length == 0){
		alert('댓글 내용을 작성하세요.');
		return;
	}

	$.ajax({
		async: true,
		url: '<c:url value="/comment/insert"/>',
		type: 'post',
		data: JSON.stringify(comment),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (data){
			if(data.result){
				alert('댓글을 등록했습니다.');
				$('.textarea-comment').val(''); 
				cri.page = 1;
				getCommentList(cri);
			}else{
				alert('댓글 등록을 실패했습니다.');
			}
		},
		error: function(xhr, textStatus, errorThrown){
			console.log(xhr);
			console.log(textStatus);
		}
	});
});
function checkLogin() {
	if('${user.site_num}' != ''){
			return true;
	}	
	if(confirm("로그인이 필요한 기능입니다. \n로그인 페이지로 이동하겠습니까?")){
		location.href = '<c:url value="/main/login"/>';
	}
	return false;
}
</script>
<!-- 댓글 삭제 -->
<script type="text/javascript">
$(document).on('click','.btn-comment-del',function(){
	let comment = {
		co_num : $(this).data('num')	
	}
	console.log(comment)
	$.ajax({
		async : true, 
		url : '<c:url value="/comment/delete"/>', 
		type : 'post', 
		data : JSON.stringify(comment), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result){
				alert('댓글을 삭제했습니다.');
				getCommentList(cri);
			}else{
				alert('댓글 삭제를 실패했습니다.');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
});
</script>

<script type="text/javascript">
$(document).on('click','.btn-comment-update',function(){
	initComment();
	let contentBox = $(this).parents(".box-comment").find(".text-comment");
	//댓글을 수정할 수 있는 textarea로 변경
	let content = contentBox.text();
	let str=
	`<textarea class="form-control">\${content}</textarea>`;
	contentBox.after(str);
	contentBox.hide();
	//수정 / 삭제버튼을 감추고
	$(this).parents(".box-comment").find('.box-btn').hide();
	//수정 완료 버튼을 추가
	let co_num = $(this).data("num");
	str = `<button class="btn btn-outline-warning btn-complete" data-num="\${co_num}">수정 완료</button>`;
		$(this).parents(".box-comment").find('.box-btn').after(str);
		
});

$(document).on('click','.btn-complete', function(){
	//전송할 데이터를 생성 => 댓글 수정 => 댓글 번호, [댓글 내용],
	let comment = {
		co_content : $('.box-comment').find('textarea').val(),
		co_num : $(this).data("num")
	}
	//서버에 ajax로 데이터를 전송 후 처리
	$.ajax({
		async : true, //비동기 : true(비동기), false(동기)
		url : '<c:url value="/comment/update"/>', 
		type : 'post', 
		data : JSON.stringify(comment), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result){
				alert('댓글을 수정 했습니다.');
				getCommentList(cri);
			}else{
				alert('댓글 수정을 실패했습니다.');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});// ajax end;
})
//수정 버튼을 누른 상태에서 다른 수정버튼을 누르면 기존에 누른 댓글을 원상태로 돌려주는 함수
function initComment(){
	$('.btn-complete').remove();
	$('.box-comment').find('textarea').remove();
	$('.box-btn').show();
	$('.text-comment').show();
}

</script>
 </body>
</html>