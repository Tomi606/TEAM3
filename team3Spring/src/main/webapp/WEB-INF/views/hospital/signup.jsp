<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery validation -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<title>사업자 회원가입</title>
<style type="text/css">
 
</style>
</head>
<body>
<form class="container" action='<c:url value="/hospital/signup"/>' id="myForm" method="post">
	<h1 class="mt-3">사업자 회원가입</h1>
	<div>
		<label for="id">아이디</label>
		<input type="text" id="id" name="ho_id" required placeholder="아이디를 입력하세요."/>
		<label id="id-error" class="error text-danger" for="id"></label>
		<label id="id-error2" class="error text-danger"></label>
	</div>
	<input type="hidden" id="id2" name="site_id">
	<div>
		<label for="pw">비밀번호</label>
		<input type="password" id="pw" name="ho_pw" required placeholder="비밀번호를 입력하세요."/>
		<label id="pw-error" class="error text-danger" for="pw"></label>
	</div>
	<div>
		<label for="pw2">비밀번호 확인</label>
		<input type="password" id="pw2" name="ho_pw2" required placeholder="비밀번호를 한번 더 입력하세요."/>
		<label id="pw2-error" class="error text-danger" for="pw2"></label>
	</div>
	<div>
		<label for="email">이메일</label>
		<input type="email" id="email" name="ho_email" required placeholder="이메일을 입력하세요."/>
		<label id="email-error" class="error text-danger" for="email"></label>
	</div>
	<div>
		<label for="name">상호명</label>
		<input type="text" id="name" name="ho_name" required placeholder="상호명을 입력하세요."/>
		<label id="name-error" class="error text-danger" for="name"></label>
	</div>
	<div>
		<label for="subject">대표 진료과목</label>
		<select id="subject" name="ho_hs_num" required>
			<c:forEach items="${hospitalList}" var="hs">
				<option value="${hs.hs_num}">${hs.hs_title}</option>
			</c:forEach>
		</select>
	</div>
	<div>
		<label for="ceo">대표자명</label>
		<input type="text" id="ceo" name="ho_ceo" required placeholder="대표자명을 입력하세요."/>
		<label id="ceo-error" class="error text-danger" for="ceo"></label>
	</div>
	<div>
		<label for="num">사업자번호</label>
		<input type="text" id="num" name="ho_num" required placeholder="'-'제외한 사업자번호를 입력하세요."/>
		<label id="num-error" class="error text-danger" for="num"></label>
	</div>
	<div>
		<label for="address">소재지</label>
		 <select name="sd_num">
		 <option value="none">선택해주세요</option>
        <c:forEach items="${sidoList}" var="sd">
            <option value="${sd.sd_num}">${sd.sd_name}</option>
        </c:forEach>
        </select>	
	 <select name="sgg_num" class="sgg_num">
           <option value="none">시를 선택해주세요</option>
     </select>	
 	<select name="emd_num" class="emd_num">
         <option value="none">군구를 선택해주세요</option>
    </select>
		<input type="text" id="address" name="ho_address" required placeholder="소재지 상세주소를 입력하세요."/>
		<label id="address-error" class="error text-danger" for="address"></label>
	</div>
	<div>
		<label for="phone">대표 전화번호</label>
		<input type="text" id="phone" name="ho_phone" required placeholder="'-'제외한 대표 전화번호를 입력하세요."/>
		<label id="phone-error" class="error text-danger" for="phone"></label>
	</div>
	<button type="submit" onclick="hoIdForm()">회원가입</button>
