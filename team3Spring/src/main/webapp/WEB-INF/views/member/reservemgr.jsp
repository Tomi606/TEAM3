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
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: green;
    border-color: green;
}
.검색 {
	 border: 1px solid rgba(0, 128, 0, 0.5);
     outline-style: none;
     width: 500px;
     padding: 10px 50px 10px 10px;
     height: 100%;
}
.search-box-box{
 width: 50%;display:flex;
	height: 50px;
	margin: 80px auto 100px auto;
	text-align: center;
 }
 .search-box {
	height: 50px;
	margin: 80px 0 100px 0;
}
.search-btn {
	background-color:white;
	border:1px solid rgba(0, 128, 0, 0.5);
    width: 100px; 
    height: 50px;
    position: static;
}
.search-type {
	outline-style:none;
   	border-color: rgba(0, 128, 0, 0.5);
     padding: 5px;
     width: 150px;
     font-size: 16px; 
     color: #333; 
 }
.search-type option {
    background-color: #fff;
}
.search-btn:hover{
  background-color: rgba(0, 128, 0, 0.5);
  
  }

.search-btn:focus {
    outline: none;
}
.pagination{margin-top:50px; }
.post-search-box{text-align: center;width: 100%}
</style>
</head>
<body>
<div class="post_list_box">
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
<script type="text/javascript">
let page = 1;
let type = 'hoName';
let search = '';
let rv_num = 0;

getPostList();
function getPostList(){
   $.ajax({
      async : true,
      url : '<c:url value="/member/reservemgr"/>', 
      type : 'post', 
      data : {
    	  page : page,
    	  type : type,
    	  search : search
      },
      success : function (data){
    	 displayPostList(data.bookList);
         displayPostPagination(data.pm);
         displayPostSearchBox();
      }, 
      error : function(jqXHR, textStatus, errorThrown){

      }
   });
}
function displayPostList(bookList){
   let str = `
	   <table style="width: 100%;">
		<thead>
			<tr>
				<th style="width: 20%;">병원명</th>
				<th style="width: 20%;">프로그램명</th>
				<th style="width: 20%;">프로그램 가격</th>
				<th style="width: 10%;">날짜</th>
				<th style="width: 10%;">시간</th>
				<th style="width: 10%;">예약상태</th>
				<th style="width: 10%;"></th>
			</tr>
		</thead>
		<tr class="hr"></tr>
   `;
   if(bookList == null || bookList.length == 0){
      str += `
    	  <tbody>
	    	  <tr style="height: 400px;">
				<td colspan="7">
					<div>
						<h3 style="color: lightgray">예약 내역이 존재하지 않습니다.</h3>
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
   for(item of bookList){
	   console.log(item);
      str += 
      ` <tr style="height: 100px; border-bottom: 1px solid lightgray;">
			<td>\${item.hospital.ho_name}</td>
			<td>\${item.hospitalProgram.hp_title}</td>
			<td>\${item.hospitalProgram.hp_payment}</td>
			<td>\${item.reservationScheduleVO.rsDate}</td>
			<td>\${item.reservationScheduleVO.rsTime}</td>
			<td>\${item.rv_rvs_name}</td>
	  `;
      
      if(item.rv_rvs_name == "예약완료"){
    	  str += `
    		  <td><button type="button" class="cancelBtn" data-target="\${item.rv_num}">취소</button></td>
    		</tr>
    	  `;
      }else{
    	  str += `
    		  <td>취소 완료</td>
    		</tr>
    	  `;
      }
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
			<a class="page-link page" href="javascript:void(0);" data-page="\${pm.startPage - 1}">이전</a>
		</li>`;
   }
   for(let i = pm.startPage; i<= pm.endPage; i++){
      let active = pm.cri.page == i ? 'active' : '';
      str += `
      <li class="page-item \${active}">
         <a class="page-link page" href="javascript:void(0);" data-page="\${i}">\${i}</a>
      </li>`;
   }
   if(pm.next){
      str += `
      <li class="page-item">
         <a class="page-link page" href="javascript:void(0);" data-page="\${pm.endPage + 1}">다음</a>
      </li>`;
   }
   $('.box-pagination>ul').html(str);
}
$(document).on('click','.box-pagination .page',function(){
   page = $(this).data('page');
   getPostList();
});

function displayPostSearchBox(){
	let str = '';
	if(type == 'hoName'){		
		str = `
			<div class="search-box-box">
				<select name="type" class="search-type">
					<option value="hoName" selected>병원명</option>
					<option value="hoProgram">프로그램명</option>
				</select>
				<input type="search" class="검색 search-search" name="search" placeholder="검색어를 입력하세요" value="\${search}">
				<button class="search-btn" type="button">검색</button>
			</div>	
		`;
	}else{
		str = `
			<div class="search-box-box">
				<select name="type" class="search-type">
					<option value="hoName">병원명</option>
					<option value="hoProgram" selected>프로그램명</option>
				</select>
				<input type="search" class="검색 search-search" name="search" placeholder="검색어를 입력하세요" value="\${search}">
				<button class="search-btn" type="button">검색</button>
			</div>	
		`;
	}
	$('.post-search-box').html(str);
}

$(document).on('click','.search-btn',function(){
   type = $('.search-type').val();
   search = $('.search-search').val();
   
   getPostList();
});

$(document).on('click','.cancelBtn',function(){
   rv_num = $(this).data('target');
   
   $.ajax({
      async : true,
      url : '<c:url value="/member/bookcancel"/>', 
      type : 'post', 
      data : {
    	  rv_num : rv_num
      },
      success : function (data){
    	  if(data){
    		  alert("예약 취소가 완료되었습니다.");
    		  getPostList();
    	  }
    	  else{
    		  alert("예약 취소를 실패하였습니다.");
    		  getPostList();
    	  }
      }, 
      error : function(jqXHR, textStatus, errorThrown){

      }
   });
});
</script>
</body>
</html>