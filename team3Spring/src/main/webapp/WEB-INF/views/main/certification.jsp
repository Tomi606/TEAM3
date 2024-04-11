<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 회원가입 이메일 인증</title>
</head>
<body>
	<h1>사업자 회원가입 이메일 인증</h1>
	<div class="container">
		<div class="form-group">
			<label for="email">이메일 입력</label> <input type="text"
				class="form-control" id="email" name="me_email"
				placeholder="이메일을 입력하세요.">
		</div>
		<button class="btn btn-outline-success col-12 btn-email">이메일
			인증</button>
		<div class="form-group ce_numbox"></div>
	</div>


	<!-- 이메일 인증 보내기 -->
	<script type="text/javascript">
/* var emailCheck = false;
$(".btn-email").click( function() {
    var email = $("#email").val();
    if (email.length == 0 || email == "") {
       alert("이메일을 입력 하세요.");
        return;
    }
    
    $.ajax({
        url: '<c:url value="/hospital/checkEmail"/>',
        type: "get",
        data: { me_email: email }, 
        success: function(response) {
            if (response.hoEmailCheck == null) {
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
     */
$('.btn-email').click(function() {
	let obj = {
		email : $('[name=me_email]').val()
	}
	$('.container-spinner').show();
	//서버로 전송
	$.ajax({
		async : 'true',
		url : '<c:url value="/certification/email"/>', 
		type : 'post', 
		data : obj, 
		dataType : "json", 
		success : function (data){
			if(data == null){
				alert("메일 전송에 실패했습니다 다시 시도해주세요");
			}else{
				let str = 
				`
					<label for="ce_num">인증번호</label>
					<input type="text" class="form-control" id="ce_num" name="ce_num" placeholder="인증번호를 입력하세요." >
					<button class="btn btn-outline-success col-12 btn-ce">인증하기</button>
				`
				$('.ce_numbox').html(str);
				$('.btn-ce').click(function(){
				    let newCeNum = $("[name=ce_num]").val();
				    // ceNum 함수의 매개변수로 전달된 값도 함께 보냅니다.
				    console.log("datadata")
				    console.log(data);
				    $.ajax({
				        async : 'true',
				        url : '<c:url value="/certification/num"/>', 
				        type : 'post', 
				        data : { "newCeNum": newCeNum, "data": data.ctfEmail },
				        success: function(data) {
				            if(!data){
				                alert("인증에 실패했습니다");
				            }else{
				                alert("인증에 성공했습니다. 회원가입 페이지로 이동합니다.");
				               	let email= $("[name=me_email]").val();
				               	location.href = '<c:url value="/hospital/signup"/>?email=' + encodeURIComponent(email);
				            }
				        },
				        error: function(xhr, status, error) {
				            // 오류 처리 코드
				        }
				    });
				});
			}
		}, 
	});
});

     function ceNum(ceNum) {
    	 console.log(ceNum)
    	   
    	}

</script>
</body>
</html>
