<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <!-- 제이쿼리 CDN 방식 -->
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js" ></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" ></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/additional-methods.js" ></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/additional-methods.min.js" ></script>
<style type="text/css">
.input-tag{
    border: 1px solid #ccc; 
    outline: none; 
}
.input-tag:focus {
    border-bottom-color: blue; 
}

</style>
</head>
<body>
<form id="myForm" action="<c:url value="/member/signup"/>" method="post">
	 <select name="sd_num" required>
	 		<option value="none">시/도를 선택해주세요</option>
        <c:forEach items="${sidoList}" var="sd">
            <option value="${sd.sd_num}">${sd.sd_name}</option>
        </c:forEach>
     </select>   
	 <select name="sgg_num" class="sgg_num" required>
           <option value="none">시/군/구를 선택해주세요</option>
     </select>   
    <select name="emd_num" class="emd_num" required>
         <option value="none">읍/면/동을 선택해주세요</option>
	 </select>
	 <div>
		<label for="subject">관심 과목</label>
		<select id="subject" name="me_hs_num"  >
			<option value="none">관심 과목을 선택하세요</option>
			<option value="none">없음</option>
			<c:forEach items="${list}" var="hs">
				<option value="${hs.hs_num}">${hs.hs_title}</option>
			</c:forEach>
		</select>
	</div>
	<div>
	    <input type="text" id="id" name="me_id" placeholder="아이디" autofocus="autofocus" class="input-tag">
	    <button type="button" class="check-duplicate">중복 확인</button><br>
	    <label for="id" class="text-danger" id="laId"></label>
	</div>
	<div>
    	<input type="hidden" id="id2" name="site_id">
	</div>
	<div>
    	<input type="password" id="pw" name="me_pw" placeholder="비밀번호" autofocus="autofocus" class="input-tag"><br>
    	<label for="me_pw" class="text-danger"></label>
	</div>
	<div>
   	 	<input type="password" id="pw2" name="me_pw2" placeholder="비밀번호 확인" autofocus="autofocus" class="input-tag"><br>
   	 	<label for="me_pw2" class="text-danger"></label>
	</div>
	<div>
    	<input type="text" id="name" name="me_name" placeholder="이름" autofocus="autofocus" class="input-tag"><br>
    	<label for="me_name" class="text-danger"></label>
	</div>
	<div>
    	<input type="text" id="email" name="me_email" placeholder="이메일" autofocus="autofocus" class="input-tag">
    	<button type="button" class="email-btn">중복확인</button><br>
    	<label for="me_email" class="text-danger"></label>
	</div>
	<div>
    	<label for="me_gender">성별:</label>
    	<input type="radio" id="male" name="me_gender" value="남자" checked="checked">남자
    	<input type="radio" id="female" name="me_gender" value="여자">여자<br>
	</div>
	<div>
   	 	<input type="text" id="job" name="me_job" placeholder="직업" autofocus="autofocus" class="input-tag"><br>
    	<label for="me_job" class="text-danger"></label>
	</div>
	<div>
    	<input type="text" id="phone" name="me_phone" placeholder="폰번호" autofocus="autofocus" class="input-tag"><br>
    	<label for="me_phone" class="text-danger"></label>
	</div>
	<div>
    	<button type="submit" id="land1" onclick="meIdForm()" class="check">회원가입</button>
	</div>

</form>



<!-- me_id입력 시 site_id값도 me_id랑 같은 값 입력 -->
<script type="text/javascript">
    function meIdForm() {
       var meId = $("#id").val(); 
        $("#id2").val(meId);
      return true;
    }
</script>
<!-- 회원가입 정규 표현식 -->
 
