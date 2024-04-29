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
.content-text{width: 100%;display: flex;margin: 60px 0;}
.content-content{width: 93%;padding: 3px;outline-style: none; resize: none;
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
</style>
</head>
<body>
	<div class="post_list_container">

		<div class="post_list_box">
			<div style="text-align: center;">
				<h1>글 쓰 기 </h1>
			</div>
			<div class="post_insert_btn_box">
		    	<a href="<c:url value="/board/list"/>" class="post_insert_btn">목록으로</a>
			</div>
			<div class="hr"></div>
			<form action="<c:url value='/board/insert'/>" method="post"  enctype="multipart/form-data">
				<div class="content_container">
					<input type="hidden" name="po_bo_num" value="${bo_num}">
					<div class="content-input">
						<label style="width: 5%;">제목</label>
						<input type="text" class="content-title" name="po_title">
					</div>   	
					<div class="content-text">
						<label style="width: 5%;">내용</label>
						<textarea class="content-content" name="po_content"
						style="max-height: 400px;"></textarea>
					</div>
					<div class="content-file">
						<label style="margin: 0 20px 0 58px;">첨부파일</label>
						<input type="file" name="files">
					</div>   
					<div style="text-align: center;">	
						<button class="insert-btn">작성하기</button>
					</div>
				</div>	
			</form>
		</div>
	</div>
<script type="text/javascript">
   $('[name=content]').summernote({
      placeholder: '내용',
      tabsize: 2,
      maxHeight: 400,
      minHeight: 400,
      width:1200
   });
</script>
</body>
</html>