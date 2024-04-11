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
.body-tag{
padding:200px 0 200px;
width: 100%;
display: felex;flex-direction: column;
align-items: center;
}
.input-box{
	border:1px solid white;
	width: 547px;height:100%; 
	margin: 0 auto;
	padding: 5px;
}
.input-tag{
    border: 1px solid #ccc; 
    outline: none;
    margin-bottom: 15px; 
    width: 500px;
    padding: 20px;
}
.input-tag:focus {
    border-bottom-color: blue; 
    box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
}
.btn{
	text-decoration: none;
	border:1px solid blue;
	width: 100px;
}
.btn:hover {
	background-color: blue;
	color: white;
}
.signup-btn{
text-align:center;font-size:20px;font-weight:bold;
width: 500px;height:40px;border-radius:0;
padding: 2px;border-bottom: 1px solid blue;
margin-left:34px;
}
select {
	margin-left:34px;
    padding: 10px;
    font-size: 16px; 
    border: 1px solid #ccc; 
    background-color: #ffff; 
    outline: none; 
    width: 500px; 
}
select:focus {
    border-color: blue; 
    box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
}
select:hover {
    background-color: #eaeaea;
}
img{
 width: 30px;
}
.duplicate{
    float:right;
	border-radius:0;
	height: 43px;
}
label {
	margin-left: 30px;
}
.gender-buttons {
     display: inline-block;
     margin-right: 15px;
 }
 
 .gender-buttons label {
 	width:100px;text-align:center;
 	border:1px solid  #007bff;
     display: inline-block;
     padding: 8px 16px;
     border-radius: 5px;
     cursor: pointer;
 }
 
 #male:checked + label {
     background-color: #007bff;
     color: #fff;
 }
 
 #female:checked + label {
     background-color: #ff69b4;
     color: #fff;
 }
 
 .gender-buttons input[type="radio"] {
     display: none;
 }

</style>
</head>
<body>
<!-- 중복확인 버튼 때문에 불 필요한 여백 발생하는중 고쳐야 함 -->
<div class="body-tag">
	<form id="myForm" action="<c:url value="/member/signup"/>" method="post">
	<div class="input-box">	
		<div>
	
			<img  alt="아이디이미지" src="<c:url value="/resources/img/user.svg"/>">
		    <input  type="text" id="id" name="me_id" placeholder="아이디" autofocus="autofocus" class="input-tag">
		    <label class="text-danger textId" id="laId"></label>
		  <!--   <a type="button" class="check-duplicate btn duplicate">중복 확인</a> -->
		</div>
		<div>
	    	<input type="hidden" id="id2" name="site_id">
		</div>
		<div>
			<img alt="아이디이미지" src="<c:url value="/resources/img/password.svg"/>">
	    	<input   type="password" id="pw" name="me_pw" placeholder="비밀번호" autofocus="autofocus" class="input-tag">
	    	<label for="me_pw" class="text-danger"></label>
		</div>
		<div>
			<img alt="아이디이미지" src="<c:url value="/resources/img/passwordcheck.svg"/>">
	   	 	<input   type="password" id="pw2" name="me_pw2" placeholder="비밀번호 확인" autofocus="autofocus" class="input-tag">
	   	 	<label for="me_pw2" class="text-danger"></label>
		</div>
		<div>
			<img alt="아이디이미지" src="<c:url value="/resources/img/name.svg"/>">
	    	<input   type="text" id="name" name="me_name" placeholder="이름" autofocus="autofocus" class="input-tag">
	    	<label for="me_name" class="text-danger"></label>
		</div>
		<div>
			<img alt="아이디이미지" src="<c:url value="/resources/img/mail.svg"/>">
	    	<input  type="text" id="email" name="me_email" placeholder="이메일" autofocus="autofocus" class="input-tag">
	    	<!-- <a type="button" class="email-btn btn duplicate">중복확인</a> -->
	    	<label for="me_email" class="text-danger etext"></label>
		</div>
		<div class="gender-buttons">
			<img alt="아이디이미지" src="<c:url value="/resources/img/gender.svg"/>">
	   		 <input type="radio" id="male" name="me_gender" value="남자">
	   		 <label for="male">남자</label>
		</div>

		<div class="gender-buttons">
		    <input type="radio" id="female" name="me_gender" value="여자" >
		    <label for="female"style="border:1px solid #ff69b4;">여자</label>
		</div>
		<div style="margin-top: 15px;">
			<img alt="아이디이미지" src="<c:url value="/resources/img/job.svg"/>">
	   	 	<input   type="text" id="job" name="me_job" placeholder="직업을 입력하세요" autofocus="autofocus" class="input-tag">
	    	<label for="me_job" class="text-danger"></label>
		</div>
		<div>
			<img alt="아이디이미지" src="<c:url value="/resources/img/phone.svg"/>">
	    	<input   type="text" id="phone" name="me_phone" placeholder="핸드폰 번호" autofocus="autofocus" class="input-tag">
	    	<label for="me_phone" class="text-danger textPhone" id="idcheck-phone"></label>
		</div>
		<div class="subject">
		<div class="hr" style="margin-top:30px;margin-bottom:40px;border: 1px solid #d2d2d2;width: 560px;"></div>
			<select id="subject" name="me_hs_num" style="margin-bottom: 15px;width: 500px" >
				<option value="none">관심 병원 과목을 선택하세요</option>
				<option value="none">없음</option>
				<c:forEach items="${list}" var="hs">
					<option value="${hs.hs_num}">${hs.hs_title}</option>
				</c:forEach>
			</select>
		</div>
		<div>
		 <select name="sd_num" required class="sd_num" style="width: 500px;margin-bottom: 20px">
		 		<option value="none">시/도를 선택해주세요</option>
	        <c:forEach items="${sidoList}" var="sd">
	            <option value="${sd.sd_num}">${sd.sd_name}</option>
	        </c:forEach>
	     </select>   
		 <select name="sgg_num" class="sgg_num" required style="width: 500px;margin-bottom: 20px">
	           <option value="none">시/군/구를 선택해주세요</option>
	     </select>   
	    <select name="emd_num" class="emd_num" required style="width: 500px;margin-bottom: 20px">
	         <option value="none">읍/면/동을 선택해주세요</option>
	 	</select>
		</div>
		 
		<div>
	    	<button type="submit" id="land1" onclick="meIdForm()" class="check btn signup-btn">회원가입</button>
		</div>
	</div>	
	</form>
