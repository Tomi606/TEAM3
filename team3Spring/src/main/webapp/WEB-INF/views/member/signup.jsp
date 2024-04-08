<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <!-- 제이쿼리 CDN 방식 -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
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
<div>
		<label for="subject">관심 과목</label>
		<select id="subject" name="me_hs_num" required >
			<c:forEach items="${list}" var="hs">
				<option value="${hs.hs_num}">${hs.hs_title}</option>
			</c:forEach>
		</select>
	</div>
	<div>
			<input type="text" id="id" name="me_id" placeholder="아이디" ><br>
	</div>
	<div>
			<input type="hidden" id="id2" name="site_id" >
	</div>
	<div>
			<input type="password" id="pw" name="me_pw" placeholder="비밀번호" ><br>
	</div>
	<div>
			<input type="password" id="pw2" name="me_pw2" placeholder="비밀번호 확인" ><br>
	</div>
	<div>
			<input type="text" id="name" name="me_name" placeholder="이름" required><br>
	</div>
	<div>
			<input type="text" id="front-num" name="me_frontNum" placeholder="주민등록번호 앞자리" maxlength="6" >
	</div>
	<div>
			<input type="text" id="back-num" name="me_backNum" placeholder="주민등록번호 뒷자리" 
			maxlength="7" oninput="checkGender()" ><br>
	</div>
	<div>
			<label for="me_gender">성별:</label>
		    <input type="radio" id="male" name="me_gender" value="남자" >남자
		    <input type="radio" id="female" name="me_gender" value="여자" >여자<br>
   	</div>
    <div>
			<input type="text" id="job" name="me_job" placeholder="직업" ><br>
	</div>
	<div>
			<input type="text" id="phone" name="me_phone" placeholder="폰번호" ><br>
	</div>
	<div>
			<input type="text" id="email" name="me_email" placeholder="이메일" ><br>
	</div>
	<div>
			<input type="text" id="address" name="me_address" placeholder="주소" ><br>
	</div>
	<div>
			<button type="submit" id="land1" onclick="meIdForm()">회원가입</button>
	</div>
</form>
 <script type="text/javascript">
//아이디 값 같게 하기 
function meIdForm() {
	var meId = document.getElementById("id").value;
	document.getElementById("id2").value = meId;
	return true;
}
</script>	
 <script>
function checkGender() {
	    var backNum = document.getElementById("back-num").value;
	    var male = document.getElementById("male");
	    var female = document.getElementById("female");
	    
	    male.disabled = false;
        female.disabled = false;
	
	    if (backNum.charAt(0) === '1' || backNum.charAt(0) === '3') {
	    	male.checked = true;
	    	female.checked = false;
	    	female.disabled = true;
	    	male.disabled = false;
	    } else if (backNum.charAt(0) === '2' || backNum.charAt(0) === '4') {
	    	male.checked = false;
	    	female.checked = true;
	        male.disabled = true;
	        female.disabled = false;
	    }
	     else {
	    	male.checked = false;
	    	female.checked = false;
	        male.disabled = true;
	        female.disabled = true;
	     }
   }

</script>

<script type="text/javascript">
$("form").validate({
	//규칙
	rules : {
		me_id : {
			required : true, //message
			regex : /^\w{8,15}$/ //\w : 영어 대소문자 + 숫자
		},
		me_pw : {
			required : true,
			regex : /^[a-zA-Z0-9!@#$]{8,18}$/
		},
		me_pw2 : {
			equalTo : pw //name이 아닌 id를 써 줌
		},
		me_name : {
			required : true,
			regex : /^[ㄱ-힣]{2,5}$/
		},
		me_frontNum : {
			required : true,
			regex : /^[0-9]{6}$/
		},
		me_backNum : {
			required : true,
			regex : /^[0-9]{7}$/
		},
		me_job : {
			required : true,
			regex : /^[ㄱ-힣]{2,10}$/
		},
		me_phone : {
			required : true,
			regex : /^[0-9]{11}$/
		},
		me_email : {
			required : true,
			email : /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
		},
		me_address : {
			required : true,
			regex : /^[ㄱ-힣0-9]{1,100}$/
		}
	},
	//규칙에 대한 메세지
	messages : {
		me_id : {
			required : "필수 항목입니다.", //message
			regex : "아이디는 숫자, 영문 8~15자 입니다."
		},
		me_pw : {
			required : "필수 항목입니다.",
			regex : "비번은 숫자, 영문, !@#$ 8~18자 입니다."
		},
		me_pw2 : {
			equalTo : "비밀번호와 일치하지 않습니다."
		},
		me_name : {
			required : "필수 항목입니다.",
			regex : "이름은 최대 5자 입니다."
		},
		me_frontNum  : {
			required : "필수 항목입니다.",
			regex : "주민번호 앞 자리는 최대 6자이고 숫자만 가능합니다."
		},
		me_backNum : {
			required : "필수 항목입니다.",
			regex : "주민번호 뒷 자리는 최대 7자이고 숫자만 가능합니다."
		},
		me_job : {
			required : "필수 항목입니다.",
			regex : "한글로 입력하세요. 직업은 최대 10자까지 가능합니다."
		},
		me_phone : {
			required : "필수 항목입니다.",
			regex : "전화번호는 '-'제외한 번호를 입력하세요."
		},
		me_email : {
			required : "필수 항목입니다.",
			email : "이메일 양식으로 입력하세요."
		},
		me_address : {
			required : "필수 항목입니다.",
			email : "주소를 제대로 입력하세요."
		}
	}
});
$.validator.addMethod(
		"regex",
		function (value, element, regexp) {
			var re = RegExp(regexp);
			return this.optional(element) || re.test(value);
		},
		"정규표현식에 맞지 않습니다."
	)
</script>

<script type="text/javascript">
function hoIdForm() {
	
	var hoId = document.getElementById("id").value;
	document.getElementById("id2").value = hoId;
	document.getElementById("myForm").submit(); 
	
	//비번 일치 확인
	var pw = document.getElementById("pw").value;
	var pw2 = document.getElementById("pw2").value;

	if(pw !== pw2) {
		console.log("비번 불일치");
		return false;
	}
	else if(pw === pw2) {
		console.log("비번 일치");
		return true;
	}
	else {
		return false;
	}
}
</script>
</body>
</html>