<script type="text/javascript">
var sm = {};
$("form").validate({
    rules: {
        me_id: {
            required: true,
            pattern: /^\w{8,15}$/ // 아이디는 8~15자의 영문자와 숫자로 이루어져야 함
        },
        me_pw: {
            required: true,
            pattern: /^[a-zA-Z0-9!@#$]{8,18}$/ // 비밀번호는 8~18자의 영문자, 숫자, 특수문자(!@#$)로 이루어져야 함
        },
        me_pw2: {
            equalTo: pw // 비밀번호 확인은 이전 비밀번호와 일치해야 함
        },
        me_name: {
            required: true,
            pattern: /^[ㄱ-힣]{2,5}$/ // 이름은 2~5글자의 한글로 이루어져야 함
        },
        me_job: {
            required: true,
            pattern: /^[ㄱ-힣]{2,10}$/ // 직업은 2~10글자의 한글로 이루어져야 함
        },
        me_phone: {
            required: true,
            pattern: /^[0-9]{11}$/ // 전화번호는 11자리의 숫자로 이루어져야 함
        },
        me_email: {
            required: true,
            email: true // 이메일 형식이어야 함
        },
        me_address: {
            required: true,
            pattern: /^[ㄱ-힣0-9]{1,100}$/ // 주소는 한글과 숫자로 이루어진 최대 100자여야 함
        }
    },
    messages: {
        me_id: {
            required: "아이디를 입력하세요.",
            pattern: "영문 숫자 2가지 이상 조합 (8~15자)"
        },
        me_pw: {
            required: "비밀번호를 입력하세요.",
            pattern: "영문/숫자/특수문자 2가지 이상 조합 (8~18자)"
        },
        me_pw2: {
            equalTo: "새 비밀번호가 일치하지 않습니다."
        },
        me_name: {
            required: "이름을 입력하세요",
            pattern: "이름을 정확히 입력하세요."
        },
        me_job: {
            required: "직업을 입력하세요.(없으면 무직)",
            pattern: "직업을 정확히 입력하세요."
        },
        me_phone: {
            required: "휴대폰 번호를 정확하게 입력하세요.",
            pattern: "휴대폰 번호를 정확하게 입력하세요."
        },
        me_email: {
            required: "이메일을 입력하세요",
            email: "이메일을 올바르게 입력하세요."
        },
        me_address: {
            required: "필수 항목입니다.",
            pattern: "주소를 올바르게 입력하세요."
        }
    },
    errorPlacement: function(error, element) {
        error.addClass("text-danger"); // 오류 메시지에 클래스 추가
        error.appendTo(element.parent()); // 오류 메시지를 부모 요소에 추가
       return;
    }
});
$.validator.addMethod("customRegex", function(value, element, regexp) {
    var re = new RegExp(regexp);
    return this.optional(element) || re.test(value);
}, "정규표현식에 맞지 않습니다.");
</script>


<script type="text/javascript">
$("form").submit(function(event){
    event.preventDefault(); // 기본 form 제출 이벤트를 막습니다.
    
    var sd_num = $("select[name='sd_num'] option:selected").text();
    var sgg_num = $("select[name='sgg_num'] option:selected").text();
    var emd_num = $("select[name='emd_num'] option:selected").text();
    var str = sd_num + sgg_num + emd_num;
    
    // Serialize된 form 데이터를 직접 사용하고 str 파라미터를 추가합니다.
    var formData = $(this).serialize();
    formData += '&str=' + str; // str 파라미터 추가
    $.ajax({
        async:true,
        url : '<c:url value="/member/signup"/>', // URL을 직접 지정
        type : 'post',
        data : formData,
        success:function(data){
            if (data === false) {
                location.href = '<c:url value="/message?res="/>' + data; // URL을 직접 지정
            } else {
                location.href = '<c:url value="/message?res="/>' + data; // URL을 직접 지정
            }
        }
    });
    return false;
})
</script>


<!-- 시/도,시/군/구,읍/면/동 ajax -->
<script type="text/javascript">
function hoIdForm() {
    var hoId = document.getElementById("id").value;
    document.getElementById("id2").value = hoId;
    document.getElementById("myForm").submit();

    // 비번 일치 확인
    var pw = document.getElementById("pw").value;
    var pw2 = document.getElementById("pw2").value;

    if (pw !== pw2) {
        console.log("비번 불일치");
        return false;
    } else if (pw === pw2) {
        console.log("비번 일치");
        return true;
    } else {
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
				str += ` <option value='\${data[tmp].sgg_num}' selected>\${data[tmp].sgg_name}</option>`;
			}
			$(".sgg_num").html(str);
			
		}, 
        error: function(jqXHR, textStatus, errorThrown) {

        }
    });
});

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
				str += ` <option value='\${data[tmp].emd_num}' selected>\${data[tmp].emd_name}</option>`;
			}
			$(".emd_num").html(str);
			
		}, 
        error: function(jqXHR, textStatus, errorThrown) {

        }
    });
});
/* 읍면동 리스트 select로 띄우기 끝 */

