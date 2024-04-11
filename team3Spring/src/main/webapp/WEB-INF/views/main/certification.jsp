<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<div class="form-group">
	<label for="email">이메일 입력</label>
	<input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요." >
</div>
<button class="btn btn-outline-success col-12 btn-email">이메일 인증</button>
<div class="container-spinner">
	이메일을 보내는 중
	<span class="spinner-border text-primary"></span>
</div>

<!-- 이메일 인증 보내기 -->
<script type="text/javascript">
var emailCheck = false;
$(".btn-email").click( function() {
    var email = $("#email").val();
    if (email.length == 0 || email == "") {
       alert("이메일을 입력 하세요.");
        return;
    }
    
    $.ajax({
        url: '<c:url value="/hospital/checkEmail"/>',
        type: "get",
        data: { email: email }, 
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
    
$('.btn-email').click(function() {
	let obj = {
		email : $('[name=email]').val()
	}
	$('.container-spinner').show();
	//서버로 전송
	$.ajax({
		async : true,
		url : '<c:url value="/certification/email"/>', 
		type : 'post', 
		data : obj, 
		dataType : "json", 
		success : function (data){
			if(data.ctfEmail) {
				alert('인증 이메일이 전송되었습니다.');
				return;
			}
			else {
				alert('이메일이 잘못되었습니다.');
				return;
			}
			$('.container-spinner').hide();
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	}); //ajax end
});
</script>
</body>
</html>
