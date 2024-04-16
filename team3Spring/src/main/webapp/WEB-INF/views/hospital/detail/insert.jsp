<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
<div class="toggle-page">
	<form action='<c:url value="/hospital/info"/>' method="post" name="page1" id="page1" class="page active">
        <h1>1. ���� �Ұ� ������</h1>
        <div class="info">
        	<label for="hd_info" style="font-weight: bold">���� �Ұ�</label>
        	<input type="text" class="hd_info" id="hd_info" name="hd_info" readonly placeholder="���� �Ұ�"/>
        </div>
        <table class="hd_time" id="hd_time">
	    <thead>
	        <tr>
	            <th>���� �ð�</th>
	        </tr>
	    </thead>
	    <tbody>
	        <tr>
	            <td>������</td>
	            <td><input type="text" class="mon" name="mon" readonly placeholder="9:00~18:00"></td>
	        </tr>
	        <tr>
	            <td>ȭ����</td>
	            <td><input type="text" class="tue" name="tue" readonly placeholder="9:00~18:00"></td>
	        </tr>
	        <tr>
	            <td>������</td>
	            <td><input type="text" class="wed" name="wed" readonly placeholder="9:00~18:00"></td>
	        </tr>
	        <tr>
	            <td>�����</td>
	            <td><input type="text" class="thu" name="thu" readonly placeholder="9:00~18:00"></td>
	        </tr>
	        <tr>
	            <td>�ݿ���</td>
	            <td><input type="text" class="fri" name="fri" readonly placeholder="9:00~18:00"></td>
	        </tr>
	        <tr>
	            <td>�����</td>
	            <td><input type="text" class="sat" name="sat" readonly placeholder="9:00~18:00"></td>
	        </tr>
	        <tr>
	            <td>�Ͽ���</td> 
	            <td><input type="text" class="sun" name="sun" readonly placeholder="9:00~18:00"></td>
	        </tr>
	    </tbody>
	</table>
        <div class="hd_park" id="hd_park">
        	<label for="hd_park" style="font-weight: bold">���� ����</label>
        	<input type="text" class="input-tag" id="hd_park" name="hd_park" readonly placeholder="���� ����"/>
        </div>
        <div class="hd_announce">
        	<label for="hd_announce" style="font-weight: bold">���� ����</label>
        	<input type="text" class="input-tag" id="hd_announce" name="hd_announce" readonly placeholder="���� ����"/>
        </div>
        <div class="hd_etc">
        	<label for="hd_etc" style="font-weight: bold">��Ÿ ����</label>
        	<input type="text" class="input-tag" id="hd_etc" name="hd_etc" readonly placeholder="��Ÿ ����"/>
        </div>
        	<button type="submit" class="info-btn">���� �Ұ� ���</button>
    </form>

    <form action='<c:url value="/hospital/subject"/>' method="post" id="page2" class="page">
        <h1>2. ���� ���� ������</h1>
        <div class="subject-represent">        
	        <label for="subject-represent">��ǥ ���� ����</label>
	        <div class="subject-checkbox">
	        	<c:forEach items="${hsList}" var="hs">
			    	<input type="checkbox" name="subject" value="${hs.hs_num}">${hs.hs_title}
	        	</c:forEach>
	        </div>
        </div>
        <div>
        	<label for="subject-detail">�� ���� �׸�</label>
	       	<input type="text" class="input-tag" id="hd_etc" name="hd_etc" readonly 
	       	placeholder="�� ���� �׸� : ������ ��ȯ / �˷����� / ���� ��ȯ / ȣ��� ��ȯ / �Ǻ� ��ȯ..."/>
        </div>
       	<button type="submit" class="subject-btn" name="subject-btn">���� ���� ���</button>
    </form>

    <form action='<c:url value="/hospital/review"/>' method="post" id="page3" class="page">
        <h1>3. ���� ��ȸ</h1>
        <label for="review">ȸ�� ���̵�</label>
        <textarea id="review" rows="4" cols="70"></textarea>
        <button type="submit" class="review-btn" name="review-btn">���� ���</button>
    </form>
</div>
</body>
</html>