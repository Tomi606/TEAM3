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
.title {
	display:inline-block;
	text-align:center;
	width:200px;
	font-weight:bold;
}

legend {
	margin-top: 30px;
	font-weight : bold;
}

input {
	display:inline-block;
	text-align:left;
	width:50%;
}

.text-danger {
	text-align:center;
	width:100%;
	font-weight:bold;
}
.fofo{
	width : 100%;
	text-align: center;
}
.fofo label{
	width: 300px;
}
</style>
</head>
<body>
<form class="container" action='<c:url value="/hospital/signup"/>' id="myForm" method="post">
<div class="fofo">
	<fieldset>
		<legend class="mt-3">사업자 회원가입</legend>
			<div >
				<label class="title" for="id">아이디</label>
				<input type="text" id="id" name="ho_id" maxlength="15" placeholder="아이디를 입력하세요."/>
			<!-- 	<button type="button"class="check-duplicate">중복 확인</button> -->
				<label id="id-error" class="error text-danger textId" for="id"></label>
			</div>
			<div>
				<label class="title" for="pw">비밀번호</label>
				<input type="password" id="pw" name="ho_pw" maxlength="18"  required placeholder="비밀번호를 입력하세요."/>
				<label id="pw-error" class="error text-danger" for="pw"></label>
			</div>
			<div>
				<label class="title" for="pw2">비밀번호 확인</label>
				<input type="password" id="pw2" name="ho_pw2" maxlength="18"  required placeholder="비밀번호를 한번 더 입력하세요."/>
				<label id="pw2-error" class="error text-danger" for="pw2"></label>
			</div>
			<div>
				<label class="title" for="email">이메일</label>
				<input type="email" id="email" name="ho_email" readonly value="${email}"/>
				<button type="button" class="email-btn">중복확인</button>
				<label id="email-error" class="error text-danger" for="email"></label>
			</div>
			<div>
				<label class="title" for="name">상호명</label>
				<input type="text" id="name" name="ho_name" required placeholder="상호명을 입력하세요."/>
				<label id="name-error" class="error text-danger" for="name"></label>
			</div>
			<div>
				<label class="title" for="subject">대표 진료과목</label>
				<select id="subject" name="ho_hs_num" required>
					<c:forEach items="${hospitalList}" var="hs">
						<option value="${hs.hs_num}">${hs.hs_title}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<label class="title" for="ceo">대표자명</label>
				<input type="text" id="ceo" name="ho_ceo" required placeholder="대표자명을 입력하세요."/>
				<label id="ceo-error" class="error text-danger" for="ceo"></label>
			</div>
			<div>
				<label class="title" for="num">사업자번호</label>
				<input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="10"
				id="num" name="ho_num" required placeholder="'-'제외한 사업자번호를 입력하세요."/>
				<label id="num-error" class="error text-danger" for="num"></label>
			</div>
			<div>
				<label class="title" for="address">소재지</label>
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
			</div>
			<div>
		    	<label class="title" for="address">상세 주소</label>
				<input type="text" id="address" name="ho_address" required placeholder="상세주소를 입력하세요."/>
				<label id="address-error" class="error text-danger" for="address"></label>			
			</div>
			<div>
				<label class="title" for="phone">대표 전화번호</label>
				<input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="11"
				id="phone" name="ho_phone" required placeholder="'-'제외한 대표 전화번호를 입력하세요."/>
				<label id="phone-error" class="error text-danger" for="phone"></label>
			</div>
	</fieldset>
	<input type="hidden" id="id2" name="site_id">
	<button class="btn btn-outline-success mt-3 col-10 center" type="submit" onclick="hoIdForm()">회원가입</button>
</div>
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
			regex : /^[0-9]{8,11}$/
		}
	},
	//규칙에 대한 메세지
	messages : {
		ho_id : {
			required : "", //message
			regex : ""
		},
		ho_pw : {
			required : "필수 항목입니다.",
			regex : "비번은 숫자, 영문, !@#$ 8~18자 입니다."
		},
		ho_pw2 : {
			equalTo : "비밀번호와 일치하지 않습니다."
		},
		ho_email : {
			required : "",
			email : ""
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
			//,digits : "숫자만 입력하세요."
		},
		ho_address : {
			required : "필수 항목입니다.",
			regex : "소재지 주소를 입력하세요."
		},
		ho_phone : {
			required : "필수 항목입니다.",
			regex : "대표 전화번호는 '-'제외한 번호를 입력하세요."
			//,digits : "숫자만 입력하세요."
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
		//ho_id는 위의 let ho_id
		id : ho_id
	}

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
				$('#id-error').show();
			}
			else {
				$('#id-error').text('이미 사용중인 아이디입니다.');
				$('#id-error').show();
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
</script>

<!-- 시군구, 읍면동 select 띄우기 -->
<script type="text/javascript">
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

<!-- 아이디,이메일 중복체크 ajax 정규표현식 적용 시키기-->
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
	            url: '<c:url value="/hospital/checkId"/>',
	            type: "get",
	            data: { ho_id: id }, 
	            success: function(response) {
	                if (response.hoIdCheck == null) {
	                	 if (id.length >= 8) {
	                	        $(".textId").text("사용 가능한 아이디입니다.").css("color", "blue");
	                	        idCheck = true;
	                	        setTimeout(function() {
	                	            $(".textId").text("");
	                	        }, 2000);
	                	        return;
	                	    }
	                	
	                	}else if(response.hoIdCheck != null&&id.length >= 8){
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
	            url: '<c:url value="/hospital/checkEmail"/>',
	            type: "get",
	            data: { ho_email: email }, 
	            success: function(response) {
	                if (response.hoEmailCheck == null) {
	                	if(email.length >= 12){
	                  	 $(".etext").text("사용 가능한 이메일입니다.");
	                  	 emailCheck = true;
	                  	setTimeout(function() {
	        	            $(".etext").text("");
	        	        }, 2000);
	        	        return;
	        	    }
	                } else if(response.hoEmailCheck != null){
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
    });
});
</script>

<!-- 시도/시군구/읍면동 select -->
<script type="text/javascript">
$("form").submit(function(){
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
		url : '<c:url value="/hospital/signup"/>',
		type : 'post',
		data : formData,
		success:function(data){
			if (data === false) {
		        location.href = '<c:url value="/message"/>?res=' + data;
		    } else {
		        location.href = '<c:url value="/message"/>?res=' + data;
		    }
			
		}
	});
	return false;
})
</script>
</body>
</html>