</script>
 <!-- 아이디,이메일 중복체크 ajax 정규표현식 적용 시키기-->
<script type="text/javascript">
$(document).ready(function() {
   var idCheck = false;
    $(".check-duplicate").click(function() {
        var id = $("#id").val();
        if(id.length == 0){
          alert("아이디를 입력해주세요.");
          return;
       }
        if (/[\u3131-\uD79D]/.test(id) || /[!@#$%^&*(),.?":{}|<>]/.test(id)) {
            alert("한글이나 특수문자는 아이디로 사용할 수 없습니다.");
            return; 
        }
        if(!/^\w{8,15}$/.test(id)){
           alert("아이디는 최소 8자에서 15자로 입력 해주세요.")
           return;
        }

        $.ajax({
            url: '<c:url value="/checkId"/>',
            type: "get",
            data: { me_id: id }, 
            success: function(response) {
                if (response.check == null) {
                    alert("사용 가능한 아이디입니다.");
                    idCheck = true;
                    return true;
                } else {
                    alert("이미 사용 중인 아이디입니다.");
                    idCheck = false;
                    return false;
                }
            },
            error: function(xhr, status, error) {
                console.error("에러에러", error);
            }
        });
    });

   var emailCheck = false;
    $(".email-btn").click( function() {
        var email = $("#email").val();
        if (email.length == 0 || email == "") {
           alert("이메일을 입력 하세요.");
            return;
        }
        if (/[\u3131-\uD79D]/.test(email) || /[!#$%^&*(),?":{}|<>]/.test(email)) {
            $("#email-text").text("한글이나 @,.를 제외한 특수문자는 이메일로 사용할 수 없습니다.").css("color" , "red");
            return false;
        }
        $.ajax({
            url: '<c:url value="/checkEmail"/>',
            type: "get",
            data: { me_email: email }, 
            success: function(response) {
                if (response.checkEmail == null) {
                   alert("사용 가능한 이메일입니다.");
                   emailCheck = true;
                    return;
                } else {
                   alert("이미 사용중인 이메일입니다.");
                   emailCheck = false;
                    return;
                }
            },
            error: function(xhr, status, error) {
               alert("이미 사용중인 이메일입니다.");
               emailCheck = false;
                return;
            }
        }); // ajax end;
    });
    $(".check").click(function(){
    	
   		var isValid = $("form").valid();
       if(!idCheck){
          alert("아이디 중복 확인을 해주세요.");
          $("#id").focus();
          return false;
       }
       if(!emailCheck){
          alert("이메일 중복 확인을 해주세요.");
          $("#email").focus();
          return false;
       }
       return isValid; // 유효성 검사 결과 반환
    });
});
</script>

<!-- 폰번호 중복체크 ajax 정규표현식 적용 시키기-->
<script type="text/javascript">
$(document).ready(function() {
   var phoneCheck = false;
    $("#phone").on("keyup",function() {
        var phone = $("#phone").val();
        if(phone.length == 0 || phone == ""){
          alert("전화번호를 입력해 주세요.");
          return;
       }
        if (/[\u3131-\uD79D]/.test(id) || /[!@#$%^&*(),.?":{}|<>]/.test(id)) {
            alert("한글이나 특수문자는 전화번호로 사용할 수 없습니다.");
            return; 
        }
        $.ajax({
            url: '<c:url value="/checkPhone"/>',
            type: "get",
            data: { me_phone: phone }, 
            success: function(response) {
                if (response.checkPhone == null) {
                    $("#checkPhone").text("사용가능한 전화번호입니다.").css("color","green");
                    phoneCheck = true;
                    return true;
                } else {
                	 $("#checkPhone").text("이미 사용중인 전화번호입니다.").css("color","red");
               	 	phoneCheck = false;
                    return false;
                }
            },
            error: function(xhr, status, error) {
                console.error("에러에러", error);
            }
        });
    });
});
</script>
</body>
</html>