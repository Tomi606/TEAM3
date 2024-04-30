<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.롤링 {
	margin:100px auto;
	display:flex;
	max-width: 1000px;
	height: 90px;
	border: 1px solid black;
	overflow: hidden;
	position: relative;
}

.롤링-내용 {
	display: flex;
	transition: transform 0.5s ease;
}

.롤링-내용 h1 {
	flex: 0 0 1000px;
	text-align: center;
	line-height: 90px;
	margin: 0;
}
.board_all_home_container{
width: 100%;height: 100%;display: flex;margin: 0 auto;
}
.board_list_container{
width: 1700px;height: 100%;display: grid; grid-template-columns: 1fr 1fr;padding: 25px;
grid
}
.board_list{
	width: 800px;height: 400px;border: 2px solid green;border-radius: 15px;padding: 20px;margin: 10px 10px 100px 10px; overflow: hidden;
}
.board_list:hover{
   box-shadow: 0 8px 16px rgba(0, 128, 0, 0.4);
    transition: box-shadow 0.3s ease;
}
table{
	width: 100%
}
/* .hr{
width: 80%;border: 1px solid lightgray;
} */
.board_name{
	margin: 20px auto 40px auto;
}
.board_header{
width: 100%;display: flex;justify-content: space-between;height: 100px;padding: 20px 30px 0 30px;
}
.a_btn{
width: 70px;height: 50px;border: 1px solid green;color:green; line-height: 50px;border-radius: 10px;text-align: center;
}
.a_btn:hover {
	text-decoration: none; color: white;background-color: green;
}
</style>
</head>
<body>
<div class="롤링">
    <div class="롤링-내용">
		<h1 style="background-color: orange;">첫 번째 내용</h1>
		<h1 style="background-color: green;">두 번째 내용</h1>
		<h1 style="background-color: yellow;">세 번째 내용</h1>
    </div>
</div>
<div class="board_all_home_container">
	<div class="board_list_container">
    <c:choose>
        <c:when test="${not empty boList}">
            <c:forEach items="${boList}" var="bo" varStatus="boIndex">
                <div class="board_list">
                    <div class="board_header">
                        <h2>${bo.bo_title}</h2>
                        <a href="<c:url value="/board/list?bo_num=${bo.bo_num}"/>" class="a_btn">이동하기</a>
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
                                                	<a href="<c:url value='/board/detail?po_num=${po.po_num}'/>">${po.po_title}</a>
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
		var interval = setInterval(roll, 3000); // n초마다 롤링

		function roll() {
			var container = $('.롤링');
			var firstItem = container.find('.롤링-내용 h1:first');
			var itemWidth = firstItem.outerWidth(); // 롤링되는 각 내용의 너비

			container.find('.롤링-내용').animate({
				marginLeft : -itemWidth
			}, 500, function() {
				$(this).append(firstItem.remove()).css({
					marginLeft : 0
				});
			});
		}
	});
</script>

</body>
</html>