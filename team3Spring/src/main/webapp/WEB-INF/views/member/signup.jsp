<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 
</head>
<body>
<form id="myForm" action="<c:url value="/member/signup"/>" method="post">
	 <select name="sd_num">
        <c:forEach items="${sidoList}" var="sd">
            <option value="${sd.sd_num}">${sd.sd_name}</option>
        </c:forEach>
        </select>	
	 <select name="sgg_num" >
 	<c:choose>
 		<c:when test="${sd_num == sgg_sd_num}">
        <c:forEach items="${sggList}" var="sgg">
                <option value="${sgg.sgg_num}">${sgg.sgg_name}</option>
        </c:forEach>
        </c:when>
       </c:choose>
       </select>	
 	<select name="emd_num" >
        <c:forEach items="${emdList}" var="emd">
                <option value="${emd.emd_num}">${emd.emd_name}</option>
        </c:forEach>
    </select>


	<input type="text" id="id" name="me_id" placeholder="아이디"><br>
	<input type="hidden" id="id2" name="site_id" >
	<input type="password" id="" name="me_pw" placeholder="비밀번호"><br>
	<input type="password" id="" name="me_pw1" placeholder="비밀번호 확인"><br>
	<input type="text" id="" name="me_name" placeholder="이름"><br>
	<input type="text" id="front-num" name="me_frontNum" placeholder="주민등록번호 앞자리" maxlength="6">
	<input type="text" id="back-num" name="me_backNum" placeholder="주민등록번호 뒷자리" maxlength="7" oninput="checkGender()"><br>
	<label for="me_gender">성별:</label>
    <input type="radio" id="male" name="me_gender" value="남자" checked>남자
    <input type="radio" id="female" name="me_gender" value="여자" checked>여자<br>
	<input type="text" id="" name="me_job" placeholder="직업"><br>
	<input type="text" id="" name="me_phone" placeholder="폰번호"><br>
	<input type="text" id="" name="me_email" placeholder="이메일"><br>
	<input type="text" id="" name="me_address" placeholder="주소"><br>
	<button type="submit" id="land1" onclick="meIdForm()">회원가입</button>
	<input type="hidden" id="land2" name="site_la_num">
</form>
 <script type="text/javascript">
//아이디 값 같게 하기 
function meIdForm() {
	var meId = document.getElementById("id").value;
	document.getElementById("id2").value = meId;
	document.getElementById("myForm").submit();
}
</script>	
 <script>
function checkGender() {
	    var backNum = document.getElementById("back-num").value;
	    var genderRadioMale = document.getElementById("male");
	    var genderRadioFemale = document.getElementById("female");
	
	    if (backNum.charAt(0) === '1' || backNum.charAt(0) === '3') {
	        genderRadioMale.checked = true;
	        genderRadioFemale.checked = false;
	        genderRadioFemale.disabled = true;
	    } else if (backNum.charAt(0) === '2' || backNum.charAt(0) === '4') {
	        genderRadioMale.checked = false;
	        genderRadioFemale.checked = true;
	        genderRadioMale.disabled = true;
	    }
}
</script>
</body>
</html>