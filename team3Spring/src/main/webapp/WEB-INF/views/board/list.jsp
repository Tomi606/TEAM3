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
	border:2px solid green;
	width: 1400px;
	height: 93.4%;
	margin: 100px auto;
	padding:0 100px 100px 100px;
	text-align: center;
	border-radius: 15px;
}

.post_list_box{
   box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
    transition: box-shadow 0.3s ease;
}
.hr {
	width: 100%;
	height: 0;
	border: 1px solid lightgray;
	margin: 50px 0 50px 0;
}

.검색 {
	 border
	 : 1px solid rgba(0, 128, 0, 0.5);
        outline-style: none;
        width: 500px;
        padding: 10px 50px 10px 10px;
        height: 100%;
}

.post_insert_btn {
	line-height: 50px;
	color: green;
	height: 100%;
	width: 100%;;
	border: 1px solid  rgba(0, 128, 0, 0.5);;
	padding: 13px;
}

.post_insert_btn:hover {
	color: white;
	background-color:  rgba(0, 128, 0, 0.5);
	text-decoration: none;
}

.post_insert_btn_box {
	height: 50px;
	width: 100px;
	margin: 0 20px 40px auto;
}

.search-box-group {
	width:100%;
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

.page-link{
color:  rgba(0, 128, 0, 0.5);
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: green;
    border-color:  rgba(0, 128, 0, 0.5);;
 }
 .search-box-box{
 width: 50%;display:flex;
	height: 50px;
	margin: 80px auto 100px auto;
 }
 
  .search_type {
  		outline-style:none;
       	border-color: rgba(0, 128, 0, 0.5);
        padding: 5px;
        width: 150px;
        font-size: 16px; 
        color: #333; 
    }

    .search_type option {
        background-color: #fff;
    }
    .search-btn {
    	background-color:white;
    	border:1px solid rgba(0, 128, 0, 0.5);
        width: 100px; 
        height: 50px;
        cursor: pointer;
    }
      .search-btn:hover{
      background-color: rgba(0, 128, 0, 0.5);
      
      }

    .search-btn:focus {
        outline: none;
    }
   h1{color: #555;}
   .board_location,.board_location>a{
 		color: #555;
 	}
   .board_title_container{width: 100%;}
   .board_location{
   	height: 80px;padding-top: 20px;width: 100px;
   }
   .prev_btnBtn{color: black;}
</style>
</head>
<body>
	<div class="post_list_container">
		<div class="post_list_box">
			<div class="board_title_container">
				<div class="board_location">
						<a class="prev_btnBtn" 
					href="<c:url value="/board/all"/>">게시판</a> ><a> 게시글</a>
				</div>
				<div>
				<h1>${bo_title}</h1>
				</div>
			</div>	
			<div class="hr"></div>
			<form action="<c:url value='/board/list'/>" method="get">
				<div class="search-box-group">
					<div class="search-box-box">
						<input type="hidden" name="bo_num" value="${bo_num}">
						<select name="type" id="type" class="search_type">
							<option value="all"
								<c:if test="${pm.cri.type == 'all'}">selected</c:if>>전체</option>
							<option value="title"
								<c:if test="${pm.cri.type == 'title'}">selected</c:if>>제목만</option>
							<option value="titleContent"
								<c:if test="${pm.cri.type == 'titleContent'}">selected</c:if>>제목 + 내용</option>
							<option value="writer"
								<c:if test="${pm.cri.type == 'writer'}">selected</c:if>>글작성자</option>
						</select>
						<input type="search" class="검색" name="search" placeholder="검색어를 입력하세요">
						<button type="submit" class="search-btn">검색</button>
					</div>	
				</div>
			</form>
			<div class="post_insert_btn_box">
				<a href="<c:url value='/board/insert?bo_num=${bo_num}'/>"
					class="post_insert_btn">작성하기</a>
			</div>
			<div>
				<table style="width: 100%;height: 100%;margin-bottom: 20%;">
					<thead>
						<tr>
							<th style="width: 5%;">No</th>
							<th style="width: 40%;">제목</th>
							<th style="width: 10%;">작성자</th>
							<th style="width: 30%;">작성일</th>
							<th style="width: 7.5%;">추천수</th>
							<th style="width: 7.5%;">조회수</th>
						</tr>
					</thead>
					<tr class="hr"></tr>
					<tbody>
						<c:choose>
							<c:when test="${not empty poList}">
								<c:set var="postFound" value="false" />
								<c:set var="boPostCount" value="0" />
								<!-- 각 bo_num별 게시글 수 초기화 -->
								<c:forEach items="${poList}" var="po" varStatus="poIndex">
									<c:set var="boPostCount" value="${boPostCount + 1}" />
									<tr style="height: 100px; border-bottom: 1px solid lightgray;font-size: 18px;">
										<td style="width: 5%;">${boPostCount}</td>
										<td style="width: 40%;">
											<a href="<c:url value="/board/detail?po_num=${po.po_num}"/>" class="title-link">${po.po_title}</a>
											<a href="<c:url value="/board/detail?po_num=${po.po_num}#comments-section"/>" class="comment-link"> [${po.po_co_count}]</a>
										</td>
										<td style="width: 10%;">${po.po_id}</td>
										<td style="width: 30%;">${po.changeDate1}</td>
										<td style="width: 7.5%;">${po.po_up}</td>
										<td style="width: 7.5%;">${po.po_view}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr style="height: 400px;">
									<td colspan="6">
										<div>
											<h3 style="color: lightgray">게시글이 존재하지 않습니다.</h3>
										</div>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<ul class="pagination justify-content-center" >
				<c:if test="${pm.prev}">
					<c:url value="/board/list?bo_num=${bo_num}" var="url">
						<c:param name="page" value="${pm.startPage - 1}" />
						<c:param name="type" value="${pm.cri.type}" />
						<c:param name="search" value="${pm.cri.search}" />
					</c:url>
					<li class="page-item"><a class="page-link" href="${url}">이전</a>
					</li>
				</c:if>
				<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
					<c:url value="/board/list?bo_num=${bo_num}" var="url">
						<c:param name="page" value="${i}" />
						<c:param name="type" value="${pm.cri.type}" />
						<c:param name="search" value="${pm.cri.search}" />
					</c:url>
					<li
						class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
						<a class="page-link" href="${url}">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${pm.next}">
					<c:url value="/board/list?bo_num=${bo_num}" var="url">
						<c:param name="page" value="${pm.endPage + 1}" />
						<c:param name="type" value="${pm.cri.type}" />
						<c:param name="search" value="${pm.cri.search}" />
					</c:url>
					<li class="page-item"><a class="page-link" href="${url}">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
<script type="text/javascript">
checkLogin();
function checkLogin() {
	  //로그인 했을 때
	  if ('${user.site_id}' != '') {
	    return true;
	  }
	  //안 했을 때
	  let answer = confirm("로그인이 필요한 기능입니다. \n로그인 페이지로 이동하겠습니까?");
	  if (answer) {
	    location.href = '<c:url value="/main/login"/>';
	  }else {
		  alert("로그인후 이용 해주세요.")
		  location.href = '<c:url value="/"/>';
	}
	  return false;
	}
</script>
</body>
</html>