<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 예약 관리</title>
<style type="text/css">
.post_list_box {
	border: 1px solid black;
	width: 1400px;
	height: 93.4%;
	margin: 100px auto;
	padding: 100px;
	text-align: center;
}
.hr {
	width: 100%;
	height: 0;
	border: 1px solid lightgray;
	margin: 50px 0 50px 0;
}
</style>
</head>
<body>
<div class="post_list_box">
	<div class="box-post-list">
		<!-- 회원 게시글, 댓글 출력 -->
		<table style="width: 100%;">
		<thead>
			<tr>
				<th style="width: 20%;">병원명</th>
				<th style="width: 20%;">프로그램명</th>
				<th style="width: 20%;">프로그램 가격</th>
				<th style="width: 10%;">날짜</th>
				<th style="width: 10%;">시간</th>
				<th style="width: 10%;">예약상태</th>
				<th style="width: 10%;">취소버튼</th>
			</tr>
		</thead>
		<tr class="hr"></tr>
		<tbody>
			<tr style="height: 100px; border-bottom: 1px solid lightgray;">
				<td>df</td>
				<td>df</td>
				<td>df</td>
				<td>df</td>
				<td>df</td>
				<td>df</td>
				<td><button>취소</button></td>
			</tr>
		</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
//getPostList();
function getPostList(){
   $.ajax({
      async : true,
      url : '<c:url value="/board/userpost"/>', 
      type : 'post', 
      data : {
    	  page : page_po,
    	  type : type_po,
    	  search : search_po,
    	  po_id : po_id
      },
      dataType : "json", 
      success : function (data){
    	 displayPostList(data.poList);
         displayPostPagination(data.pm);
         displayPostSearchBox();
      }, 
      error : function(jqXHR, textStatus, errorThrown){

      }
   });
}
function displayPostList(poList){
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
   if(poList == null || poList.length == 0){
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
      $('.box-post-list').html(str);
      return;
   }
   str += `
	   <tbody>
   `;
   for(item of poList){
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
	$('.box-post-list').html(str);
}
</script>
</body>
</html>