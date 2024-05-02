<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.post_list_container {
	width: 100%;
	height: 1500px;
}

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

.검색 {
	outline-style: none;
	width: 400px;
	padding: 10px 50px 10px 10px;
	height: 100%;
}

.post_insert_btn {
	line-height: 50px;
	color: green;
	height: 100%;
	width: 100%;;
	border: 1px solid green;
	padding: 13px;
}

.post_insert_btn:hover {
	color: white;
	background-color: green;
	text-decoration: none;
}

.post_insert_btn_box {
	height: 50px;
	width: 100px;
	margin: 0 20px 40px auto;
}

.search-box {
	height: 50px;
	margin: 80px 0 100px 0;
}

.search-btn {
	height: 100%;
	position: relative;
	right: 52px;
	bottom: 1px;
}
.title-link{
	color: black;
}
.comment-link{
	color: red;
	font-weight: 600;
}
.comment-link:hover{
	color: black;
}
</style>
</head>
<body>
	<div class="post_list_container">
	<!-- 병원이면 누르면 병원 상세 뜨는 버튼 만들어도 좋을 것 같다. -->
		<div class="post_list_box">
			<h1>${po_id}</h1>
			<c:if test="${site_authority eq 'MANAGER'}">
				<span>병원 회원</span>
				<span>
					<a href="<c:url value='/hospital/detail/detail?ho_id=${po_id}'/>">병원 상세 바로가기</a>
				</span>
			</c:if>
			<c:if test="${site_authority eq 'USER'}">
				<span>일반 회원</span>
			</c:if>
			<c:if test="${site_authority eq 'ADMIN'}">
				<span>관리자</span>
			</c:if>
			
			<div class="hr"></div>
			<div class="box-post-list">
				<!-- 회원 게시글, 댓글 출력 -->
			</div>
			<div class="box-pagination">
				<ul class="pagination justify-content-center">
					<!-- 페이지네이션 출력 -->
				</ul>
			</div>
			<div class="post-search-box">
				<!-- 게시글 검색 박스 출력 -->
			</div>
		</div>
	</div>
<script type="text/javascript">
let page = 1;
let type = 'title';
let search = '';
let po_id = "${po_id}";	

getPostList();
function getPostList(){
   $.ajax({
      async : true,
      url : '<c:url value="/board/userpost"/>', 
      type : 'post', 
      data : {
    	  page : page,
    	  type : type,
    	  search : search,
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
      $('.box-comment-list').html(str);
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
   $('.box-pagination>ul').html(str);
}
$(document).on('click','.box-pagination .page-link',function(){
   page = $(this).data('page');
   getPostList();
});

function displayPostSearchBox(){
	let str = '';
	if(type == 'title'){		
		str = `
			<select name="type" class="search-type">
				<option value="title" selected>제목만</option>
				<option value="titleContent">제목 + 내용</option>
			</select>
			<input type="search" class="검색 search-search" name="search" placeholder="검색어를 입력하세요" value="\${search}">
			<button class="search-btn" type="submit">검색</button>
		`;
	}else{
		str = `
			<select name="type" class="search-type">
				<option value="title">제목만</option>
				<option value="titleContent" selected>제목 + 내용</option>
			</select>
			<input type="search" class="검색 search-search" name="search" placeholder="검색어를 입력하세요" value="\${search}">
			<button class="search-btn" type="submit">검색</button>
		`;
	}
	$('.post-search-box').html(str);
}

$(document).on('click','.search-btn',function(){
   type = $('.search-type').val();
   search = $('.search-search').val();
   
   getPostList();
});
</script>
</body>
</html>