</form>
<!-- 정규표현식 -->
<script type="text/javascript">
$("form").validate({
	//규칙
	rules : {
		ho_id : {
			required : true, //message
			regex : /^\w{8,15}$/ //\w : 영어 대소문자 + 숫자
		},
		ho_pw : {
			required : true,
			regex : /^[a-zA-Z0-9!@#$]{8,18}$/
		},
		ho_pw2 : {
			equalTo : pw //name이 아닌 id를 써 줌
		},
		ho_email : {
			required : true,
			email : /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
		},
		ho_name : {
			required : true,
			regex : /^[a-zA-Zㄱ-힣0-9]{1,50}$/
		},
		ho_ceo : {
			required : true,
			regex : /^[ㄱ-힣]{1,5}$/
		},
		ho_num : {
			required : true,
			regex : /^[0-9]{10}$/
		},
		ho_address : {
			required : true,
			regex : /^[a-zA-Zㄱ-힣0-9]{1,100}$/
		},
		ho_phone : {
			required : true,
			regex : /^[0-9]{1,11}$/
		}
	},
	//규칙에 대한 메세지
	messages : {
		ho_id : {
			required : "필수 항목입니다.", //message
			regex : "아이디는 숫자, 영문 8~15자 입니다."
		},
		ho_pw : {
			required : "필수 항목입니다.",
			regex : "비번은 숫자, 영문, !@#$ 8~18자 입니다."
		},
		ho_pw2 : {
			equalTo : "비밀번호와 일치하지 않습니다."
		},
		ho_email : {
			required : "필수 항목입니다.",
			email : "이메일 양식으로 입력하세요."
		},
		ho_name : {
			required : "필수 항목입니다.",
			regex : "상호명은 한영, 숫자 최대50자 입니다."
		},
		ho_ceo : {
			required : "필수 항목입니다.",
			regex : "대표자명은 한글 최대 5자 입니다."
		},
		ho_num : {
			required : "필수 항목입니다.",
			regex : "사업자 번호는 '-'제외한 10자리를 입력하세요."
		},
		ho_address : {
			required : "필수 항목입니다.",
			regex : "소재지 주소를 입력하세요."
		},
		ho_phone : {
			required : "필수 항목입니다.",
			regex : "대표 전화번호는 '-'제외한 번호를 입력하세요."
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

<!-- 아이디 중복 검사 -->
<script type="text/javascript">
function idCheckDup() {
	//입력된 아이디를 가져옴
	let ho_id = $('[name=ho_id]').val();
	let obj = {
		//id는 Controller에 @RequestParam("id")과 일치해야 함
		//ho_id는 위의 ho_id
		id : ho_id
	}
	let idRegex = /^\w{8,15}$/;
	
	let result = false;
	//서버에 아이디를 전송해서 사용 가능.불가능 처리
	$.ajax({
		async : false,
		url : '<c:url value="/id/check/dup"/>', 
		type : 'get', 
		data : obj, 
		dataType : "json", 
		success : function (data){
			result = data.result;
			if(!result) {
				$('#id-error2').show();
			}
			else {
				$('#id-error2').text('이미 사용중인 아이디입니다.');
				$('#id-error2').show();
			}
			
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
	return result;
}
$('[name=ho_id]').on('input', function() {
	idCheckDup();
});
</script>

<!-- 사이트 회원 관리 아이디 + 비번 일치 확인 -->
<script type="text/javascript">
function hoIdForm() {
	
	var hoId = document.getElementById("id").value;
	document.getElementById("id2").value = hoId;
	return true;
	
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

/* 군 구 리스트 select로 띄우기 시작 */
$("[name=sd_num]").click(function(){
	let sd_num = $("[name=sd_num]").val();
	$.ajax({
		method : "post",
		url : '<c:url value="/member/signup/gungoo"/>', 
		data : {"sd_num" : sd_num}, 
		success : function (data){
			let str =""
			for(let tmp in data){
				str += ` <option value='\${data[tmp].sgg_num}'>\${data[tmp].sgg_name}</option>`;
			}
			$(".sgg_num").html(str);
			
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})

/* 읍면동 리스트 select로 띄우기 끝 */

/* 읍면동 리스트 select로 띄우기 시작 */
$("[name=sgg_num]").click(function(){
	let sgg_num = $("[name=sgg_num]").val();
	$.ajax({
		method : "post",
		url : '<c:url value="/member/signup/eupmyeondong"/>', 
		data : {"sgg_num" : sgg_num}, 
		success : function (data){
			let str =""
			for(let tmp in data){
				console.log(data[tmp].emd_name);
				str += ` <option value='\${data[tmp].emd_num}'>\${data[tmp].emd_name}</option>`;
			}
			$(".emd_num").html(str);
			
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})
	/* 읍면동 리스트 select로 띄우기 끝 */
</script>

<!-- 시도, 시군구, 읍면동 Ajax -->
<script type="text/javascript">

</script>
</body>
</html>