</div>


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
        },
        sd_num :{
        	required:true
        },
        sgg_num :{
        	required:true
        },
        emd_num :{
        	required:true
        }
    },
    messages: {
        me_id: {
            required: "",
            pattern: ""
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
            required: "",
            pattern: ""
        },
        me_email: {
            required: "",
            email: ""
        },
        me_address: {
            required: "필수 항목입니다.",
            pattern: "주소를 올바르게 입력하세요."
        },
        sd_num :{
        	required:"주소를 선택 해주세요"
        },
        sgg_num :{
        	required:"주소를 선택 해주세요"
        },
        emd_num :{
        	required:"주소를 선택 해주세요"
        }
    },
    errorPlacement: function(error, element) {
        error.addClass("text-danger"); 
        error.appendTo(element.parent()); 
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

<script type="text/javascript">
$(document).ready(function() {
   var idCheck = false;
    $("#id").keyup(function() {
        var id = $("#id").val();
        if(id.length == 0||id==""){
          $(".textId").text("아이디를 입력해주세요.");
          return;
       }
        if (!/^\w{8,15}$/.test(id)) {
            $(".textId").text("영문 숫자 2가지 이상 조합 (8~15자)").css("color", "red");
            return;
        }
        if (/[\u3131-\uD79D]/.test(id) || /[!@#$%^&*(),.?":{}|<>]/.test(id)) {
          $(".textId").text("한글이나 특수문자는 아이디로 사용할 수 없습니다.");
          return;
        }
        $.ajax({
            url: '<c:url value="/checkId"/>',
            type: "get",
            data: { me_id: id }, 
            success: function(response) {
                if (response.check == null) {
                	 if (id.length >= 8) {
                	        $(".textId").text("사용 가능한 아이디입니다.").css("color", "blue");
                	        idCheck = true;
                	        setTimeout(function() {
                	            $(".textId").text("");
                	        }, 2000);
                	        return;
                	    }
                	
                	}else if(response.check != null&&id.length >= 8){
                		$(".textId").text("이미 사용중인 아이디입니다.");
                		 idCheck = false;
                } 
            },
            error: function(xhr, status, error) {
                console.error("에러에러", error);
            }
        });
    });
 	var phoneCheck = false;
    $("#phone").keyup(function() {
        var phone = $("#phone").val();
        if(phone.lenght == 0 || phone == "" ||phone.length != 11){
        	$("#idcheck-phone").text("휴대폰 번호를 입력하세요(11자)");
        	return;
        }
        
        $.ajax({
            url: '<c:url value="/checkPhone"/>',
            type: "get",
            data: { me_phone: phone }, 
            success: function(response) {
                if (response.checkNum == null) {
                	if(phone.length == 11){
                    $("#idcheck-phone").text("사용가능한 휴대폰 번호입니다.");
                    phoneCheck = true;
                    setTimeout(function() {
        	            $("#idcheck-phone").text("");
        	        }, 2000);
                    return;
                	}
                } else if(response.checkNum != null||phone.length == 11){
                	 $("#idcheck-phone").text("이미 사용중인 휴대폰 번호입니다.");
               	 	phoneCheck = false;
                    return;
                }
            },
            error: function(xhr, status, error) {
            	 $("#idcheck-phone").text("휴대폰 번호를 제대로 입력해주세요.");
            }
        });
    });  
   var emailCheck = false;
    $("#email").on("keyup",function() {
        var email = $("#email").val();
        if (email.length == 0 || email == "") {
           $(".etext").text("이메일을 입력하세요.");
            return;
        }
        if (email.length < 12) {
           $(".etext").text("이메일을 올바르게 입력하세요.");
            return;
        }
        if (!email.endsWith('.com')||
        		email.indexOf('.com') != email.lastIndexOf('.com')) {
            $(".etext").text("올바른 이메일 주소를 입력하세요 (예: example@example.com).");
            return;
        }
        $.ajax({
            url: '<c:url value="/checkEmail"/>',
            type: "get",
            data: { me_email: email }, 
            success: function(response) {
                if (response.checkEmail == null) {
                	if(email.length >= 12){
                  	 $(".etext").text("사용 가능한 이메일입니다.");
                  	 emailCheck = true;
                  	setTimeout(function() {
        	            $(".etext").text("");
        	        }, 2000);
        	        return;
        	    }
                } else if(response.checkEmail != null){
               		$(".etext").text("이미 사용중인 이메일입니다.");
                   emailCheck = false;
                   return;
                }
            },
            error: function(xhr, status, error) {
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
       if (!phoneCheck) {
    	  alert("휴대폰 중복 확인을 해주세요.");
    	  $("#phone").focus();
    	  return false;
	}
       return isValid; 
    });
});
</script>
</body>
</html>