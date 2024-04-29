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
.post_list_container{width: 100%;height: 1500px;}
.post_list_box{
	border: 1px solid lightgray;width: 1400px;height: 93.4%;margin:100px auto;
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
</body>
</html>