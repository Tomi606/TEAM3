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
.post_list_container{width: 100%;height: 1500px;}
.post_list_box{
	    border: 2px solid green;width: 1400px;height: 93.4%;margin:100px auto;
	padding:100px;
}
.post_list_box{
   box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
    transition: box-shadow 0.3s ease;    border-radius: 15px;
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
width: 100%;margin: 0 auto 20px auto;

}
.insert-btn-box{
margin-top:50px;
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
.delete-button{cursor: pointer;margin-left:5px;color:#b4b4b4; }
.delete-button:hover{color: gray;}
.fileList_box{width: 100%;height: 50px;}
#fileList{display: flex;list-style: none;}
#fileList li{margin: 10px;border: 1px solid lightgray;background-color: lightgray;padding: 5px;border-radius: 7px;}
  h1{color: #555;}
</style>
</head>
<body>
	<div class="post_list_container">

		<div class="post_list_box">
			<div style="text-align: center;">
				<h1>글 쓰 기 </h1>
			</div>
			<div class="post_insert_btn_box">
		    	<a href="<c:url value="/board/list?bo_num=${bo_num}"/>" class="post_insert_btn">목록으로</a>
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
						<input type="file" name="files" multiple="multiple" id="fileInput">
					</div>   
					<div class="fileList_box">
						 <ul id="fileList"></ul>
					</div>	 
					<div class="insert-btn-box"style="text-align: center;">	
						<button class="insert-btn">작성하기</button>
					</div>
				</div>	
			</form>
		</div>
	</div>
<script type="text/javascript">
   $('[name=po_content]').summernote({
      placeholder: '내용',
      tabsize: 2,
      maxHeight: 400,
      minHeight: 400,
      width:1200
   });
   $(document).ready(function() {
	    $('#fileInput').on('change', function(event) {
	        let fileList = event.target.files;
	        let $listContainer = $('#fileList');
	        
	        let $listFile = $listContainer.find('li');
	        $listFile.detach();

	        for (let file of fileList) {
	        	let $listItem = $('<li>').text(file.name);
	        	let $delete = $('<span>').text('x').addClass('delete-button');
	            $listItem.append($delete);
	            $listContainer.append($listItem);
	        }
	        $listContainer.append($listFile);
	    });

	    $('#fileList').on('click', '.delete-button', function() {
	        $(this).parent().remove();
	    });
	});



</script>
</body>
</html>