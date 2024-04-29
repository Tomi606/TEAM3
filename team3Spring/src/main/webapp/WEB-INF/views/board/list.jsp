<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.post_list_container{width: 100%;height: 1500px;}
.post_list_box{border: 1px solid black;width: 1400px;height: 93.4%;margin:100px auto;
padding:100px;text-align: center;}
.hr{
width: 100%;height: 0;border: 1px solid lightgray;margin: 50px 0 50px 0;
}
.검색{
outline-style:none;
width: 400px;padding: 10px 50px 10px 10px;height: 100%;
}
.post_insert_btn{
line-height: 50px;color: green;height: 100%;width: 100%;
;border: 1px solid green; padding: 13px;
}
.post_insert_btn:hover{
color: white;background-color: green;text-decoration: none;
}
.post_insert_btn_box{
height: 50px;width: 100px;margin: 0 20px 40px auto; 

}
.search-box{height: 50px;margin: 80px 0 100px 0;}
.search-btn{height: 100%;position: relative;right: 52px;bottom: 1px;}
</style>
</head>
<body>
	<div class="post_list_container">
		<div class="post_list_box">
		   <h1>${bo_title}</h1>
		   <div class="hr"></div>
		   <form action="#">
			   <div class="search-box">
				   <input type="search" class="검색" placeholder="검색어를 입력하세요">
				   <button class="search-btn">검색</button>
			   </div>
		   </form>
		   <div class="post_insert_btn_box">
		   	<a href="<c:url value='/board/insert?bo_num=${bo_num}'/>" class="post_insert_btn">작성하기</a>
		   </div>
		   <div>
				<table style="width: 100%;">
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
						 <c:set var="postFound" value="false"/>
                      	 <c:set var="boPostCount" value="0"/> <!-- 각 bo_num별 게시글 수 초기화 -->
							<c:forEach items="${poList}" var="po" varStatus="poIndex">
							  <c:set var="boPostCount" value="${boPostCount + 1}"/> 
								<tr style="height: 100px;border-bottom: 1px solid lightgray;">
									<td style="width: 5%;">${boPostCount}</td>
									<td style="width: 40%;">${po.po_title}</td>
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
		</div>
	</div>
	
</body>
</html>