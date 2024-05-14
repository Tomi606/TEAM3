<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
<div class="home-box1">
			<div style="width: 80%;margin: 0 auto;padding-top: 80px">
				<div class="page-title">
					커뮤니티
				</div>
				<div style="text-align: left;display: flex;height: 50px;line-height: 50px; margin: 20px 0 50px 0;">
					<a href="<c:url value='/'/>">
						<img class="top-img" alt="위치 이미지"
						src="<c:url value='/resources/img/home-4-line.svg'/>">
					</a>
					<div style="margin: auto 16px;" >
						<img class="top-img" alt="위치 이미지"
							src="<c:url value='/resources/img/arrow-right-s-line.svg'/>">
					</div>	
					<div style="padding-top: 1px;">
						<a href="<c:url value='/board/all'/>" class="here-title">
							게시판
						</a>
					</div>
				</div>
			</div>
		</div>
<div class="롤링">
    <div class="롤링-내용">
		<div class="rolling-item" style="background-image: url('<c:url value="/resources/img/풍경1.jpg"/>');">
			<img alt="" src="<c:url value="/resources/img/풍경1.jpg"/>" style="width: 1300px;height: 100%;background-repeat: no-repeat;background-size: cover;">
		</div>
		<div class="rolling-item" style="background-image: url('<c:url value="/resources/img/풍경22.jpg"/>');">
			<img alt="" src="<c:url value="/resources/img/풍경22.jpg"/>" style="width: 1300px;height: 100%;background-repeat: no-repeat;background-size: cover;">
		</div>
		<div class="rolling-item" style="background-image: url('<c:url value="/resources/img/풍경3.jpg"/>');">
			<img alt="" src="<c:url value="/resources/img/풍경3.jpg"/>" style="width: 1300px;height: 100%;background-repeat: no-repeat;background-size: cover;">
		</div>
    </div>
</div>
<div class="board_all_home_container">
	<div class="board_list_container">
    <c:choose>
        <c:when test="${not empty boList}">
            <c:forEach items="${boList}" var="bo" varStatus="boIndex">

            	<c:if test="${bo.bo_num > 1}">
	                <div class="board_list">
	                	<div style="margin-bottom: 20px;">
		                	<div class="board_title_img">
		                		<img alt="이미지" src="<c:url value='/resources/img/board_img.png'/>" 
		                			style="width: 100px;z-index: 2;position: absolute;background-color: white;bottom:65px">
		                		
		                	</div>
		                    <div class="board_header">
		                        <h2 style="color: #555;margin-left: 100px">${bo.bo_title}</h2>
		                        <a href="<c:url value="/board/list?bo_num=${bo.bo_num}"/>" class="a_btn">이동하기</a>
		                    </div>
		                 </div>   
	                    <table>
	                        <thead>
	                            <tr style="border-bottom: 1px solid lightgray;text-align: center;">
	                                <th style="width: 5%">No</th>
	                                <th style="width: 40%">제목</th>
	                                <th style="width: 15%">작성자</th>
	                                <th style="width: 20%">날짜</th>
	                                <th style="width: 10%">추천수</th>
	                                <th style="width: 10%">조회수</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <c:choose>
	                                <c:when test="${not empty poList}">
	                                    <c:set var="postFound" value="false"/>
	                                    <c:set var="boPostCount" value="0"/> <!-- 각 bo_num별 게시글 수 초기화 -->
	                                    <c:forEach items="${poList}" var="po" varStatus="poIndex">
	                                        <c:if test="${po.po_bo_num eq bo.bo_num}">
	                                            <c:set var="boPostCount" value="${boPostCount + 1}"/> 
	                                            <tr style="height: 50px;font-size: 17px;text-align: center;border-bottom: 1px solid lightgray">
	                                                <td>${boPostCount}</td>
	                                                <td style="max-width: 30px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
	                                                	<a href="<c:url value='/board/detail?po_num=${po.po_num}'/>" class="title-link">${po.po_title}</a>
	                                                	<a href="<c:url value="/board/detail?po_num=${po.po_num}#comments-section"/>" class="comment-link"> [${po.po_co_count}]</a>
	                                                </td>                             
	                                                <td>${po.po_id}</td>
	                                                <td>${po.changeDate1}</td>
	                                                <td>${po.po_up}</td>
	                                                <td>${po.po_view}</td>
	                                            </tr>
	                                            <c:set var="postFound" value="true"/>
	                                        </c:if>
	                                    </c:forEach>
	                                    <c:if test="${not postFound}">
	                                        <tr>
	                                            <td colspan="6" style="text-align: center;height: 100px;">
	                                                <h3 style="color: lightgray">게시글이 존재하지 않습니다.</h3>
	                                            </td>
	                                        </tr>
	                                    </c:if>
	                                </c:when>
	                            </c:choose>
	                        </tbody>
	                    </table>
	                </div>
                </c:if>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <td>
                <div>
                    <h3>게시판이 존재하지 않습니다.</h3>					
                </div>
            </td>
        </c:otherwise>
    </c:choose>		
</div>

</div>


<script type="text/javascript">
$(document).ready(function() {
    var interval = setInterval(roll, 3000); // 3초마다 롤링

    function roll() {
        var container = $('.롤링');
        var firstItem = container.find('.rolling-item:first');
        var itemWidth = firstItem.outerWidth(); 


        container.find('.롤링-내용').animate({
            marginLeft: -itemWidth
        }, 500, function() {
            $(this).append(firstItem.remove()).css({
                marginLeft: 0
            });
        });
    }
});
</script>

</body>
</html>