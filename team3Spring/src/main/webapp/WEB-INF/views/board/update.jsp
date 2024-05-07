<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <!-- include plugin -->
    <script src="[folder where script is located]/[plugin script].js"></script>
<style type="text/css">
.report-box li{
	list-style: none;width: 50px;height: 50px;
}
.report-box{
 	  background-image:url("<c:url value="/resources/img/red_siren.png"/>");
      margin-left:auto;
      background-size: 30px;
      width:50px;
      height:50px;
      background-repeat:no-repeat;
      fill: #ddd;
}
.report-box-comment li{
	list-style: none;width: 50px;height: 50px;
}
.report-box-comment{
 	  background-image:url("<c:url value="/resources/img/red_siren.png"/>");
      margin-left:auto;
      background-size: 30px;
      width:50px;
      height:50px;
      background-repeat:no-repeat;
      fill: #ddd;
}
.red_btn{
 background-image:url("<c:url value="/resources/img/red_siren.png"/>");
      margin-left:auto;
      background-size: 30px;
      width:50px;
      height:50px;
      background-repeat:no-repeat;
      fill: #ddd;

}
.red_btn_comment{
 background-image:url("<c:url value="/resources/img/red_siren.png"/>");
      margin-left:auto;
      background-size: 30px;
      width:50px;
      height:50px;
      background-repeat:no-repeat;
      fill: #ddd;

}
.btn-like{
 background-image:url("<c:url value="/resources/img/heart.png"/>");
	  margin-left:auto;
      background-size: 30px;
      width:50px;
      height:50px;
      background-repeat:no-repeat;
      fill: #ddd;
}
.btn-heart{
	  background-image:url("<c:url value="/resources/img/red_heart.png"/>");
	  margin-left:auto;
      background-size: 30px;
      width:50px;
      height:50px;
      background-repeat:no-repeat;
      fill: #ddd;
}

.btn-heart.active{
      fill: red;
}
textarea{outline-style: none;}
.post_list_container{width: 100%;height: 100%;}
.post_list_box{
	border:2px solid green;width: 1400px;height: 100%;margin:100px auto;
	padding:100px;	border-radius: 15px;
}
.hr{width: 100%;height: 0;border: 1px solid lightgray;margin: 50px 0 50px 0;}
.post_insert_btn{
	line-height: 50px;color: green;height: 100%;width: 100%;
	border: 1px solid green; padding: 13px;
}
.post_list_box{
   box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
    transition: box-shadow 0.3s ease;
}
.post_insert_btn:hover{color: white;background-color: green;text-decoration: none;}
.post_insert_btn_box{height: 50px;width: 100px;margin: 0 20px 40px auto;}
.content_container{
width: 100%;height: 100%;padding: 5px;}
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
.p_tag{margin-left:auto;display: flex;flex-direction: row-reverse;}

.writer-more{
        text-align: center;
    width: 183px;
	display: inline-block;
	color: black;
	height: 40px;
	background-color: #f5f6f8;
	line-height: 40px;
	border-radius: 8px;
}
.writer-more:hover{
	text-decoration: none;
	color: gray;
}
.comment_content{ resize: none; width: 92%;}
.box-comment{margin:30px 0 20px 0;
width: 100%;height: 60px;border-bottom: 1px solid gray;

}
.like-box{display:  flex;margin: 20px 0 80px auto;}
.user_more_post{margin-left: 53px;margin-top: 10px;}
.btn-insert-comment{
	background-color: white; color: green;border: 1px solid green;
}
.btn-insert-comment:hover{
	background-color: green; color: white;
}
.file-box{
	width: 100%;display: flex;justify-content: center;border: 1px solid #d2d2d2;margin-bottom: 120px;
}
..input-group{}
.comment_id{
	color: black;text-decoration: none;
}
.comment_id:hover {
	color: black;text-decoration: underline;
}
.page-link{
color: green;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: green;
    border-color: green;
 }
 
 
 .modal {
	display: none;
	position: fixed;
	z-index: 990;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}
 .modal_comment {
	display: none;
	position: fixed;
	z-index: 990;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 500px;
	text-align: center;
}
.modal-comment-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 500px;
	text-align: center;
}

.close {
	color: #aaa;
	margin: 0 24px 8px auto;
	font-size: 50px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
.p_tag>a{
 color: black;
 text-decoration: none;
}
.p_tag>a:hover {
	text-decoration: underline;
	color:  rgba(0, 128, 0, 0.5);
}
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
				<input type="hidden" name="po_bo_num" value="${bo_num}"  >
				<div class="content-input">
					<label style="width: 5%;">제목</label>
					<input type="text" class="content-title" name="po_title" value="${post.po_title}" > 
				</div>   	
				<div class="content-text" style="margin-top: 40px">
					<label style="width: 5%;">내용</label>
					<textarea class="content-content" name="po_content"   
					style="max-height: 400px;">${post.po_content}</textarea>
				</div>
			
			  </div> 
			 	<label>첨부파일</label>
			 <div class="form-group file-box">	
			 	<c:forEach items="${fileList}" var="file">		
			 			<c:if test="${file.img}">
			 					<a href="<c:url value="/download${file.fi_name}"/>" download="${file.fi_ori_name}">
									<img alt="이미지" height="100" src="<c:url value="/download${file.fi_name}"/>">
								</a>
			 			</c:if>
			 			<c:if test="${!file.img }">
					 			<a href="<c:url value="/download${file.fi_name}"/>" download="${file.fi_ori_name }">${file.fi_ori_name }</a>
			 			</c:if>
			 	</c:forEach>
			 </div>
			</div>	
		</div>
	
<!-- 썸머노트 -->
<script type="text/javascript">
   $('[name=po_content]').summernote({
      placeholder: '내용',
      tabsize: 2,
      maxHeight: 400,
      minHeight: 400,
      width:1200
   });
</script>
 </body>
</html>